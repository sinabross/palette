CKEDITOR.dialog.add("smiley",function(e){for(var t,n=e.config,a=e.lang.smiley,i=n.smiley_images,o=n.smiley_columns||8,r=function(n){var a=n.data.getTarget(),i=a.getName();if("a"==i)a=a.getChild(0);else if("img"!=i)return;var i=a.getAttribute("cke_src"),o=a.getAttribute("title"),a=e.document.createElement("img",{attributes:{src:i,"data-cke-saved-src":i,title:o,alt:o,width:a.$.width,height:a.$.height}});e.insertElement(a),t.hide(),n.data.preventDefault()},l=CKEDITOR.tools.addFunction(function(t,n){t=new CKEDITOR.dom.event(t),n=new CKEDITOR.dom.element(n);var a;a=t.getKeystroke();var i="rtl"==e.lang.dir;switch(a){case 38:(a=n.getParent().getParent().getPrevious())&&(a=a.getChild([n.getParent().getIndex(),0]),a.focus()),t.preventDefault();break;case 40:(a=n.getParent().getParent().getNext())&&(a=a.getChild([n.getParent().getIndex(),0]))&&a.focus(),t.preventDefault();break;case 32:r({data:t}),t.preventDefault();break;case i?37:39:(a=n.getParent().getNext())?(a=a.getChild(0),a.focus(),t.preventDefault(!0)):(a=n.getParent().getParent().getNext())&&((a=a.getChild([0,0]))&&a.focus(),t.preventDefault(!0));break;case i?39:37:(a=n.getParent().getPrevious())?(a=a.getChild(0),a.focus(),t.preventDefault(!0)):(a=n.getParent().getParent().getPrevious())&&(a=a.getLast().getChild(0),a.focus(),t.preventDefault(!0))}}),s=CKEDITOR.tools.getNextId()+"_smiley_emtions_label",s=['<div><span id="'+s+'" class="cke_voice_label">'+a.options+"</span>",'<table role="listbox" aria-labelledby="'+s+'" style="width:100%;height:100%;border-collapse:separate;" cellspacing="2" cellpadding="2"',CKEDITOR.env.ie&&CKEDITOR.env.quirks?' style="position:absolute;"':"","><tbody>"],d=i.length,a=0;a<d;a++){0===a%o&&s.push('<tr role="presentation">');var c="cke_smile_label_"+a+"_"+CKEDITOR.tools.getNextNumber();s.push('<td class="cke_dark_background cke_centered" style="vertical-align: middle;" role="presentation"><a href="javascript:void(0)" role="option"',' aria-posinset="'+(a+1)+'"',' aria-setsize="'+d+'"',' aria-labelledby="'+c+'"',' class="cke_smile cke_hand" tabindex="-1" onkeydown="CKEDITOR.tools.callFunction( ',l,', event, this );">','<img class="cke_hand" title="',n.smiley_descriptions[a],'" cke_src="',CKEDITOR.tools.htmlEncode(n.smiley_path+i[a]),'" alt="',n.smiley_descriptions[a],'"',' src="',CKEDITOR.tools.htmlEncode(n.smiley_path+i[a]),'"',CKEDITOR.env.ie?" onload=\"this.setAttribute('width', 2); this.removeAttribute('width');\" ":"",'><span id="'+c+'" class="cke_voice_label">'+n.smiley_descriptions[a]+"</span></a>","</td>"),a%o==o-1&&s.push("</tr>")}if(a<o-1){for(;a<o-1;a++)s.push("<td></td>");s.push("</tr>")}return s.push("</tbody></table></div>"),n={type:"html",id:"smileySelector",html:s.join(""),onLoad:function(e){t=e.sender},focus:function(){var e=this;setTimeout(function(){e.getElement().getElementsByTag("a").getItem(0).focus()},0)},onClick:r,style:"width: 100%; border-collapse: separate;"},{title:e.lang.smiley.title,minWidth:270,minHeight:120,contents:[{id:"tab1",label:"",title:"",expand:!0,padding:0,elements:[n]}],buttons:[CKEDITOR.dialog.cancelButton]}});