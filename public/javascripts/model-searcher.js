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
	this.fieldName = "searcher_id_input";
	this.fieldLabel = "";
	this.fieldStyle = "";
	
	// Another method of adding objects (instead of using services)
	this.objectList = null;
	
	// A JS array of the object(s) which should be selected in the form [{id: '2594', name: 'animals'}]
	this.selectedObjects = null;
	
	// The jQuery-wrapped DOM element of the hidden input which stores the selected ID(s)
	this.hiddenIdInput = null;
	
	// The jQuery-wrapped DOM element of the autocomplete text field input
	this.autocompleteInput = null;
	
	// Whether or not a tree (and the accompanying tree link) should be used 
	this.hasTree = true;
	
	// Whether the user can select only one category from the tree (if present) or select multiple categories
	this.singleSelectionTree = false;
	
	// The id attribute of the div which contains the tree popup
	this.treePopupId = null;
	
	// The jQuery-wrapped DOM element of the div which contains the tree popup
	this.treePopup = null;
	
	// The jQuery-wrapped DOM element that lists the names selected from the tree
	this.treeNames = null;
	
	// The jQuery-wrapped DOM element that removes the names selected from the tree
	this.treeRemove = null;
	
	this.treeHtml = null;
	this.treeLoaded = false;
	
	// See the attribute documentation above for explanations of these arguments
	this.init = function(divId, listService, treeService, options){
		this.listService = listService;
		this.treeService = treeService;
		if(options.fieldName)			{ this.fieldName = options.fieldName; }
		if(options.fieldLabel)			{ this.fieldLabel = options.fieldLabel; }
		if(options.selectedObjects)		{ this.selectedObjects = options.selectedObjects; }
		if(options.hasTree)				{ this.hasTree = options.hasTree; }
		if(options.singleSelectionTree)	{ this.singleSelectionTree = options.singleSelectionTree; }
		if(options.proxy)				{ this.proxy = options.proxy; }
		this.divId = divId;
		this.div = jQuery('#'+divId);
		this.div.html(
			(this.fieldLabel ? '<label for="'+this.fieldName+'">'+this.fieldLabel+'</label>' : '')+
			'<input type="text" name="searcher_autocomplete" id="searcher_autocomplete" style="'+this.fieldStyle+'" />'+
			'<input type="hidden" name="'+this.fieldName+'" id="searcher_id_input" />'
		);
		this.autocompleteInput = this.div.find('#searcher_autocomplete');
		this.hiddenIdInput = this.div.find('#searcher_id_input');
		
		// Request the service through a proxy if it's not local
		if(this.listService.substr(0,4) == 'http'){
			this.listService = this.proxy+this.listService;
		}
		if(this.treeService.substr(0,4) == 'http'){
			this.treeService = this.proxy+this.treeService;
		}
		
		var thisModelSearcher = this;
		jQuery.getJSON(this.listService, function(data){
			thisModelSearcher.autocompleteInput.autocomplete(data, {
				matchContains: true,
				mustMatch: true,
				max: 20,
				formatItem: thisModelSearcher.autocompleteFormatItem,
				formatMatch: thisModelSearcher.autocompleteFormatMatch,
				formatResult: thisModelSearcher.autocompleteFormatItem
			});
			thisModelSearcher.autocompleteInput.result(thisModelSearcher.autocompleteCallback);
			thisModelSearcher.objectList = [];
			for(var i in data){
				thisModelSearcher.objectList[data[i].id] = data[i];
			}
		});
		if(this.selectedObjects && this.selectedObjects.length == 1){
			this.autocompleteInput.val(this.selectedObjects[0].name);
			this.hiddenIdInput.val(this.selectedObjects[0].id);
		}
		if(this.hasTree){
			this.div.append('<br />Input type above or <a href="#" class="tree-link">select from tree</a>'+
				'<span class="tree-names"></span> <a href="#" class="tree-remove">(remove)</a><span class="tree-loading" style="float:right;"></span>');
			this.treePopupId = this.divId+"_model_searcher_tree_popup";
			this.treeLink = this.div.find('.tree-link');
			this.treeRemove = this.div.find('.tree-remove');
			this.treeNames = this.div.find('.tree-names');
			this.treeLoading = this.div.find('.tree-loading');
			this.treeRemove.hide();
			this.treeRemove.click(function(){
				thisModelSearcher.treeNames.html('');
				thisModelSearcher.treeRemove.hide();
				thisModelSearcher.hiddenIdInput.val('');
				return false;
			});
			this.treeLink.click(function(){
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
	};
	
	this.loadPopup = function(){
		thisModelSearcher.treePopup = jQuery().draggablePopup({
			id: thisModelSearcher.treePopupId,
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
			'<div'+(thisModelSearcher.singleSelectionTree ? ' class="single_selection_tree"' : '' )+
			' style="max-height: 400px; height:auto !important; height: 400px; overflow: auto;">'+
			thisModelSearcher.treeHtml+
			'</div>'+
			'<br /><input type="submit" value="Select" /> <input type="button" value="Cancel" onclick="jQuery(this).parents(\'.draggable-popup:first\').hide(); return false;" />'+
			'</form>'+
			'</div>'
			;
		thisModelSearcher.treePopup.setContent(content);
		thisModelSearcher.treePopup.div.checkTree({});
		thisModelSearcher.treePopup.div.find('form:first').submit(function(){
			var ids = [];
			jQuery(this).find(':checkbox:checked').each(function(){
				var label_name = jQuery(this).siblings('label').attr('name');
				if(label_name.indexOf('record_') == 0){
					ids.push(label_name.substring(7));
				}
			});
			if(ids.length == 0){
			}else{
				thisModelSearcher.selectedObjects = [];
				var names = [];
				for(var i in ids){
					thisModelSearcher.selectedObjects.push(thisModelSearcher.objectList[ids[i]]);
					names.push(thisModelSearcher.objectList[ids[i]].name);
				}
				thisModelSearcher.hiddenIdInput.val(ids.join(','));
				thisModelSearcher.autocompleteInput.val('');
				thisModelSearcher.treeNames.html(':<br />'+names.join(', '));
				thisModelSearcher.treeRemove.show();
			}
			//thisModelSearcher.treePopup.close();
			jQuery('#'+thisModelSearcher.treePopupId).hide();
			return false;
		});
		// For large trees, keeping this in memory can cause performance issues, so we'll set it to null
		// and use thisModelSearcher.treePopupId when we need it.
		thisModelSearcher.treePopup = null;
	};
	
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
			thisModelSearcher.hiddenIdInput.val(data.id);
		}else{
			thisModelSearcher.hiddenIdInput.val('');
		}
		thisModelSearcher.treeNames.html('');
		thisModelSearcher.treeRemove.hide();
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