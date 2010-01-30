var ModelSearcher = {

	// URL for JSON that lists categories in the form [{"name":"Agricultrure","id":4074},{"name":"Agriculture","id":2558}]
	listService: "",
	
	// URL for JSON that lists categories in a hierachy (see ModelSearch.createTreeFromArray() for details)
	treeService: "",
	
	// A script on the same subdomain. When a URL is appended to this string, the resulting URL should return the original URL's content.
	// The proxy can be bypassed by using service URLs that don't begin with "http" (and are thus on the subdomain and don't need a proxy)
	proxy: "/thl/utils/proxy/",
	
	// The id attribute of the div which contains all of DOM elements for this 
	divId: "",
	
	// The jQuery-wrapped DOM element of the div which contains all of DOM elements for this
	div: null,
	
	// The name, label, and style attributes of the hidden field in which the selected ID(s) will be entered
	fieldName: "searcher_id_input",
	fieldLabel: "",
	fieldStyle: "",
	
	// Another method of adding objects (instead of using services)
	objectList: null,
	
	// A JS array of the object(s) which should be selected in the form [{id: '2594', name: 'animals'}]
	selectedObjects: null,
	
	// The jQuery-wrapped DOM element of the hidden input which stores the selected ID(s)
	hiddenIdInput: null,
	
	// The jQuery-wrapped DOM element of the autocomplete text field input
	autocompleteInput: null,
	
	// Whether or not a tree (and the accompanying tree link) should be used 
	hasTree: false,
	
	// Whether the user can select only one category from the tree (if present) or select multiple categories
	singleSelectionTree: false,
	
	// The id attribute of the div which contains the tree popup
	treePopupId: "model_searcher_tree_popup",
	
	// The jQuery-wrapped DOM element of the div which contains the tree popup
	treePopup: null,
	
	// The jQuery-wrapped DOM element that lists the names selected from the tree
	treeNames: null,
	
	// The jQuery-wrapped DOM element that removes the names selected from the tree
	treeRemove: null,
	
	treeHtml: null,
	treeLoaded: false,
	
	// See the attribute documentation above for explanations of these arguments
	init: function(divId, listService, treeService, options){
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
		
		jQuery.getJSON(this.listService, function(data){
			ModelSearcher.autocompleteInput.autocomplete(data, {
				matchContains: true,
				mustMatch: true,
				max: 20,
				formatItem: ModelSearcher.autocompleteFormatItem,
				formatMatch: ModelSearcher.autocompleteFormatMatch,
				formatResult: ModelSearcher.autocompleteFormatItem
			});
			ModelSearcher.autocompleteInput.result(ModelSearcher.autocompleteCallback);
			ModelSearcher.objectList = [];
			for(var i in data){
				ModelSearcher.objectList[data[i].id] = data[i];
			}
		});
		if(this.selectedObjects && this.selectedObjects.length == 1){
			this.autocompleteInput.val(this.selectedObjects[0].name);
			this.hiddenIdInput.val(this.selectedObjects[0].id);
		}
		if(this.hasTree){
			this.div.append('<br />Input type above or <a href="#" class="tree-link">select from tree</a>'+
				'<span class="tree-names"></span> <a href="#" class="tree-remove">(remove)</a><span class="tree-loading" style="float:right;"></span>');
			this.treeLink = this.div.find('.tree-link');
			this.treeRemove = this.div.find('.tree-remove');
			this.treeNames = this.div.find('.tree-names');
			this.treeLoading = this.div.find('.tree-loading');
			this.treeRemove.hide();
			this.treeRemove.click(function(){
				ModelSearcher.treeNames.html('');
				ModelSearcher.treeRemove.hide();
				ModelSearcher.hiddenIdInput.val('');
				return false;
			});
			this.treeLink.click(function(){
				if(ModelSearcher.treeLoaded){
					jQuery('#'+ModelSearcher.treePopupId).show();
				}else{
					ModelSearcher.treeLoading.html(' <img src="http://thlib.org/global/images/ajax-loader.gif" />');
					jQuery.getJSON(ModelSearcher.treeService, function(data){
						ModelSearcher.treeHtml = ModelSearcher.createTreeFromArray(data.category);
						ModelSearcher.loadPopup();
						ModelSearcher.treeHtml = null;
						data = null;
						ModelSearcher.treeLoading.html('');
						ModelSearcher.treeLoaded = true;
					});
				}
				return false;
			});
		}
	},
	
	loadPopup: function(){
		ModelSearcher.treePopup = jQuery().thlPopup({
			id: ModelSearcher.treePopupId,
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
			'<div'+(ModelSearcher.singleSelectionTree ? ' class="single_selection_tree"' : '' )+
			' style="max-height: 400px; height:auto !important; height: 400px; overflow: auto;">'+
			ModelSearcher.treeHtml+
			'</div>'+
			'<br /><input type="submit" value="Select" /> <input type="button" value="Cancel" onclick="jQuery(this).parents(\'.thl-popup:first\').hide(); return false;" />'+
			'</form>'+
			'</div>'
			;
		ModelSearcher.treePopup.setContent(content);
		ModelSearcher.treePopup.div.checkTree({});
		ModelSearcher.treePopup.div.find('form:first').submit(function(){
			var ids = [];
			jQuery(this).find(':checkbox:checked').each(function(){
				var label_name = jQuery(this).siblings('label').attr('name');
				if(label_name.indexOf('record_') == 0){
					ids.push(label_name.substring(7));
				}
			});
			if(ids.length == 0){
			}else{
				ModelSearcher.selectedObjects = [];
				var names = [];
				for(var i in ids){
					ModelSearcher.selectedObjects.push(ModelSearcher.objectList[ids[i]]);
					names.push(ModelSearcher.objectList[ids[i]].name);
				}
				ModelSearcher.hiddenIdInput.val(ids.join(','));
				ModelSearcher.autocompleteInput.val('');
				ModelSearcher.treeNames.html(':<br />'+names.join(', '));
				ModelSearcher.treeRemove.show();
			}
			//ModelSearcher.treePopup.close();
			jQuery('#'+ModelSearcher.treePopupId).hide();
			return false;
		});
		// For large trees, keeping this in memory can cause performance issues, so we'll set it to null
		// and use ModelSearcher.treePopupId when we need it.
		ModelSearcher.treePopup = null;
	},
	
	resetFields: function(){
		this.autocompleteInput.val('');
		this.hiddenIdInput.val('');
		if(this.hasTree){
			this.treeNames.html('');
			this.treeRemove.hide();
			jQuery('#'+this.treePopupId).hide();
		}
	},
	
	autocompleteFormatItem: function(item, i, max){
		return jQuery.trim(item.name);
	},
	
	autocompleteFormatMatch: function(item, i, max){
		return jQuery.trim(item.name);
	},
	
	autocompleteFormatResult: function(item, i, max){
		return item.id;
	},
	
	autocompleteCallback: function(event, data, formatted) {
		if(data){
			ModelSearcher.hiddenIdInput.val(data.id);
		}else{
			ModelSearcher.hiddenIdInput.val('');
		}
		ModelSearcher.treeNames.html('');
		ModelSearcher.treeRemove.hide();
		return false;
	},
	
	createTreeFromArray: function(arr){
		var html = '';
		if(arr.categories && arr.categories.category){
			html += '<ul class="tree">';
			if(arr.categories.category && arr.categories.category[0]){
				for(var i in arr.categories.category) {
					html += '<li>';
					html += '<input type="checkbox" class="toggle"><label name="record_'+arr.categories.category[i].id+'">'+arr.categories.category[i].title+'</label>';
					if(arr.categories.category[i].categories){
						html += this.createTreeFromArray(arr.categories.category[i]);
					}
					html += '</li>';
				}
			}else if(arr.categories.category){
				html += '<li>';
				html += '<input type="checkbox" class="toggle"><label name="record_'+arr.categories.category.id+'">'+arr.categories.category.title+'</label>';
				if(arr.categories.category.categories){
					html += this.createTreeFromArray(arr.categories.category);
				}
				html += '</li>';
			}
			html += '</ul>';
		}
		return html;
	}

};

