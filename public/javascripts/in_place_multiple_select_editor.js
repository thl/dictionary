Ajax.InPlaceMultipleSelectEditor = Class.create();
Object.extend(Object.extend(Ajax.InPlaceMultipleSelectEditor.prototype,
                            Ajax.InPlaceEditor.prototype), {
    createEditField: function() {
        var text;
        if(this.options.loadTextURL) {
            text = this.options.loadingText;
        } else {
            text = this.getText();
        }

        this.options.textarea = false;

        var multipleSelectField = document.createElement("select");
        multipleSelectField.name = "value[]";
		multipleSelectField.size = "4";
		multipleSelectField.multiple = 'multiple';
        var options=this.options.selectOptionsHTML;        
        for (var x=0; x<options.length; x++)
        {
            var option = document.createElement("option");
            option.appendChild(document.createTextNode(options[x]));
            option.setAttribute("value",options[x]);
            multipleSelectField.appendChild(option);
        }

        $A(multipleSelectField.options).each(function(opt, index){
            if(text == opt.value) {
                //multipleSelectField.selectedIndex = index;
            }
        }
    );

        multipleSelectField.style.backgroundColor = this.options.highlightcolor;
        this.editField = multipleSelectField;
        if(this.options.loadTextURL) {
          this.loadExternalText();
        }
        this.form.appendChild(this.editField);
    }
});