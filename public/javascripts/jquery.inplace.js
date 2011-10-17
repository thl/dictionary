/**
 * Software License Agreement (BSD License)
 * 
 * Copyright (c) 2008, Dave Hauenstein
 * All rights reserved.
 * 
 * Redistribution and use of this software in source and binary forms, with or
 * without modification, are permitted provided that the following conditions
 * are met:
 * 
 * - Redistributions of source code must retain the above copyright notice,
 *   this list of conditions and the following disclaimer.
 * 
 * - Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 * 
 * - Neither the name of Dave Hauenstein nor the names of its contributors may be
 *   used to endorse or promote products derived from this software without
 *   specific prior written permission of Dave Hauenstein
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */
 
 /**
 * Additional edits by Jacob Terry
 */
/*
* @param String   options[url]                  url that post request will hit
* @param String   options[params]               parameters sent via the post request to the server; string; ex: name=dave&last_name=hauenstein
* @param String   options[field_type]           can be: text, textarea, select, datepicker; default: text
* @param String   options[select_options]       this is a string seperated by commas for the dropdown options, if field_type is dropdown
* @param String   options[select_add]       	currently unused.
* @param String   options[select_dynamic_url]   the url of the page that will return a comma-delimited list of select options
* @param String   options[select_dynamic_params]the params to send to the page that will return the select options. Format as a single string: "name=value&name=value"
* @param String   options[textarea_cols]        number of columns textarea will have, if field_type is textarea; default: 25
* @param String   options[textarea_rows]        number of rows textarea will have, if field_type is textarea; default: 10
* @param String   options[bg_over]              background color of editable elements on HOVER
* @param String   options[bg_out]               background color of editable elements on RESTORE from hover
* @param String   options[saving_text]          text to be used when server is saving information; default: 'Saving...'
* @param String   options[saving_image]         specify an image location instead of text while server is saving; default: uses saving text
* @param String   options[loading_text]         text to be used when server is loading options for dynamic select; default: 'Loading...'
* @param String   options[default_text]         text to show up if the element that has this functionality is empty
* @param String   options[select_text]          default text to show up in select box
* @param String   options[value_required]       if set to true, the element will not be saved unless a value is entered
* @param String   options[element_id]           name of parameter holding element_id; default: element_id
* @param String   options[update_value]         name of parameter holding update_value; default: update_value
* @param String   options[original_html]        name of parameter holding original_html; default: original_html
* @param Function options[success]              this function gets called if server responds with a success
* @param Function options[error]                this function gets called if server responds with an error
*/

