
Ajax.InPlaceFormEditor = Class.create();
Object.extend(Object.extend(Ajax.InPlaceEditor.prototype), {
  createEditField: function() {
	//open_windows[this.options.fieldname.slice(0,this.options.fieldname.indexOf('['))]=new Hash();
	
    var text;
    if(this.options.loadTextURL) {
      text = this.options.loadingText;
    } else {
      text = this.getText();
    }

    var obj = this;
    
    if (this.options.rows == 1 && !this.hasHTMLLineBreaks(text)) {
      this.options.textarea = false;
      var textField = document.createElement("input");
      textField.obj = this;
      textField.type = "text";
      textField.name = "value";
      textField.value = text;
      textField.style.backgroundColor = this.options.highlightcolor;
      textField.className = 'editor_field';
      var size = this.options.size || this.options.cols || 0;
      if (size != 0) textField.size = size;
      if (this.options.submitOnBlur)
        textField.onblur = this.onSubmit.bind(this);
      this.editField = textField;
    } else {
      this.options.textarea = true;
      var textArea = document.createElement("textarea");
      textArea.obj = this;
      textArea.name = "value";
      textArea.value = this.convertHTMLLineBreaks(text);
      textArea.rows = this.options.rows;
      textArea.cols = this.options.cols || 40;
      textArea.className = 'editor_field';      
      if (this.options.submitOnBlur)
        textArea.onblur = this.onSubmit.bind(this);
      this.editField = textArea;
    }
    
    if(this.options.loadTextURL) {
      this.loadExternalText();
    }
    this.form.appendChild(this.editField);

	open_windows[this.options.fieldname.slice(0,this.options.fieldname.indexOf('['))].setItem(this.options.fieldname,'open');
	//alert(open_windows[this.options.fieldname.slice(0,this.options.fieldname.indexOf('['))].hasItem(this.options.fieldname));
	//alert(open_windows[this.options.fieldname.slice(0,this.options.fieldname.indexOf('['))].hasItem('definition[numerology]'));
	//alert(open_windows.length);
  },
  onclickCancel: function() {
	open_windows[this.options.fieldname.slice(0,this.options.fieldname.indexOf('['))].removeItem(this.options.fieldname);
    this.onComplete();
    this.leaveEditMode();
    return false;
  },
  onSubmit: function() {
	open_windows[this.options.fieldname.slice(0,this.options.fieldname.indexOf('['))].removeItem(this.options.fieldname);
	//alert(open_windows);
    // onLoading resets these so we need to save them away for the Ajax call
    var form = this.form;
    var value = this.editField.value;
   
    // do this first, sometimes the ajax call returns before we get a chance to switch on Saving...
    // which means this will actually switch on Saving... *after* we've left edit mode causing Saving...
    // to be displayed indefinitely
    this.onLoading();
    
    if (this.options.evalScripts) {
      new Ajax.Request(
        this.url, Object.extend({
          parameters: this.options.callback(form, value),
          onComplete: this.onComplete.bind(this),
          onFailure: this.onFailure.bind(this),
          asynchronous:true, 
          evalScripts:true
        }, this.options.ajaxOptions));
    } else  {
      new Ajax.Updater(
        { success: this.element,
          // don't update on failure (this could be an option)
          failure: null }, 
        this.url, Object.extend({
          parameters: this.options.callback(form, value),
          onComplete: this.onComplete.bind(this),
          onFailure: this.onFailure.bind(this)
        }, this.options.ajaxOptions));
    }
	//alert(escape(this.editField.value));
	str = this.editField.value;
//	str = str.replace("\"","\\\"")
//	str = str.replace(/</g,"&lt;");
//	str = str.replace(/>/g,"&gt;");
	document.getElementById(this.options.fieldname).value = str; //this.editField.value;;
	
    // stop the event to avoid a page refresh in Safari
    if (arguments.length > 1) {
      Event.stop(arguments[0]);
    }
    return false;
  }
});