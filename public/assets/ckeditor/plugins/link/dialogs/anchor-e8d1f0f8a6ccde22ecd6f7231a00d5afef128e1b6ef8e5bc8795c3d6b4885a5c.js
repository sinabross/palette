CKEDITOR.dialog.add("anchor",function(e){function t(e,t){return e.createFakeElement(e.document.createElement("a",{attributes:t}),"cke_anchor","anchor")}return{title:e.lang.link.anchor.title,minWidth:300,minHeight:60,onOk:function(){var n=CKEDITOR.tools.trim(this.getValueOf("info","txtName")),n={id:n,name:n,"data-cke-saved-name":n};if(this._.selectedElement)this._.selectedElement.data("cke-realelement")?(n=t(e,n),n.replace(this._.selectedElement),CKEDITOR.env.ie&&e.getSelection().selectElement(n)):this._.selectedElement.setAttributes(n);else{var a=e.getSelection(),a=a&&a.getRanges()[0];a.collapsed?(n=t(e,n),a.insertNode(n)):(CKEDITOR.env.ie&&9>CKEDITOR.env.version&&(n["class"]="cke_anchor"),n=new CKEDITOR.style({element:"a",attributes:n}),n.type=CKEDITOR.STYLE_INLINE,e.applyStyle(n))}},onHide:function(){delete this._.selectedElement},onShow:function(){var t=e.getSelection(),n=t.getSelectedElement(),a=n&&n.data("cke-realelement"),i=a?CKEDITOR.plugins.link.tryRestoreFakeAnchor(e,n):CKEDITOR.plugins.link.getSelectedLink(e);if(i){this._.selectedElement=i;var o=i.data("cke-saved-name");this.setValueOf("info","txtName",o||""),!a&&t.selectElement(i),n&&(this._.selectedElement=n)}this.getContentElement("info","txtName").focus()},contents:[{id:"info",label:e.lang.link.anchor.title,accessKey:"I",elements:[{type:"text",id:"txtName",label:e.lang.link.anchor.name,required:!0,validate:function(){return!!this.getValue()||(alert(e.lang.link.anchor.errorName),!1)}}]}]}});