jQuery.fn.editInPlace = function(options) {
	
    /* DEFINE THE DEFAULT SETTINGS, SWITCH THEM WITH THE OPTIONS USER PROVIDES */
    var settings = {
        url:                "",
        params:             "",
        field_type:         "text",
        select_options:     "",
        select_add:			false,
        select_dynamic_url: "",
        select_dynamic_params: "",
        textarea_cols:      "25",
        textarea_rows:      "10",
        bg_over:            "#99a9e8",
        bg_out:             "transparent",
        saving_text:        "Saving...",
        saving_image:       "",
        loading_text:		"Loading...",
        default_text:       "(Click here to add text)",
        select_text:        "Choose new value",
        value_required:     null,
        element_id:         "element_id",
        update_value:       "update_value",
        original_html:      "original_html",
        success:            null,
        error:              function(request){
                                alert("Failed to save value: " + request.responseText || 'Unspecified Error');
                            }
    };

    if(options) {
        jQuery.extend(settings, options);
    }

    /* preload the loading icon if it exists */
    if(settings.saving_image != ""){
        var loading_image = new Image();
        loading_image.src = settings.saving_image;
    }

    /* THIS FUNCTION WILL TRIM WHITESPACE FROM BEFORE/AFTER A STRING */
    String.prototype.trim = function() {
        return this.replace(/^\s+/, '')
                             .replace(/\s+$/, '');
    };

    /* THIS FUNCTION WILL ESCAPE ANY HTML ENTITIES SO "Quoted Values" work */
    String.prototype.escape_html = function() {
        return this.replace(/&/g, "&amp;")
                             .replace(/</g, "&lt;")
                             .replace(/>/g, "&gt;")
                             .replace(/"/g, "&quot;");
	};

    /* CREATE THE INPLACE EDITOR */
    return this.each(function(){
    
        if(jQuery(this).html() == "") jQuery(this).html(settings.default_text);

        var editing = false;   

        //save the original element - for change of scope
        var original_element = jQuery(this);
		
        var click_count = 0;
        
        var state = 'original';
        
        var original_html = jQuery(this).html();

        jQuery(this)

        .mouseover(function(){
            jQuery(this).css("background", settings.bg_over);
        })

        .mouseout(function(){
            jQuery(this).css("background", settings.bg_out);
        })

        .click(function(){
            click_count++;
            
			if(click_count == 1)
            {
            
            	function captureEnter()
            	{
			   		$("#inplace_form").bind("keypress", function(e) {
			  			if (e.keyCode == 13) {
			  				saveAction();
			  				return false;
			  			}
					});            	
            	
            	}
	        
				function onBlurAction()
				{
									
					/* set the focus to the new input element */
					////////
					$("#inplace_field").focus().select();
			
					$("#inplace_field").blur(function () {
						saveAction();
					});
			 
				}
	        
				function onBlurActionDatepicker()
				{
				
					/* set the focus to the new input element */
					////////
					$('#ui-datepicker-div').data('hover', 1);
					
					$("#inplace_field").focus().select();
									
					$("#ui-datepicker-div").hover(
					    function(){ $('#ui-datepicker-div').data('hover', 1); },
					    function(){ $('#ui-datepicker-div').data('hover', 0); }
					);
			
					$("#inplace_field").blur(function () {
						if($("#ui-datepicker-div").data('hover')){
							return true;
						} else {
							saveAction();
						}
					});
			 
				}	        
	
				function onBlurActionDynamicSelect()
				{
				
					/* set the focus to the new input element */
					////////
					$("#inplace_field").focus().select();
									
					$("#inplace_link").hover(
					    function(){ $('#inplace_link').data('hover', 1); },
					    function(){ $('#inplace_link').data('hover', 0); }
					);
			
					$("#inplace_field").blur(function () {
						if($("#inplace_link").data('hover')){
								onAddValueDynamicSelectAction();
							} else {
								saveAction();
							}
					});
			 
				}
				
				function onAddValueDynamicSelectAction()
	            {
	            
	            	state = 'alternate';
	            
					original_element.html('<table><tr><td><form class="inplace_form" id="inplace_form" style="margin: 0; padding: 0;"><input type="text" name="inplace_value" id="inplace_field" class="inplace_field" value="" style="width:75px;"/></td><td><a href="#" id="inplace_link">Cancel</a></form></td></tr></table>');
	        			
	        		/* set the focus to the new input element */
					////////
					$("#inplace_field").focus().select();
									
					$("#inplace_link").hover(
					    function(){ $('#inplace_link').data('hover', 1); },
					    function(){ $('#inplace_link').data('hover', 0); }
					);
			
					$("#inplace_field").blur(function () {
						if($("#inplace_link").data('hover')){
								onCancelDynamicSelectAction();
							} else {
								saveAction();
							}
					});
					
					captureEnter();
	        		
				}
				
				function onCancelDynamicSelectAction()
	            {
	            	            	
					original_element.html('<table><tr><td><form class="inplace_form" id="inplace_form" style="margin: 0; padding: 0;">' + use_field_type + '</form></td><td><a href="#" id="inplace_link">Add Value</a></form></td></tr></table>');
	        			        		
	        		captureEnter();
	        		onBlurDynamicSelect();
	        		
				}			
				
				
	            function cancelAction()
	            {
	                editing = false;
	                click_count = 0;
	                state = 'original';
	
	                /* put the original background color in */
	                original_element.css("background", settings.bg_out);
	
	                /* put back the original text */
	                original_element.html(original_html);
	
	                return false;
	            }
	
	           function saveAction()
	            {                					
					/* put the original background color in */
					original_element.css("background", settings.bg_out);
	
					var this_elem = jQuery(this);
	
					var value = $("#inplace_field").val();
					
					var text = $("#inplace_field").val();
					
					if (settings.field_type == 'select' || (settings.field_type == 'select_dynamic' && state == 'original')) {
						text = $('#inplace_field :selected').text();
					}
							
					/* set saving message */
					if(settings.saving_image != ""){
						var saving_message = '<img src="' + settings.saving_image + '" alt="Saving..." />';
					} else {
						var saving_message = settings.saving_text;
					}
	
					/* place the saving text/image in the original element */
					original_element.html(saving_message);
	
					if(settings.params != ""){
						settings.params = "&" + settings.params;
					}
	
					if (settings.value_required && (value == "" || value == undefined)){
						editing = false;
						click_count = 0;
						state = 'original';
						original_element.html(original_html);
						alert("Error: You must enter a value to save this field");
					} else {
						jQuery.ajax({
							url: settings.url,
							type: "POST",
							data: settings.update_value + '=' + value + '&' + settings.element_id + '=' + original_element.attr("id") + settings.params + '&' + settings.original_html + '=' + original_html + '&state=' + state + '&update_text=' + text,
							dataType: "html",
							complete: function(request){
								editing = false;
								click_count = 0;
								state = 'original';
								original_html = text;
							},
							success: function(html){
								/* if the text returned by the server is empty, */
								/* put a marker as text in the original element */
								var new_text = html || settings.default_text;
	
								/* put the newly updated info into the original element */
								original_element.html(new_text);
								if (settings.success) settings.success(html, original_element);
							},
							error: function(request) {
								original_element.html(original_html);
								if (settings.error) settings.error(request, original_element);
							}
						});
					}
	
					return false;
	            }//end save action
			}//end if click_count == 1            
            
			
            if(!editing)
            {
                editing = true;

                //save original text - for cancellation functionality
                var original_text = jQuery(this).text();
                original_text = original_text.replace(/\n|\t/g, '');
                
                //if html is our default text, clear it out to prevent saving accidentally
                if (original_html == settings.default_text) jQuery(this).html('');

                if (settings.field_type == "textarea")
                {
                    var use_field_type = '<textarea name="inplace_value" class="inplace_field" id="inplace_field" rows="' + settings.textarea_rows + '" cols="' + settings.textarea_cols + '">' + jQuery(this).text().trim().escape_html() + '</textarea>';
                    
					original_element.html('<form class="inplace_form" id="inplace_form" style="margin: 0; padding: 0;">' + use_field_type + '</form>');
					
					captureEnter();
					onBlurAction();
                }
                else if(settings.field_type == "text")
                {
                    var use_field_type = '<input type="text" name="inplace_value" class="inplace_field" id="inplace_field" value="' + jQuery(this).text().trim().escape_html() + '" />';
                    
					original_element.html('<form class="inplace_form" id="inplace_form" style="margin: 0; padding: 0;">' + use_field_type + '</form>');
					
					captureEnter();
					onBlurAction();
                }
                else if(settings.field_type == "datepicker")
                {
                    var use_field_type = '<input type="text" name="inplace_value" class="inplace_field" id="inplace_field" value="' + jQuery(this).text().trim().escape_html() + '" />';
                    
					original_element.html('<form class="inplace_form" id="inplace_form" style="margin: 0; padding: 0;">' + use_field_type + '</form>');
					
					$('#inplace_field').datepicker({
						onSelect: function(tsDate, troPicker) {
							$("#inplace_field").datepicker('destroy');
							$("#inplace_field").focus().select();
						},
						changeFirstDay: false
 					});
					
					captureEnter();
					onBlurActionDatepicker();
                }               
				else if(settings.field_type == "select")
                {
					var optionsArray = settings.select_options.split(',');
					var use_field_type = '<select name="inplace_value" class="inplace_field" id="inplace_field"><option value="">' + settings.select_text + '</option>';
					for(var i=0; i<optionsArray.length; i++){
						var optionsValuesArray = optionsArray[i].split(':');
						var use_value = optionsValuesArray[1] || optionsValuesArray[0];
						var display_value = optionsValuesArray[0];
						display_value = display_value.replace(/\n/g, '');
						var selected = display_value == original_text ? 'selected="selected" ' : '';
						use_field_type += '<option ' + selected + 'value="' + use_value.trim().escape_html() + '">' + display_value.trim().escape_html() + '</option>';
					}
					
					original_element.html('<form class="inplace_form" id="inplace_form" style="margin: 0; padding: 0;">' + use_field_type + '</form>');
					
					captureEnter();
					onBlurAction();
     	
                } 
                else if(settings.field_type == "select_dynamic")
                {
                
					original_element.html(settings.loading_text);
                
                	$.get(settings.select_dynamic_url + '?' + settings.select_dynamic_params, function(data){
                		optionsArray = data.split(',');
                		use_field_type = '<select name="inplace_value" style="width:75px;" class="inplace_field" id="inplace_field"><option value="">' + settings.select_text + '</option>';
						for(var i=0; i<optionsArray.length; i++){
							var optionsValuesArray = optionsArray[i].split(':');
							var use_value = optionsValuesArray[1] || optionsValuesArray[0];
							var display_value = optionsValuesArray[0];
							display_value = display_value.replace(/\n/g, '');
							var selected = display_value == original_text ? 'selected="selected" ' : '';
							use_field_type += '<option ' + selected + 'value="' + use_value.trim().escape_html() + '">' + display_value.trim().escape_html() + '</option>';
						}
												
						original_element.html('<table><tr><td><form class="inplace_form" id="inplace_form" style="margin: 0; padding: 0;">' + use_field_type + '</form></td><td><a href="#" id="inplace_link">Add Value</a></td></tr></table>');
						
						captureEnter();
						onBlurActionDynamicSelect();
						
					});
				}
				
				/* hit esc key */
				$(document).keyup(function(event){
					if (event.keyCode == 27 && editing == true) {
						cancelAction();
					}
				});
				
            }/* END- if(!editing) -END */

        });//end click function
    });//end each function
};
