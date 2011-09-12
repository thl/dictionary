function include(arr, obj) {
    for(var i=0; i<arr.length; i++) if (arr[i] == obj) return true;
    return false;
}

function ModelSearcher(){
	// URL for JSON that lists categories in the form [{"name":"Agricultrure","id":4074},{"name":"Agriculture","id":2558}]
	this.listService = "";
	
	// URL for JSON that lists categories in a hierachy (see ModelSearch.createTreeFromArray() for details)
	this.treeService = "";
	
	// A script on the same subdomain. When a URL is appended to this string, the resulting URL should return the original URL's content.
	// The proxy can be bypassed by using service URLs that don't begin with "http" (and are thus on the subdomain and don't need a proxy)
	this.proxy = "";
	
	// The id attribute of the div which contains all of DOM elements for this 
	this.divId = "";
	
	// The jQuery-wrapped DOM element of the div which contains all of DOM elements for this
	this.div = null;
	
	// The name, label, and style attributes of the hidden field in which the selected ID(s) will be entered
	this.hiddenFieldName = "searcher_id_input";
	this.fieldLabel = "";
	this.fieldStyle = "padding:3px; width: 161px";
	
	// Another method of adding objects (instead of using services)
	this.objectList = null;
	
	// A JS array of the object(s) which should be selected in the form [{id: '2594', name: 'animals'}]
	this.selectedObjects = [];
	
	// The jQuery-wrapped DOM element of the hidden input which stores the selected ID(s)
	this.hiddenIdInput = null;
	
	// The jQuery-wrapped DOM element of the autocomplete text field input
	this.autocompleteInput = null;
	
	// Whether or not a tree (and the accompanying tree link) should be used 
	this.hasTree = true;
	
	// Whether we are building this interface for category selection (editing interface) or searching (public interface)
	this.searcher = false;
	
	// ID of category to use as starting point for topic filter and/or auto-complete
	this.selectedRoot = null;
	this.selectedRootOriginal = null;
	
	// Whether the user can select only one category from the tree (if present) or select multiple categories
	this.singleSelection = false;
	
	// The id attribute of the div which contains the tree popup
	this.treePopupId = null;
	
	// The jQuery-wrapped DOM element of the div which contains the tree popup
	this.treePopup = null;
	
	// The jQuery-wrapped DOM element that lists the names selected from the tree
	this.treeNames = null;
	
	// The jQuery-wrapped DOM element that removes the names selected from the tree
	this.treeRemove = null;
	
	this.treeHtml = null;
	
	// See the attribute documentation above for explanations of these arguments
	this.reinit = function(divId, options) {
		var el = document.getElementById('root_topics'),
			selectedRoot = options['selectedRoot'],
			varname = options['varname'],
			listService, treeService;
			
		if ( !this.selectedRootOriginal ) this.selectedRootOriginal = selectedRoot;

		if (!selectedRoot) {
			var	id = el.value,
				label = el.options[el.selectedIndex].text;
		} else if (selectedRoot && selectedRoot != 'All') {
			var id = selectedRoot;
		} else {
			var id = label = '';
		}

		if ( id != 'All' && id.length > 0) {
			options['hasTree'] = true;
			options['fieldLabel'] = label;
			listService = options['list_url_topic'].replace('{id}', id);
			treeService = options['all_url_topic'].replace('{id}', id);
	    } else {
	       	listService = options['list_url_root'];
			treeService = options['all_url_root'];
		}

		window[varname].init(divId, listService, treeService, options);
	};
	
	this.init = function(divId, listService, treeService, options) {
		var that = this,
			root_topics = document.getElementById('root_topics'),
			div = jQuery('#'+divId);

		this.varname = options['varname'];
		this.cRowSelector = '#' + this.varname + '_characteristic-row';
		this.bRowID = this.varname + '_bin';
		this.binItemTemplate = '<span id="' + this.varname + '_bin_item_{id}" class="tree-names" style="line-height:19px;white-space:nowrap;padding:2px 3px 2px 2px; color:#404040; background-color:#f1f1f1; border:1pt #ccc solid;margin-right:3px;font-size:7pt"><a href="#" class="tree-remove"><img src="/images/delete.png" height=16 width=16 border=0 alt="x" style="display:inline;position:relative;top:4px;left:-2px"/></a>{content}</span> ';
		this.listService = listService;
		this.treeService = treeService;
		if(typeof(options.searcher) != "undefined")				{ this.searcher = options.searcher; }		
		if(typeof(options.fieldName) != "undefined")			{ this.fieldName = options.fieldName; }
		if(typeof(options.fieldLabel) != "undefined")			{ this.fieldLabel = options.fieldLabel; }
		if(typeof(options.selectedObjects) != "undefined")		{ this.selectedObjects = options.selectedObjects; }
		if(typeof(options.hasTree) != "undefined")				{ this.hasTree = options.hasTree; }
		if(typeof(options.singleSelection) != "undefined")		{ this.singleSelection = options.singleSelection; }
		if(typeof(options.proxy) != "undefined")				{ this.proxy = options.proxy; }
		this.binHiddenFieldTemplate = '<input type="hidden" name="'+this.fieldName+'" id="' + this.hiddenFieldName + '_' + this.varname + '" value="{value}" />'
		this.divId = divId;
		this.table = jQuery('tr[id^=' + this.varname + ']').first().closest('.mobj');
		this.div = div.length ? div : this.table.wrap('<div />').parent().attr('id',this.divId);

		if (this.searcher) { //( this.fieldLabel.indexOf('Feature Type') > -1 ) {
			this.div.html(
						(this.fieldLabel ? '<label for="'+this.fieldName +'_' + this.varname + '">'+this.fieldLabel+'</label>' : '') +
						'<input type="text" name="searcher_autocomplete" id="searcher_autocomplete_' + this.varname + '" style="'+this.fieldStyle+'" />'+
						this.binHiddenFieldTemplate.replace('{value}', '')
						);
		}
		this.autocompleteInput = jQuery('#searcher_autocomplete_' + this.varname);
		this.hiddenIdInput = jQuery('#' + this.hiddenFieldName + '_' + this.varname);

		// Request the service through a proxy if it's not local
		if(this.listService.substr(0,4) == 'http'){
			this.listService = this.proxy+this.listService;
		}
		if(this.treeService.substr(0,4) == 'http'){
			this.treeService = this.proxy+this.treeService;
		}

		jQuery.getJSON(this.listService, function(data){
			that.autocompleteInput.unautocomplete().autocomplete(data, {
				matchContains: true,
				mustMatch: true,
				max: 20,
				formatItem: that.autocompleteFormatItem,
				formatMatch: that.autocompleteFormatMatch,
				formatResult: that.autocompleteFormatItem,
				multiple: !this.searcher
			});
			that.autocompleteInput.result(that.autocompleteCallback);
			that.objectList = {};
			for(var i in data){
				that.objectList[data[i].id] = data[i];
			}
		});
		if(this.selectedObjects && this.selectedObjects.length == 1){
			this.autocompleteInput.val(this.selectedObjects[0].name);
			this.hiddenIdInput.val(this.selectedObjects[0].id);
		}

		if(this.hasTree){
			this.treePopupId = this.varname + "_model_searcher_tree_popup";
			this.treeLoading = this.div.find('.tree-loading');
			if ( this.searcher ) {
				this.div.append('<br />Input type above or <a href="#" class="tree-link">select from tree</a>'+
								'<span class="tree-names"></span> <a href="#" class="tree-remove">(remove)</a><span class="tree-loading" style="float:right;"></span>');
				this.treeLink = this.div.find('.tree-link');
				this.treeRemove = this.div.find('.tree-remove');
				this.treeNames = this.div.find('.tree-names');
				this.treeRemove.hide();
				this.treeRemove.click(function(){
					thisModelSearcher.treeNames.html('');
					thisModelSearcher.treeRemove.hide();
					thisModelSearcher.hiddenIdInput.val('');
					thisModelSearcher.selectedObjects = []
					return false;
				});
				this.treeLink.click(function(){
					jQuery('.draggable-popup').hide();
					if(thisModelSearcher.treeLoaded){
	 					jQuery('#'+thisModelSearcher.treePopupId).show();
	 				}else{
						thisModelSearcher.treeLoading.html(' <img src="../images/ajax-loader.gif" />');
						jQuery.getJSON(thisModelSearcher.treeService, function(data){
							thisModelSearcher.treeHtml = thisModelSearcher.createTreeFromArray(data.category ? data.category.categories : data.categories);
							thisModelSearcher.loadPopup();
							thisModelSearcher.treeHtml = null;
							data = null;
							thisModelSearcher.treeLoading.html('');
							thisModelSearcher.treeLoaded = true;
						});
					}
					return false;
				});
			}
		}
		bRow = jQuery('td#' + this.bRowID);
		jQuery('.tree-remove', bRow).unbind('click'); // this and below have to be separate because live can't be chained
		bRow.delegate('.tree-remove', 'click', function(){
			var $selection = jQuery(this).closest('.tree-names'),
				$target = $selection.siblings().length ? $selection : $selection.closest('tr');
			
			$selection.fadeOut( function(){
				var id = this.id.replace(that.varname + '_bin_item_',''); /*,
					regex = new RegExp('(^|,)' + id + '(,|$)'),
					val = that.hiddenIdInput[0].value; */
				$target.remove();
				if (that.singleSelection) {
					that.hiddenIdInput[0].value = '';
				} else
				{	/* This doesn't work in safari in unpredictable cases!!!
				    jQuery('input#' + that.hiddenFieldName + '_' + that.varname + '[value=' + id + ']').remove(); */
					bRow.find('input#[value=' + id + ']').remove();
				}
				that.checkAnnotationState();
			});
			return false;
		});
		
		/* if ( root_topics && root_topics.value != 'All' ) {
			jQuery('#browse_link_' + that.varname).unbind('click').show().click(function() { that.activatePopup() });
		}*/
		jQuery('#browse_link_' + that.varname).unbind('click').click(function() { that.activatePopup() });
	};
	
	this.activatePopup = function() {
		var that = this;
		if(window['activeTree'] == this.treeService ){
			jQuery('#'+this.treePopupId).show();
		}else{
			var $test = jQuery('#tree-loader-img'),
				$img = $test.length ?
								$test.show() :
								jQuery("<img id='tree-loader-img' src='/images/loading.gif' align='right' />").insertAfter('#browse_link_' + that.varname);
			jQuery.getJSON(this.treeService, function(data){
				that.treeHtml = that.createTreeFromArray(data.category ? data.category.categories : data.categories);
				that.loadPopup();
				that.treeHtml = null;
				data = null;
				window['activeTree'] = that.treeService;
				$img.hide();
			});
		}
		return false;
	}
	
	this.loadPopup = function(){
		var that = this;
		this.treePopup = jQuery().draggablePopup({
			id: that.treePopupId,
			header: '',
			content: '',
			footer: '',
			width: 500,
			closeWith: 'hide'
		});
		var content = '<div style="font-size: 12px; line-height: 1.1em; height: 500px;"><br />'+
			'<div>Please select one or more feature types from the list below.<br /><br />'+
			'For each type, click on the left box to select the type and its subcategories; '+
			'click on the right box to select only the type without its subcategories.</div><br />'+
			'<form method="get" action="">'+
			'<div'+(that.singleSelection ? ' class="single_selection_tree"' : '' )+
			' style="max-height: 400px; height:auto !important; height: 400px; overflow: auto;">'+
			that.treeHtml+
			'</div>'+
			'<br /><input type="submit" value="Select" /> <input type="button" value="Cancel" onclick="jQuery(this).parents(\'.draggable-popup:first\').hide(); return false;" />'+
			'</form>'+
			'</div>'
			;
		that.treePopup.setContent(content);
		that.treePopup.div.checkTree({ onExpand: function( $parent ) {$parent.siblings().find('.expanded').click()}});
		that.treePopup.div.find('form:first').submit(function(){
			var ids = [];
			var names = [];

			jQuery(this).find(':checkbox:checked').each(function(){
				var $label = jQuery(this).siblings('label');
				var label_name = $label.attr('name');
				if(label_name.indexOf('record_') == 0){
					ids.push(label_name.substring(7));
					names.push($label.html());
				}
			});
			if (ids.length) {
				if (that.searcher) { //( that.fieldLabel.indexOf('Feature Type') == -1 ) {
					for(i in ids) {
						id = ids[i]
						id_int = parseInt(id)
						if (!include(that.selectedObjects, id_int))
						{
							that.selectedObjects.push(id_int)
							if (that.hiddenIdInput[0].value.length==0) {
								that.hiddenIdInput.val(id);
								that.treeNames.html(':<br />'+names[i]);
							}
							else {
								that.hiddenIdInput.val(that.hiddenIdInput[0].value+','+id);
								that.treeNames.html(that.treeNames[0].innerHTML + ', ' + names[i]);
							}
						}
					}
					that.autocompleteInput.val('');
					that.treeRemove.show();
				} else {
					that.addValue( ids );
				}
			}
			jQuery('#'+that.treePopupId).hide();
			return false;
		});

		// For large trees, keeping this in memory can cause performance issues, so we'll set it to null
		// and use thisModelSearcher.treePopupId when we need it.
		that.treePopup = null;
	};
	
	this.addValue = function( ids ) {
		var that = this,
			i,
			ids = ids || [];
			$bRow = jQuery('td#' + that.bRowID);
		if (that.searcher) {
			for(i in ids) {
				id = ids[i]
				object = that.objectList[id];
				if (!include(that.selectedObjects, id))
				{
					that.selectedObjects.push(id)
					if (that.hiddenIdInput[0].value.length==0) {
						that.hiddenIdInput.val(id);
						that.treeNames.html(':<br />'+object.name);
					}
					else {
						that.hiddenIdInput.val(that.hiddenIdInput[0].value+','+id);
						that.treeNames.html(that.treeNames[0].innerHTML + ', ' + object.name);
					}
				}
			}
			that.treeRemove.show();
		} else {
			if ($bRow.length==0) $bRow = jQuery("<tr><td></td><td colspan='2' style='padding-top:1px; padding-bottom:4px' id='" + that.bRowID + "'></td></tr>").insertAfter(jQuery(that.cRowSelector)).find('td#' + that.bRowID);
			if (that.singleSelection)
			{
				id = ids[0];
				object = that.objectList[id];
				that.selectedObjects.push(object);
				that.hiddenIdInput[0].value = id;
				spans = jQuery('span.tree-names', $bRow);
				if (spans.length==0) {
					$bRow.append(that.binItemTemplate.replace('{content}', object.name).replace('{id}', id));
				}
				else {
					if (spans.length>1) spans.slice(1).remove();
					spans.replaceWith(that.binItemTemplate.replace('{content}', object.name).replace('{id}', id));
				}
			}
			else
			{
				for(i in ids){
					id = ids[i]
					if ( jQuery('#'+that.varname+'_bin_item_'+id, $bRow).length==0 ) {
						that.selectedObjects.push(that.objectList[id]);
						$bRow.append(that.binItemTemplate.replace('{content}', that.objectList[id].name).replace('{id}', id));
					}
					if ( jQuery('input#[value=' + id + ']', $bRow).length==0 ) {
						$bRow.append(that.binHiddenFieldTemplate.replace('{value}', id));
					}
				}
			}
			this.checkAnnotationState();
		}
		that.autocompleteInput.val('');
	}
	
	this.checkAnnotationState = function() {
		bRow = jQuery('td#' + this.bRowID);
		if ( jQuery('.tree-names', bRow).length > 1 ) {
			annotations = bRow.parent().nextAll().filter('.annotation');
			jQuery('input', annotations).attr('disabled', 'disabled');
			annotations.fadeOut();
			// jQuery('.annotation', bRow).find('input').closest('tr').fadeOut();
		} else {
			annotations = bRow.parent().nextAll().filter('.annotation');
			jQuery('input', annotations).removeAttr('disabled');
			annotations.fadeIn();
			// jQuery('.annotation', bRow).fadeIn().find('input').removeAttr('disabled');
		}
	}
	
	this.resetFields = function(){
		this.autocompleteInput.val('');
		this.hiddenIdInput.val('');
		if(this.hasTree){
			this.treeNames.html('');
			this.treeRemove.hide();
			jQuery('#'+this.treePopupId).hide();
		}
	};
	
	this.autocompleteFormatItem = function(item, i, max){
		return jQuery.trim(item.name);
	};
	
	this.autocompleteFormatMatch = function(item, i, max){
		return jQuery.trim(item.name);
	};
	
	this.autocompleteFormatResult = function(item, i, max){
		return item.id;
	};
	var thisModelSearcher = this;
	this.autocompleteCallback = function(event, data, formatted) {
		if(data){
			thisModelSearcher.addValue([data.id])
		}else{
			thisModelSearcher.hiddenIdInput.val('');
		}
		/* thisModelSearcher.treeNames.html('');
		thisModelSearcher.treeRemove.hide(); */
		return false;
	};
	
	this.createTreeFromArray = function(arr){
		var html = '';
		if(arr && arr.category){
			html += '<ul class="tree">';
			if(arr.category && arr.category[0]){
				for(var i in arr.category) {
					html += '<li>';
					html += '<input type="checkbox" class="toggle"><label name="record_'+arr.category[i].id+'">'+arr.category[i].title+'</label>';
					if(arr.category[i].categories){
						html += this.createTreeFromArray(arr.category[i].categories);
					}
					html += '</li>';
				}
			}else if(arr.category){
				html += '<li>';
				html += '<input type="checkbox" class="toggle"><label name="record_'+arr.category.id+'">'+arr.category.title+'</label>';
				if(arr.category.categories){
					html += this.createTreeFromArray(arr.category.categories);
				}
				html += '</li>';
			}
			html += '</ul>';
		}
		return html;
	}

};