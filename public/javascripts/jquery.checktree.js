/**
    Project: CheckTree jQuery Plugin
    Version: 0.22
    Project Website: http://static.geewax.org/checktree/
    Author: JJ Geewax <jj@geewax.org>
    
    License:
        The CheckTree jQuery plugin is currently available for use in all personal or 
        commercial projects under both MIT and GPL licenses. This means that you can choose 
        the license that best suits your project, and use it accordingly.
*/
(function(jQuery) {
jQuery.fn.checkTree = function(settings) {
    
    settings = jQuery.extend({
        /* Callbacks
            The callbacks should be functions that take one argument. The checkbox tree
            will return the jQuery wrapped LI element of the item that was checked/expanded.
        */
        onExpand: null,
        onCollapse: null,
        onCheck: null,
        onUnCheck: null,
        onHalfCheck: null,
        onLabelHoverOver: null,
        onLabelHoverOut: null,
        onLoad: null,
        
        /* Valid choices: 'expand', 'check' */
        labelAction: "expand",
        
        // Debug (currently does nothing)
        debug: false
    }, settings);

	var toggleList = function( element ) {
		var $this = jQuery(element),
			$parent = $this.parent();

        if ($this.hasClass("collapsed")) {
            $this
                .addClass("expanded")
                .removeClass("collapsed")
            ;
            if (settings.onExpand) settings.onExpand($parent);
        } else {
            $this
                .addClass("collapsed")
                .removeClass("expanded")
            ;
            if (settings.onCollapse) settings.onCollapse($parent);
        }
		if($this.closest('#feature_types_accordion').length != 0){
			$this.siblings("ul").toggle(400);
		}else{
			$this.siblings("ul").toggle();							
		}
	};
    
    var $tree = this;
    
    $tree.find("li")
        
        // Hide all checkbox inputs
        .find(":checkbox")
            .change(function() {
                // Fired when the children of this checkbox have changed.
                // Children can change the state of a parent based on what they do as a group.
                var $this = jQuery(this),
					$all = $this.siblings("ul").find(":checkbox"),
					$checked = $all.filter(":checked"),
                	$this_checkbox = $this.siblings(".checkbox");
                
                // All children are checked
                if ($all.length == $checked.length) {
                
                	// Already checked
                	if ($this_checkbox.hasClass("checked")) {
                	}
                	
                	// Isn't checked, but has checked children, so half_check it
                	else {
						//jQuery(this).attr("checked", "checked");
						$this_checkbox.removeClass("half_checked");
						$this_checkbox.addClass("checked");
                    }
                }
                
                // All children are unchecked
                else if($checked.length == 0) {
                    $this
                        //.attr("checked", "")
                        .siblings(".checkbox")
                            .removeClass("checked")
                            .removeClass("half_checked")
                    ;
                }
                
                // Some children are checked, makes the parent in a half checked state.
                else { 
                    // Fire parent's onHalfCheck callback only if it's going to change
                    if (settings.onHalfCheck && !$this.siblings(".checkbox").hasClass("half_checked"))
                        settings.onHalfCheck($this.parent());
                    
                    $this
                        //.attr("checked", "")
                        .siblings(".checkbox")
                            .removeClass("checked")
                            .addClass("half_checked")
                    ;
                }
            })
            .css("display", "none")
        .end()
        
        .each(function() {
            var $this = jQuery(this);

            // Go through and hide only ul's (subtrees) that do not have a sibling div.expanded:
            // We do this to not collapse *all* the subtrees (if one is open and checkTree is called again)
            $this.find("ul").each(function() {
                if (!jQuery(this).siblings(".expanded").length) jQuery(this).hide();
            });
            
            // Copy the label
            var $label = $this.children("label").clone();
            // Create or the image for the checkbox next to the label
            var $checkbox = jQuery("<div class=\"checkbox\"></div>");
            // Create or the image for the checkbox next to the label
            var $single_checkbox = jQuery("<div class=\"single_checkbox\"></div>");
            // Create the image for the arrow (to expand and collapse the hidden trees)
            var $arrow = jQuery("<div class=\"arrow\"></div>");
            
            // If the li has children:
            if ($this.is(":has(ul)")) {
                // If the subtree is not visible, make the arrow collapsed. Otherwise expanded.
                if ($this.children("ul").is(":hidden")) $arrow.addClass("collapsed");
                else $arrow.addClass("expanded");
                
                // When you click the image, toggle the child list
                $arrow.click(function() {
					toggleList(this);
                });
            }
            
            // When you click the checkbox, it should do the checking/unchecking
            $checkbox.click(function() {
				var $this = jQuery(this),
					$siblings = $this.siblings('ul');

                // Toggle the checked class)
                $this
                    .toggleClass("checked")
                    // if it's half checked, its now either checked or unchecked
                    .removeClass("half_checked")
                ;
                
                // Check/uncheck children depending on our status.
                if ($this.hasClass("checked")) {
                    // Fire the check callback for this parent
                    //if (settings.onCheck) settings.onCheck(jQuery(this).parent());
                    
                    // Go to the sibling list, and find all unchecked checkbox images
                    $siblings.find(".checkbox").not(".checked")
                        // Set as fully checked:
                        .removeClass("half_checked")
                        .addClass("checked")
                    ;
                    $siblings.find(".single_checkbox").not(".checked")
                        // Set as fully checked:
                        .addClass("checked")
                        
                        // For each one, fire the onCheck callback
                        .each(function() {
                            if (settings.onCheck) settings.onCheck($this.parent());
                        })
                        
                        // For each one, check the checkbox (actual input element)
                        .siblings(":checkbox")
                            .attr("checked", "checked")
                    ;
                    
                    //jQuery(this).siblings(".single_checkbox").addClass("checked");
                }
                
                // If Unchecked:
                else {
                    // Fire the uncheck callback for this parent
                    //if (settings.onUnCheck) settings.onUnCheck(jQuery(this).parent());
                    
                    // Go to the sibling list and find all checked checkbox images
                    $siblings.find(".checkbox").filter(".checked")
                        // Set as fully unchecked
                        .removeClass("half_checked")
                        .removeClass("checked")
                    ;
                    $siblings.find(".single_checkbox").filter(".checked")
                        // Set as unchecked:
                        .removeClass("checked")
                        
                        // For each one fire the onUnCheck callback
                        .each(function() {
                            if (settings.onUnCheck) settings.onUnCheck($this.parent());
                        })
                        
                        // For each one, uncheck the checkbox (the actual input element)
                        .siblings(":checkbox")
                            .attr("checked", "")
                    ;
                    
                    //jQuery(this).siblings(".single_checkbox").removeClass("checked");
                }
                
                // Tell our parent checkbox that we've changed (they might need to change their state)
                $this.parents("ul").siblings(":checkbox").change();
            });
            
            // When you click the single_checkbox, it should 1) fire callback, and 2) send a message up tree
            $single_checkbox.click(function() {
                var $this = jQuery(this);
				// Toggle the checked class)
                $this.toggleClass("checked");
                
                // Check/uncheck children depending on our status.
                if ($this.hasClass("checked")) {
                
					// If this is a single selection tree, remove all other checked single_checkboxes
					// (regular checkboxes are hidden and won't be used at all)
					if($this.parents(".single_selection_tree").length > 0){
						$this.parents(".single_selection_tree").find(".single_checkbox").filter(".checked")
							.removeClass("checked")
							.siblings(":checkbox").attr("checked", "");
						$this.addClass("checked");
					}
					
                    // Fire the check callback for this parent
                    if (settings.onCheck) settings.onCheck($this.parent());
                    
                    // The :checkbox is tied to this single_checkbox, so check it
					$this.siblings(":checkbox")
						.attr("checked", "checked")
					;
                }
                
                // If Unchecked:
                else {
                    // Fire the uncheck callback for this parent
                    if (settings.onUnCheck) settings.onUnCheck($this.parent());
                    
                    // The :checkbox is tied to this single_checkbox, so uncheck it
					$this.siblings(":checkbox")
						.attr("checked", "")
					;
                }
                
                // Tell our parent checkbox that we've changed (they might need to change their state)
                $this.parents("ul").siblings(":checkbox").change();
            });
            
            // Add the appropriate classes to the new checkbox image based on the old one:
            if ($this.children(".checkbox").hasClass("checked"))
                $checkbox.addClass("checked");
            else if ($this.children(":checkbox").attr("checked")) {
                $checkbox.addClass("checked");
                $this.parents("ul").siblings(":checkbox").change()
            }
            else if ($this.children(".checkbox").hasClass("half_checked"))
                $checkbox.addClass("half_checked");
            
            // Remove any existing arrows or checkboxes or labels
            $this.children(".arrow").remove();
            $this.children(".checkbox").remove();
            $this.children("label").remove();
            
            // Prepend the new arrow, label, and checkbox images to the front of the LI
            $this
                .prepend($label)
                .prepend($single_checkbox)
                //.prepend($checkbox)
            ;
            
            if ($this.children("ul").length == 0) {
				$checkbox.css('display', 'none');
				var $checkbox_placeholder = jQuery("<div class=\"checkbox_placeholder\"></div>");
				$this.prepend($checkbox_placeholder)
            }
            else $this.prepend($arrow);
        })
        
        .find("label")
            // Clicking the labels should do the labelAction (either expand or check)
            .click(function() {
                var action = settings.labelAction;
                switch(settings.labelAction) {
                    case "expand":
                        jQuery(this).siblings(".arrow").click();
                        break;
                    case "check":
                        jQuery(this).siblings(".checkbox").click();
                        break;
                }
            })
            
            // Add a hover class to the labels when hovering
            .hover(
                function() { 
                    var $this = jQuery(this);
					$this.addClass("hover");
                    if (settings.onLabelHoverOver) settings.onLabelHoverOver($this.parent());
                },
                function() {
					var $this = jQuery(this);
                    $this.removeClass("hover");
                    if (settings.onLabelHoverOut) settings.onLabelHoverOut($this.parent());
                }
            )
        .end()
    ;
    
    if (settings.onLoad) settings.onLoad();

    return $tree;
};
})(jQuery);