/*
jQuery.fn.draggablePopup requires:
- UI/Draggable

Usage:
var popup = jQuery().draggablePopup({
	id: 'my_draggable_popup',
	header: 'Any <a href="#">HTML<\/a> can go here.',
	content: 'Initial <strong>content<\/strong>.',
	footer: 'Any <a href="#">HTML<\/a> can go here.',
	width: 200,
	open: false
});
popup.setContent('New <strong>content<\/strong>.');
*/

jQuery.fn.draggablePopup = function(options){
	this.defaults = {
		id: false,
		header: '',
		content: '',
		footer: '',
		width: 590,
		height: 540,
		flexibleHeight: false,
		overflow: 'hidden',
		url: false,
		linkUrl : false,
		showLink: true,
		newWindow: false,
		loadWith: 'ajax',
		closeWith: 'remove',
		type: false,
		open: true
	};
	this.options = options = jQuery.extend(this.defaults, options);
	this.id = null;
	this.div = null;
	this.headerDiv = null;
	this.footerDiv = null;
	this.contentDiv = null;
	this.boxCreated = false;
	this.init = function(){
		// Remove any existing popups
		jQuery('.draggable-popup').remove();
		// Create the popup box
		this.createBox();
		if(this.options.url){
			if(this.options.loadWith == 'ajax'){
				this.loadAjax(this.options.url);
			}else if(this.options.loadWith == 'iframe'){
				this.loadIframe(this.options.url);
				if(this.options.overflowX){
					this.contentDiv.find('iframe:first').css('overflow-x', this.options.overflowX);
				}
				if(this.options.overflowY){
					this.contentDiv.find('iframe:first').css('overflow-y', this.options.overflowY);
				}
			}
		}
		if(this.options.open){
			this.open();
		}
		return this;
	};
	this.center = function(){
		this.div.css('position','absolute')
			.css('left', ( Math.max(0, jQuery(window).width() - this.div.width() ) ) / 2+jQuery(window).scrollLeft() + 'px');
		// If the popup is inside an iframe, it's vertical position can't easily be centered on the window due to security
		// restraints preventing us from getting the window dimensions, so put it near the top of the iframe to prevent it
		// from being below the bottom of the screen.
		if(top != self){
			this.div.css('top', '20px');
		}else{
			this.div.css('top', ( Math.max(0, jQuery(window).height() - this.div.height() ) ) / 2+jQuery(window).scrollTop() + 'px');
		}
		return this;
	};
	this.createBox = function(){
		if(!this.boxCreated){
			if(this.options.id){
				this.id = this.options.id;
			}else{
				this.id = 'draggable_popup_'+jQuery('.draggable-popup').length;
			}
			var div_html = 
				'<div class="draggable-popup" id="'+this.id+'">'+
					'<div class="draggable-popup-header">'+this.options.header+'</div>'+
					'<div class="draggable-popup-close"></div>'+
					'<div class="draggable-popup-content"><div>'+this.options.content+'</div></div>'+
					'<div class="draggable-popup-footer">'+this.options.footer+'</div>'+
				'</div>';
			jQuery('body').append(div_html);
			this.div = jQuery('#'+this.id);
			this.contentDiv = this.div.children('.draggable-popup-content');
			this.headerDiv = this.div.children('.draggable-popup-header');
			this.footerDiv = this.div.children('.draggable-popup-footer');
			this.closeDiv = this.div.children('.draggable-popup-close');
			this.div.draggable({cancel: '.draggable-popup-content,.draggable-popup-close'});
			this.contentDiv.css('overflow', this.options.overflow);
			if(this.options.overflowX){
				this.contentDiv.css('overflow-x', this.options.overflowX);
			}
			if(this.options.overflowY){
				this.contentDiv.css('overflow-y', this.options.overflowY);
			}
			this.contentDiv.css('width', this.options.width+'px');
			if(this.options.flexibleHeight){
				this.contentDiv.css('max-height', this.options.height+'px');
			}else{
				this.contentDiv.css('height', this.options.height+'px');
			}
			if(this.options.showLink && this.options.url){
				var header_text = this.options.newWindow ? 'View this page in a new window...' : 'View this page alone...';
				var header_html = '<a href="'+(this.options.linkUrl ? this.options.linkUrl : this.options.url)+'" title="'+header_text+'"'+
					' onclick="jQuery(\'#'+this.id+'\').remove();"'+
					(this.options.newWindow ? ' target="_blank"' : '')+
					'>'+header_text+'</a>';
				this.headerDiv.html(header_html);
			}
			this.div.attr('id', this.id);
			// This condition can't be within the onclick handler, as there isn't a clear way to
			// access this.options in there.
			if(this.options.closeWith == 'hide'){
				this.closeDiv.click(function(){
					jQuery(this).parent('.draggable-popup').hide();
					return false;
				});
			}else{
				this.closeDiv.click(function(){
					jQuery(this).parent('.draggable-popup').remove();
					return false;
				});
			}
			this.boxCreated = true;
		}
		return this;
	};
	this.setContent = function(content){
		this.contentDiv.html(content);
		return this;
	};
	this.open = function(){
		this.div.show();
		this.center();
		return this;
	};
	this.close = function(){
		this.div.hide();
		return this;
	};
	this.remove = function(){
		this.div.remove();
		return this;
	};
	this.loadAjax = function(url){
		this.contentDiv.load(url, null, function(){});
		return this;
	};
	this.loadIframe = function(url){
		this.contentDiv.html('<iframe id="'+this.id+'_iframe" src="'+url+'"></iframe>');
		return this;
	};
	this.init();
	return this;
}

function ActivateDraggablePopups(parent_selector){
	parent_selector = parent_selector ? parent_selector: 'body';
	jQuery(parent_selector).find('a.draggable-pop').each(function(){
		var match, options = {};
		options.url = jQuery(this).attr('href');
		if(jQuery(this).hasClass('iframe')){
			options.loadWith = 'iframe';
		}
		if(jQuery(this).hasClass('new-window')){
			options.newWindow = true;
		}
		if(jQuery(this).hasClass('no-view-alone')){
			options.showLink = false;
		}
		if(match = this.className.match(/width-([\d]+)/)){
			options.width = match[1];
		}
		if(match = this.className.match(/height-([\d]+)/)){
			options.height = match[1];
		}
		if(match = this.className.match(/overflow-x-([a-z]+)/)){
			options.overflowX = match[1];
		}
		if(match = this.className.match(/overflow-y-([a-z]+)/)){
			options.overflowY = match[1];
		}
		jQuery(this).click(function(){
			jQuery().draggablePopup(options);
			return false;
		});
	});
}

/*jQuery(document).ready(function(){
	ActivateDraggablePopups();
});*/