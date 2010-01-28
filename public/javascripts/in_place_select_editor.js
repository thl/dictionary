Ajax.InPlaceSelectEditor = Class.create();
Object.extend(Object.extend(Ajax.InPlaceSelectEditor.prototype,
                            Ajax.InPlaceEditor.prototype), {
    createEditField: function() {
		// alert(this.options.fieldname);
		open_windows[this.options.fieldname.slice(0,this.options.fieldname.indexOf('['))].setItem(this.options.fieldname,'open');
        var text;
        if(this.options.loadTextURL) {
            text = this.options.loadingText;
        } else {
            text = this.getText();
        }

        this.options.textarea = false;

        var selectField = document.createElement("select");
        selectField.name = "value";
        var options=this.options.selectOptionsHTML;        
        for (var x=0; x<options.length; x++)
        {
            var option = document.createElement("option");
            option.appendChild(document.createTextNode(options[x]));
            option.setAttribute("value",options[x]);
            selectField.appendChild(option);
        }

        $A(selectField.options).each(function(opt, index){
            if(text == opt.value) {
                selectField.selectedIndex = index;
            }
        }
    );

        selectField.style.backgroundColor = this.options.highlightcolor;
        this.editField = selectField;
        if(this.options.loadTextURL) {
          this.loadExternalText();
        }
		// alert(this);
        this._form.appendChild(this.editField);
    },
  onclickCancel: function() {
	open_windows[this.options.fieldname.slice(0,this.options.fieldname.indexOf('['))].removeItem(this.options.fieldname);
    this.onComplete();
    this.leaveEditMode();
    return false;
  },
  onSubmit: function() {
	open_windows[this.options.fieldname.slice(0,this.options.fieldname.indexOf('['))].removeItem(this.options.fieldname);
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
	//alert(this.options.fieldname);
	// document.getElementById(this.options.fieldname).value = this.editField.value;
	
    // stop the event to avoid a page refresh in Safari
    if (arguments.length > 1) {
      Event.stop(arguments[0]);
    }
    return false;
  }

});
/*Ajax.InPlaceSelectEditor = Class.create(); //<label id="code.create" />
Object.extend(Object.extend(Ajax.InPlaceSelectEditor.prototype,
                            Ajax.InPlaceEditor.prototype), {
    createEditField: function() {
      var text;
      if(this.options.loadTextURL) { //<label id="code.get_text" />
        text = this.options.loadingText;
      } else {
        text = this.getText();
      }
      this.options.textarea = false;
      var selectField = document.createElement("select"); //<label id="code.select" />
	  //selectField.size = "4";
	  //selectField.multiple = "multiple";
      selectField.name = "value";
      selectField.innerHTML=this.options.selectOptionsHTML ||//<label id="code.select_options" />
                     "<option>" + text + "</option>"; 
      $A(selectField.options).each(function(opt, index){//<label id="code.selected_loop" />
        if(text == opt.value) {
          selectField.selectedIndex = index;
        } 
      }
      );
        selectField.style.backgroundColor = this.options.highlightcolor;
        this.editField = selectField;
      if(this.options.loadTextURL) {
        this.loadExternalText();
      }
      this.form.appendChild(this.editField);
    }
});*/