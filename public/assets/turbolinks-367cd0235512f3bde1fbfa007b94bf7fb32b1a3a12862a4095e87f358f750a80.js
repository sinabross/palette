(function(){(function(){(function(){this.Turbolinks={supported:function(){return null!=window.history.pushState&&null!=window.requestAnimationFrame}(),visit:function(t,n){return e.controller.visit(t,n)},clearCache:function(){return e.controller.clearCache()}}}).call(this)}).call(this);var e=this.Turbolinks;(function(){(function(){var t,n;e.copyObject=function(e){var t,n,i;n={};for(t in e)i=e[t],n[t]=i;return n},e.closest=function(e,n){return t.call(e,n)},t=function(){var e,t;return e=document.documentElement,null!=(t=e.closest)?t:function(e){var t;for(t=this;t;){if(t.nodeType===Node.ELEMENT_NODE&&n.call(t,e))return t;t=t.parentNode}}}(),e.defer=function(e){return setTimeout(e,1)},e.dispatch=function(e,t){var n,i,r,o,s;return o=null!=t?t:{},s=o.target,n=o.cancelable,i=o.data,r=document.createEvent("Events"),r.initEvent(e,!0,n===!0),r.data=null!=i?i:{},(null!=s?s:document).dispatchEvent(r),r},e.match=function(e,t){return n.call(e,t)},n=function(){var e,t,n,i;return e=document.documentElement,null!=(t=null!=(n=null!=(i=e.matchesSelector)?i:e.webkitMatchesSelector)?n:e.msMatchesSelector)?t:e.mozMatchesSelector}(),e.uuid=function(){var e,t,n;for(n="",e=t=1;36>=t;e=++t)n+=9===e||14===e||19===e||24===e?"-":15===e?"4":20===e?(Math.floor(4*Math.random())+8).toString(16):Math.floor(15*Math.random()).toString(16);return n}}).call(this),function(){e.Location=function(){function e(e){var t,n;null==e&&(e=""),n=document.createElement("a"),n.href=e.toString(),this.absoluteURL=n.href,t=n.hash.length,2>t?this.requestURL=this.absoluteURL:(this.requestURL=this.absoluteURL.slice(0,-t),this.anchor=n.hash.slice(1))}var t,n,i,r;return e.wrap=function(e){return e instanceof this?e:new this(e)},e.prototype.getOrigin=function(){return this.absoluteURL.split("/",3).join("/")},e.prototype.getPath=function(){var e,t;return null!=(e=null!=(t=this.absoluteURL.match(/\/\/[^\/]*(\/[^?;]*)/))?t[1]:void 0)?e:"/"},e.prototype.getPathComponents=function(){return this.getPath().split("/").slice(1)},e.prototype.getLastPathComponent=function(){return this.getPathComponents().slice(-1)[0]},e.prototype.getExtension=function(){var e,t;return null!=(e=null!=(t=this.getLastPathComponent().match(/\.[^.]*$/))?t[0]:void 0)?e:""},e.prototype.isHTML=function(){return this.getExtension().match(/^(?:|\.(?:htm|html|xhtml))$/)},e.prototype.isPrefixedBy=function(e){var t;return t=n(e),this.isEqualTo(e)||r(this.absoluteURL,t)},e.prototype.isEqualTo=function(e){return this.absoluteURL===(null!=e?e.absoluteURL:void 0)},e.prototype.toCacheKey=function(){return this.requestURL},e.prototype.toJSON=function(){return this.absoluteURL},e.prototype.toString=function(){return this.absoluteURL},e.prototype.valueOf=function(){return this.absoluteURL},n=function(e){return t(e.getOrigin()+e.getPath())},t=function(e){return i(e,"/")?e:e+"/"},r=function(e,t){return e.slice(0,t.length)===t},i=function(e,t){return e.slice(-t.length)===t},e}()}.call(this),function(){var t=function(e,t){return function(){return e.apply(t,arguments)}};e.HttpRequest=function(){function n(n,i,r){this.delegate=n,this.requestCanceled=t(this.requestCanceled,this),this.requestTimedOut=t(this.requestTimedOut,this),this.requestFailed=t(this.requestFailed,this),this.requestLoaded=t(this.requestLoaded,this),this.requestProgressed=t(this.requestProgressed,this),this.url=e.Location.wrap(i).requestURL,this.referrer=e.Location.wrap(r).absoluteURL,this.createXHR()}return n.NETWORK_FAILURE=0,n.TIMEOUT_FAILURE=-1,n.timeout=60,n.prototype.send=function(){var e;return this.xhr&&!this.sent?(this.notifyApplicationBeforeRequestStart(),this.setProgress(0),this.xhr.send(),this.sent=!0,"function"==typeof(e=this.delegate).requestStarted?e.requestStarted():void 0):void 0},n.prototype.cancel=function(){return this.xhr&&this.sent?this.xhr.abort():void 0},n.prototype.requestProgressed=function(e){return e.lengthComputable?this.setProgress(e.loaded/e.total):void 0},n.prototype.requestLoaded=function(){return this.endRequest(function(e){return function(){var t;return 200<=(t=e.xhr.status)&&300>t?e.delegate.requestCompletedWithResponse(e.xhr.responseText,e.xhr.getResponseHeader("Turbolinks-Location")):(e.failed=!0,e.delegate.requestFailedWithStatusCode(e.xhr.status,e.xhr.responseText))}}(this))},n.prototype.requestFailed=function(){return this.endRequest(function(e){return function(){return e.failed=!0,e.delegate.requestFailedWithStatusCode(e.constructor.NETWORK_FAILURE)}}(this))},n.prototype.requestTimedOut=function(){return this.endRequest(function(e){return function(){return e.failed=!0,e.delegate.requestFailedWithStatusCode(e.constructor.TIMEOUT_FAILURE)}}(this))},n.prototype.requestCanceled=function(){return this.endRequest()},n.prototype.notifyApplicationBeforeRequestStart=function(){return e.dispatch("turbolinks:request-start",{data:{url:this.url,xhr:this.xhr}})},n.prototype.notifyApplicationAfterRequestEnd=function(){return e.dispatch("turbolinks:request-end",{data:{url:this.url,xhr:this.xhr}})},n.prototype.createXHR=function(){return this.xhr=new XMLHttpRequest,this.xhr.open("GET",this.url,!0),this.xhr.timeout=1e3*this.constructor.timeout,this.xhr.setRequestHeader("Accept","text/html, application/xhtml+xml"),this.xhr.setRequestHeader("Turbolinks-Referrer",this.referrer),this.xhr.onprogress=this.requestProgressed,this.xhr.onload=this.requestLoaded,this.xhr.onerror=this.requestFailed,this.xhr.ontimeout=this.requestTimedOut,this.xhr.onabort=this.requestCanceled},n.prototype.endRequest=function(e){return this.xhr?(this.notifyApplicationAfterRequestEnd(),null!=e&&e.call(this),this.destroy()):void 0},n.prototype.setProgress=function(e){var t;return this.progress=e,"function"==typeof(t=this.delegate).requestProgressed?t.requestProgressed(this.progress):void 0},n.prototype.destroy=function(){var e;return this.setProgress(1),"function"==typeof(e=this.delegate).requestFinished&&e.requestFinished(),this.delegate=null,this.xhr=null},n}()}.call(this),function(){var t=function(e,t){return function(){return e.apply(t,arguments)}};e.ProgressBar=function(){function e(){this.trickle=t(this.trickle,this),this.stylesheetElement=this.createStylesheetElement(),this.progressElement=this.createProgressElement()}var n;return n=300,e.defaultCSS=".turbolinks-progress-bar {\n  position: fixed;\n  display: block;\n  top: 0;\n  left: 0;\n  height: 3px;\n  background: #0076ff;\n  z-index: 9999;\n  transition: width "+n+"ms ease-out, opacity "+n/2+"ms "+n/2+"ms ease-in;\n  transform: translate3d(0, 0, 0);\n}",e.prototype.show=function(){return this.visible?void 0:(this.visible=!0,this.installStylesheetElement(),this.installProgressElement(),this.startTrickling())},e.prototype.hide=function(){return this.visible&&!this.hiding?(this.hiding=!0,this.fadeProgressElement(function(e){return function(){return e.uninstallProgressElement(),e.stopTrickling(),e.visible=!1,e.hiding=!1}}(this))):void 0},e.prototype.setValue=function(e){return this.value=e,this.refresh()},e.prototype.installStylesheetElement=function(){return document.head.insertBefore(this.stylesheetElement,document.head.firstChild)},e.prototype.installProgressElement=function(){return this.progressElement.style.width=0,this.progressElement.style.opacity=1,document.documentElement.insertBefore(this.progressElement,document.body),this.refresh()},e.prototype.fadeProgressElement=function(e){return this.progressElement.style.opacity=0,setTimeout(e,1.5*n)},e.prototype.uninstallProgressElement=function(){return this.progressElement.parentNode?document.documentElement.removeChild(this.progressElement):void 0},e.prototype.startTrickling=function(){return null!=this.trickleInterval?this.trickleInterval:this.trickleInterval=setInterval(this.trickle,n)},e.prototype.stopTrickling=function(){return clearInterval(this.trickleInterval),this.trickleInterval=null},e.prototype.trickle=function(){return this.setValue(this.value+Math.random()/100)},e.prototype.refresh=function(){return requestAnimationFrame(function(e){return function(){return e.progressElement.style.width=10+90*e.value+"%"}}(this))},e.prototype.createStylesheetElement=function(){var e;return e=document.createElement("style"),e.type="text/css",e.textContent=this.constructor.defaultCSS,e},e.prototype.createProgressElement=function(){var e;return e=document.createElement("div"),e.className="turbolinks-progress-bar",e},e}()}.call(this),function(){var t=function(e,t){return function(){return e.apply(t,arguments)}};e.BrowserAdapter=function(){function n(n){this.controller=n,this.showProgressBar=t(this.showProgressBar,this),this.progressBar=new e.ProgressBar}var i,r,o,s;return s=e.HttpRequest,i=s.NETWORK_FAILURE,o=s.TIMEOUT_FAILURE,r=500,n.prototype.visitProposedToLocationWithAction=function(e,t){return this.controller.startVisitToLocationWithAction(e,t)},n.prototype.visitStarted=function(e){return e.issueRequest(),e.changeHistory(),e.loadCachedSnapshot()},n.prototype.visitRequestStarted=function(e){return this.progressBar.setValue(0),e.hasCachedSnapshot()||"restore"!==e.action?this.showProgressBarAfterDelay():this.showProgressBar()},n.prototype.visitRequestProgressed=function(e){return this.progressBar.setValue(e.progress)},n.prototype.visitRequestCompleted=function(e){return e.loadResponse()},n.prototype.visitRequestFailedWithStatusCode=function(e,t){switch(t){case i:case o:return this.reload();default:return e.loadResponse()}},n.prototype.visitRequestFinished=function(){return this.hideProgressBar()},n.prototype.visitCompleted=function(e){return e.followRedirect()},n.prototype.pageInvalidated=function(){return this.reload()},n.prototype.showProgressBarAfterDelay=function(){return this.progressBarTimeout=setTimeout(this.showProgressBar,r)},n.prototype.showProgressBar=function(){return this.progressBar.show()},n.prototype.hideProgressBar=function(){return this.progressBar.hide(),clearTimeout(this.progressBarTimeout)},n.prototype.reload=function(){return window.location.reload()},n}()}.call(this),function(){var t,n=function(e,t){return function(){return e.apply(t,arguments)}};t=!1,addEventListener("load",function(){return e.defer(function(){return t=!0})},!1),e.History=function(){function i(e){this.delegate=e,this.onPopState=n(this.onPopState,this)}return i.prototype.start=function(){return this.started?void 0:(addEventListener("popstate",this.onPopState,!1),this.started=!0)},i.prototype.stop=function(){return this.started?(removeEventListener("popstate",this.onPopState,!1),this.started=!1):void 0},i.prototype.push=function(t,n){return t=e.Location.wrap(t),this.update("push",t,n)},i.prototype.replace=function(t,n){return t=e.Location.wrap(t),this.update("replace",t,n)},i.prototype.onPopState=function(t){var n,i,r,o;return this.shouldHandlePopState()&&(o=null!=(i=t.state)?i.turbolinks:void 0)?(n=e.Location.wrap(window.location),r=o.restorationIdentifier,this.delegate.historyPoppedToLocationWithRestorationIdentifier(n,r)):void 0},i.prototype.shouldHandlePopState=function(){return t===!0},i.prototype.update=function(e,t,n){var i;return i={turbolinks:{restorationIdentifier:n}},history[e+"State"](i,null,t)},i}()}.call(this),function(){e.Snapshot=function(){function t(e){var t,n;n=e.head,t=e.body,this.head=null!=n?n:document.createElement("head"),this.body=null!=t?t:document.createElement("body")}return t.wrap=function(e){return e instanceof this?e:this.fromHTML(e)},t.fromHTML=function(e){var t;return t=document.createElement("html"),t.innerHTML=e,this.fromElement(t)},t.fromElement=function(e){return new this({head:e.querySelector("head"),body:e.querySelector("body")})},t.prototype.clone=function(){return new t({head:this.head.cloneNode(!0),body:this.body.cloneNode(!0)})},t.prototype.getRootLocation=function(){var t,n;return n=null!=(t=this.getSetting("root"))?t:"/",new e.Location(n)},t.prototype.getCacheControlValue=function(){return this.getSetting("cache-control")},t.prototype.hasAnchor=function(e){try{return null!=this.body.querySelector("[id='"+e+"']")}catch(e){}},t.prototype.isPreviewable=function(){return"no-preview"!==this.getCacheControlValue()},t.prototype.isCacheable=function(){return"no-cache"!==this.getCacheControlValue()},t.prototype.getSetting=function(e){var t,n;return n=this.head.querySelectorAll("meta[name='turbolinks-"+e+"']"),t=n[n.length-1],null!=t?t.getAttribute("content"):void 0},t}()}.call(this),function(){var t=[].slice;e.Renderer=function(){function e(){}var n;return e.render=function(){var e,n,i,r;return i=arguments[0],n=arguments[1],e=3<=arguments.length?t.call(arguments,2):[],r=function(e,t,n){n.prototype=e.prototype;var i=new n,r=e.apply(i,t);return Object(r)===r?r:i}(this,e,function(){}),r.delegate=i,r.render(n),r},e.prototype.renderView=function(e){return this.delegate.viewWillRender(this.newBody),e(),this.delegate.viewRendered(this.newBody)},e.prototype.invalidateView=function(){return this.delegate.viewInvalidated()},e.prototype.createScriptElement=function(e){var t;return"false"===e.getAttribute("data-turbolinks-eval")?e:(t=document.createElement("script"),t.textContent=e.textContent,n(t,e),t)},n=function(e,t){var n,i,r,o,s,a,l;for(o=t.attributes,a=[],n=0,i=o.length;i>n;n++)s=o[n],r=s.name,l=s.value,a.push(e.setAttribute(r,l));return a},e}()}.call(this),function(){e.HeadDetails=function(){function e(e){var t,n,o,s,a,l,u;for(this.element=e,this.elements={},u=this.element.childNodes,s=0,l=u.length;l>s;s++)o=u[s],o.nodeType===Node.ELEMENT_NODE&&(a=o.outerHTML,n=null!=(t=this.elements)[a]?t[a]:t[a]={type:r(o),tracked:i(o),elements:[]},n.elements.push(o))}var t,n,i,r;return e.prototype.hasElementWithKey=function(e){return e in this.elements},e.prototype.getTrackedElementSignature=function(){var e,t;return function(){var n,i;n=this.elements,i=[];for(e in n)t=n[e].tracked,t&&i.push(e);return i}.call(this).join("")},e.prototype.getScriptElementsNotInDetails=function(e){return this.getElementsMatchingTypeNotInDetails("script",e)},e.prototype.getStylesheetElementsNotInDetails=function(e){return this.getElementsMatchingTypeNotInDetails("stylesheet",e)},e.prototype.getElementsMatchingTypeNotInDetails=function(e,t){var n,i,r,o,s,a;r=this.elements,s=[];for(i in r)o=r[i],a=o.type,n=o.elements,a!==e||t.hasElementWithKey(i)||s.push(n[0]);return s},e.prototype.getProvisionalElements=function(){var e,t,n,i,r,o,s;n=[],i=this.elements;for(t in i)r=i[t],s=r.type,o=r.tracked,e=r.elements,null!=s||o?e.length>1&&n.push.apply(n,e.slice(1)):n.push.apply(n,e);return n},r=function(e){return t(e)?"script":n(e)?"stylesheet":void 0},i=function(e){return"reload"===e.getAttribute("data-turbolinks-track")},t=function(e){var t;return t=e.tagName.toLowerCase(),"script"===t},n=function(e){var t;return t=e.tagName.toLowerCase(),"style"===t||"link"===t&&"stylesheet"===e.getAttribute("rel")},e}()}.call(this),function(){var t=function(e,t){function i(){this.constructor=e}for(var r in t)n.call(t,r)&&(e[r]=t[r]);return i.prototype=t.prototype,e.prototype=new i,e.__super__=t.prototype,e},n={}.hasOwnProperty;e.SnapshotRenderer=function(n){function i(t,n){this.currentSnapshot=t,this.newSnapshot=n,this.currentHeadDetails=new e.HeadDetails(this.currentSnapshot.head),this.newHeadDetails=new e.HeadDetails(this.newSnapshot.head),this.newBody=this.newSnapshot.body}return t(i,n),i.prototype.render=function(e){return this.trackedElementsAreIdentical()?(this.mergeHead(),this.renderView(function(t){return function(){return t.replaceBody(),t.focusFirstAutofocusableElement(),e()}}(this))):this.invalidateView()},i.prototype.mergeHead=function(){return this.copyNewHeadStylesheetElements(),this.copyNewHeadScriptElements(),this.removeCurrentHeadProvisionalElements(),this.copyNewHeadProvisionalElements()},i.prototype.replaceBody=function(){return this.activateBodyScriptElements(),this.importBodyPermanentElements(),this.assignNewBody()},i.prototype.trackedElementsAreIdentical=function(){return this.currentHeadDetails.getTrackedElementSignature()===this.newHeadDetails.getTrackedElementSignature()},i.prototype.copyNewHeadStylesheetElements=function(){var e,t,n,i,r;for(i=this.getNewHeadStylesheetElements(),r=[],t=0,n=i.length;n>t;t++)e=i[t],r.push(document.head.appendChild(e));return r},i.prototype.copyNewHeadScriptElements=function(){var e,t,n,i,r;for(i=this.getNewHeadScriptElements(),r=[],t=0,n=i.length;n>t;t++)e=i[t],r.push(document.head.appendChild(this.createScriptElement(e)));return r},i.prototype.removeCurrentHeadProvisionalElements=function(){var e,t,n,i,r;for(i=this.getCurrentHeadProvisionalElements(),r=[],t=0,n=i.length;n>t;t++)e=i[t],r.push(document.head.removeChild(e));return r},i.prototype.copyNewHeadProvisionalElements=function(){var e,t,n,i,r;for(i=this.getNewHeadProvisionalElements(),r=[],t=0,n=i.length;n>t;t++)e=i[t],r.push(document.head.appendChild(e));return r},i.prototype.importBodyPermanentElements=function(){var e,t,n,i,r,o;for(i=this.getNewBodyPermanentElements(),o=[],t=0,n=i.length;n>t;t++)r=i[t],(e=this.findCurrentBodyPermanentElement(r))?o.push(r.parentNode.replaceChild(e,r)):o.push(void 0);return o},i.prototype.activateBodyScriptElements=function(){var e,t,n,i,r,o;for(i=this.getNewBodyScriptElements(),o=[],t=0,n=i.length;n>t;t++)r=i[t],e=this.createScriptElement(r),o.push(r.parentNode.replaceChild(e,r));return o},i.prototype.assignNewBody=function(){return document.body=this.newBody},i.prototype.focusFirstAutofocusableElement=function(){var e;return null!=(e=this.findFirstAutofocusableElement())?e.focus():void 0},i.prototype.getNewHeadStylesheetElements=function(){return this.newHeadDetails.getStylesheetElementsNotInDetails(this.currentHeadDetails)},i.prototype.getNewHeadScriptElements=function(){return this.newHeadDetails.getScriptElementsNotInDetails(this.currentHeadDetails)},i.prototype.getCurrentHeadProvisionalElements=function(){return this.currentHeadDetails.getProvisionalElements()},i.prototype.getNewHeadProvisionalElements=function(){return this.newHeadDetails.getProvisionalElements()},i.prototype.getNewBodyPermanentElements=function(){return this.newBody.querySelectorAll("[id][data-turbolinks-permanent]")},i.prototype.findCurrentBodyPermanentElement=function(e){return document.body.querySelector("#"+e.id+"[data-turbolinks-permanent]")},i.prototype.getNewBodyScriptElements=function(){return this.newBody.querySelectorAll("script")},i.prototype.findFirstAutofocusableElement=function(){return document.body.querySelector("[autofocus]")},i}(e.Renderer)}.call(this),function(){var t=function(e,t){function i(){this.constructor=e}for(var r in t)n.call(t,r)&&(e[r]=t[r]);return i.prototype=t.prototype,e.prototype=new i,e.__super__=t.prototype,e},n={}.hasOwnProperty;e.ErrorRenderer=function(e){function n(e){this.html=e}return t(n,e),n.prototype.render=function(e){return this.renderView(function(t){return function(){return t.replaceDocumentHTML(),t.activateBodyScriptElements(),e()}}(this))},n.prototype.replaceDocumentHTML=function(){return document.documentElement.innerHTML=this.html},n.prototype.activateBodyScriptElements=function(){var e,t,n,i,r,o;for(i=this.getScriptElements(),o=[],t=0,n=i.length;n>t;t++)r=i[t],e=this.createScriptElement(r),o.push(r.parentNode.replaceChild(e,r));return o},n.prototype.getScriptElements=function(){return document.documentElement.querySelectorAll("script")},n}(e.Renderer)}.call(this),function(){e.View=function(){function t(e){this.delegate=e,this.element=document.documentElement}return t.prototype.getRootLocation=function(){return this.getSnapshot().getRootLocation()},t.prototype.getSnapshot=function(){return e.Snapshot.fromElement(this.element)},t.prototype.render=function(e,t){var n,i,r;return r=e.snapshot,n=e.error,i=e.isPreview,this.markAsPreview(i),null!=r?this.renderSnapshot(r,t):this.renderError(n,t)},t.prototype.markAsPreview=function(e){return e?this.element.setAttribute("data-turbolinks-preview",""):this.element.removeAttribute("data-turbolinks-preview")},t.prototype.renderSnapshot=function(t,n){return e.SnapshotRenderer.render(this.delegate,n,this.getSnapshot(),e.Snapshot.wrap(t))},t.prototype.renderError=function(t,n){return e.ErrorRenderer.render(this.delegate,n,t)},t}()}.call(this),function(){var t=function(e,t){return function(){return e.apply(t,arguments)}};e.ScrollManager=function(){function e(e){this.delegate=e,this.onScroll=t(this.onScroll,this)}return e.prototype.start=function(){return this.started?void 0:(addEventListener("scroll",this.onScroll,!1),this.onScroll(),this.started=!0)},e.prototype.stop=function(){return this.started?(removeEventListener("scroll",this.onScroll,!1),this.started=!1):void 0},e.prototype.scrollToElement=function(e){return e.scrollIntoView()},e.prototype.scrollToPosition=function(e){var t,n;return t=e.x,n=e.y,window.scrollTo(t,n)},e.prototype.onScroll=function(){return this.updatePosition({x:window.pageXOffset,y:window.pageYOffset})},e.prototype.updatePosition=function(e){var t;return this.position=e,null!=(t=this.delegate)?t.scrollPositionChanged(this.position):void 0},e}()}.call(this),function(){e.SnapshotCache=function(){function t(e){this.size=e,this.keys=[],this.snapshots={}}var n;return t.prototype.has=function(e){var t;return t=n(e),t in this.snapshots},t.prototype.get=function(e){var t;if(this.has(e))return t=this.read(e),this.touch(e),t},t.prototype.put=function(e,t){return this.write(e,t),this.touch(e),t},t.prototype.read=function(e){var t;return t=n(e),this.snapshots[t]},t.prototype.write=function(e,t){var i;return i=n(e),this.snapshots[i]=t},t.prototype.touch=function(e){var t,i;return i=n(e),t=this.keys.indexOf(i),t>-1&&this.keys.splice(t,1),this.keys.unshift(i),this.trim()},t.prototype.trim=function(){var e,t,n,i,r;for(i=this.keys.splice(this.size),r=[],e=0,n=i.length;n>e;e++)t=i[e],r.push(delete this.snapshots[t]);return r},n=function(t){return e.Location.wrap(t).toCacheKey()},t}()}.call(this),function(){var t=function(e,t){return function(){return e.apply(t,arguments)}};e.Visit=function(){function n(n,i,r){this.controller=n,this.action=r,this.performScroll=t(this.performScroll,this),this.identifier=e.uuid(),this.location=e.Location.wrap(i),this.adapter=this.controller.adapter,this.state="initialized",this.timingMetrics={}}var i;return n.prototype.start=function(){return"initialized"===this.state?(this.recordTimingMetric("visitStart"),this.state="started",this.adapter.visitStarted(this)):void 0},n.prototype.cancel=function(){var e;return"started"===this.state?(null!=(e=this.request)&&e.cancel(),this.cancelRender(),this.state="canceled"):void 0},n.prototype.complete=function(){var e;return"started"===this.state?(this.recordTimingMetric("visitEnd"),this.state="completed","function"==typeof(e=this.adapter).visitCompleted&&e.visitCompleted(this),this.controller.visitCompleted(this)):void 0},n.prototype.fail=function(){var e;return"started"===this.state?(this.state="failed","function"==typeof(e=this.adapter).visitFailed?e.visitFailed(this):void 0):void 0},n.prototype.changeHistory=function(){var e,t;return this.historyChanged?void 0:(e=this.location.isEqualTo(this.referrer)?"replace":this.action,t=i(e),this.controller[t](this.location,this.restorationIdentifier),this.historyChanged=!0)},n.prototype.issueRequest=function(){return this.shouldIssueRequest()&&null==this.request?(this.progress=0,this.request=new e.HttpRequest(this,this.location,this.referrer),this.request.send()):void 0},n.prototype.getCachedSnapshot=function(){var e;return!(e=this.controller.getCachedSnapshotForLocation(this.location))||null!=this.location.anchor&&!e.hasAnchor(this.location.anchor)||"restore"!==this.action&&!e.isPreviewable()?void 0:e},n.prototype.hasCachedSnapshot=function(){return null!=this.getCachedSnapshot()},n.prototype.loadCachedSnapshot=function(){var e,t;return(t=this.getCachedSnapshot())?(e=this.shouldIssueRequest(),this.render(function(){var n;return this.cacheSnapshot(),this.controller.render({snapshot:t,isPreview:e},this.performScroll),"function"==typeof(n=this.adapter).visitRendered&&n.visitRendered(this),e?void 0:this.complete()})):void 0},n.prototype.loadResponse=function(){return null!=this.response?this.render(function(){var e,t;return this.cacheSnapshot(),this.request.failed?(this.controller.render({error:this.response},this.performScroll),"function"==typeof(e=this.adapter).visitRendered&&e.visitRendered(this),this.fail()):(this.controller.render({snapshot:this.response},this.performScroll),"function"==typeof(t=this.adapter).visitRendered&&t.visitRendered(this),this.complete())}):void 0},n.prototype.followRedirect=function(){return this.redirectedToLocation&&!this.followedRedirect?(this.location=this.redirectedToLocation,this.controller.replaceHistoryWithLocationAndRestorationIdentifier(this.redirectedToLocation,this.restorationIdentifier),this.followedRedirect=!0):void 0},n.prototype.requestStarted=function(){var e;return this.recordTimingMetric("requestStart"),"function"==typeof(e=this.adapter).visitRequestStarted?e.visitRequestStarted(this):void 0},n.prototype.requestProgressed=function(e){var t;return this.progress=e,"function"==typeof(t=this.adapter).visitRequestProgressed?t.visitRequestProgressed(this):void 0},n.prototype.requestCompletedWithResponse=function(t,n){return this.response=t,null!=n&&(this.redirectedToLocation=e.Location.wrap(n)),this.adapter.visitRequestCompleted(this)},n.prototype.requestFailedWithStatusCode=function(e,t){return this.response=t,this.adapter.visitRequestFailedWithStatusCode(this,e)},n.prototype.requestFinished=function(){var e;return this.recordTimingMetric("requestEnd"),"function"==typeof(e=this.adapter).visitRequestFinished?e.visitRequestFinished(this):void 0},n.prototype.performScroll=function(){return this.scrolled?void 0:("restore"===this.action?this.scrollToRestoredPosition()||this.scrollToTop():this.scrollToAnchor()||this.scrollToTop(),this.scrolled=!0)},n.prototype.scrollToRestoredPosition=function(){var e,t;return e=null!=(t=this.restorationData)?t.scrollPosition:void 0,null!=e?(this.controller.scrollToPosition(e),!0):void 0},n.prototype.scrollToAnchor=function(){return null!=this.location.anchor?(this.controller.scrollToAnchor(this.location.anchor),!0):void 0},n.prototype.scrollToTop=function(){return this.controller.scrollToPosition({x:0,y:0})},n.prototype.recordTimingMetric=function(e){var t;return null!=(t=this.timingMetrics)[e]?t[e]:t[e]=(new Date).getTime()},n.prototype.getTimingMetrics=function(){return e.copyObject(this.timingMetrics)},i=function(e){switch(e){case"replace":return"replaceHistoryWithLocationAndRestorationIdentifier";case"advance":case"restore":return"pushHistoryWithLocationAndRestorationIdentifier"}},n.prototype.shouldIssueRequest=function(){return"restore"!==this.action||!this.hasCachedSnapshot()},n.prototype.cacheSnapshot=function(){return this.snapshotCached?void 0:(this.controller.cacheSnapshot(),this.snapshotCached=!0)},n.prototype.render=function(e){return this.cancelRender(),this.frame=requestAnimationFrame(function(t){return function(){return t.frame=null,e.call(t)}}(this))},n.prototype.cancelRender=function(){return this.frame?cancelAnimationFrame(this.frame):void 0},n}()}.call(this),function(){var t=function(e,t){return function(){return e.apply(t,arguments)}};e.Controller=function(){function n(){this.clickBubbled=t(this.clickBubbled,this),this.clickCaptured=t(this.clickCaptured,this),this.pageLoaded=t(this.pageLoaded,this),this.history=new e.History(this),this.view=new e.View(this),this.scrollManager=new e.ScrollManager(this),this.restorationData={},this.clearCache()}return n.prototype.start=function(){return e.supported&&!this.started?(addEventListener("click",this.clickCaptured,!0),addEventListener("DOMContentLoaded",this.pageLoaded,!1),this.scrollManager.start(),this.startHistory(),this.started=!0,this.enabled=!0):void 0},n.prototype.disable=function(){return this.enabled=!1},n.prototype.stop=function(){return this.started?(removeEventListener("click",this.clickCaptured,!0),removeEventListener("DOMContentLoaded",this.pageLoaded,!1),this.scrollManager.stop(),this.stopHistory(),this.started=!1):void 0},n.prototype.clearCache=function(){return this.cache=new e.SnapshotCache(10)},n.prototype.visit=function(t,n){var i,r;return null==n&&(n={}),t=e.Location.wrap(t),this.applicationAllowsVisitingLocation(t)?this.locationIsVisitable(t)?(i=null!=(r=n.action)?r:"advance",this.adapter.visitProposedToLocationWithAction(t,i)):window.location=t:void 0},n.prototype.startVisitToLocationWithAction=function(t,n,i){var r;return e.supported?(r=this.getRestorationDataForIdentifier(i),this.startVisit(t,n,{restorationData:r})):window.location=t},n.prototype.startHistory=function(){return this.location=e.Location.wrap(window.location),this.restorationIdentifier=e.uuid(),this.history.start(),this.history.replace(this.location,this.restorationIdentifier)},n.prototype.stopHistory=function(){return this.history.stop()},n.prototype.pushHistoryWithLocationAndRestorationIdentifier=function(t,n){return this.restorationIdentifier=n,this.location=e.Location.wrap(t),this.history.push(this.location,this.restorationIdentifier)},n.prototype.replaceHistoryWithLocationAndRestorationIdentifier=function(t,n){return this.restorationIdentifier=n,this.location=e.Location.wrap(t),this.history.replace(this.location,this.restorationIdentifier)},n.prototype.historyPoppedToLocationWithRestorationIdentifier=function(t,n){var i;return this.restorationIdentifier=n,this.enabled?(i=this.getRestorationDataForIdentifier(this.restorationIdentifier),this.startVisit(t,"restore",{restorationIdentifier:this.restorationIdentifier,restorationData:i,historyChanged:!0}),this.location=e.Location.wrap(t)):this.adapter.pageInvalidated()},n.prototype.getCachedSnapshotForLocation=function(e){var t;return t=this.cache.get(e),t?t.clone():void 0},n.prototype.shouldCacheSnapshot=function(){return this.view.getSnapshot().isCacheable()},n.prototype.cacheSnapshot=function(){var e;return this.shouldCacheSnapshot()?(this.notifyApplicationBeforeCachingSnapshot(),e=this.view.getSnapshot(),this.cache.put(this.lastRenderedLocation,e.clone())):void 0},n.prototype.scrollToAnchor=function(e){var t;return(t=document.getElementById(e))?this.scrollToElement(t):this.scrollToPosition({x:0,y:0})},n.prototype.scrollToElement=function(e){return this.scrollManager.scrollToElement(e)},n.prototype.scrollToPosition=function(e){return this.scrollManager.scrollToPosition(e)},n.prototype.scrollPositionChanged=function(e){var t;return t=this.getCurrentRestorationData(),t.scrollPosition=e},n.prototype.render=function(e,t){return this.view.render(e,t)},n.prototype.viewInvalidated=function(){return this.adapter.pageInvalidated()},n.prototype.viewWillRender=function(e){return this.notifyApplicationBeforeRender(e)},n.prototype.viewRendered=function(){return this.lastRenderedLocation=this.currentVisit.location,this.notifyApplicationAfterRender()},n.prototype.pageLoaded=function(){return this.lastRenderedLocation=this.location,this.notifyApplicationAfterPageLoad()},n.prototype.clickCaptured=function(){return removeEventListener("click",this.clickBubbled,!1),addEventListener("click",this.clickBubbled,!1)},n.prototype.clickBubbled=function(e){var t,n,i;return this.enabled&&this.clickEventIsSignificant(e)&&(n=this.getVisitableLinkForNode(e.target))&&(i=this.getVisitableLocationForLink(n))&&this.applicationAllowsFollowingLinkToLocation(n,i)?(e.preventDefault(),t=this.getActionForLink(n),this.visit(i,{action:t})):void 0},n.prototype.applicationAllowsFollowingLinkToLocation=function(e,t){var n;return n=this.notifyApplicationAfterClickingLinkToLocation(e,t),!n.defaultPrevented},n.prototype.applicationAllowsVisitingLocation=function(e){var t;return t=this.notifyApplicationBeforeVisitingLocation(e),!t.defaultPrevented},n.prototype.notifyApplicationAfterClickingLinkToLocation=function(t,n){return e.dispatch("turbolinks:click",{target:t,data:{url:n.absoluteURL},cancelable:!0})},n.prototype.notifyApplicationBeforeVisitingLocation=function(t){return e.dispatch("turbolinks:before-visit",{data:{url:t.absoluteURL},cancelable:!0})},n.prototype.notifyApplicationAfterVisitingLocation=function(t){return e.dispatch("turbolinks:visit",{data:{url:t.absoluteURL}})},n.prototype.notifyApplicationBeforeCachingSnapshot=function(){return e.dispatch("turbolinks:before-cache")},n.prototype.notifyApplicationBeforeRender=function(t){return e.dispatch("turbolinks:before-render",{data:{newBody:t}})},n.prototype.notifyApplicationAfterRender=function(){return e.dispatch("turbolinks:render")},n.prototype.notifyApplicationAfterPageLoad=function(t){return null==t&&(t={}),e.dispatch("turbolinks:load",{data:{url:this.location.absoluteURL,timing:t}})},n.prototype.startVisit=function(e,t,n){var i;return null!=(i=this.currentVisit)&&i.cancel(),this.currentVisit=this.createVisit(e,t,n),this.currentVisit.start(),this.notifyApplicationAfterVisitingLocation(e)},n.prototype.createVisit=function(t,n,i){
var r,o,s,a,l;return o=null!=i?i:{},a=o.restorationIdentifier,s=o.restorationData,r=o.historyChanged,l=new e.Visit(this,t,n),l.restorationIdentifier=null!=a?a:e.uuid(),l.restorationData=e.copyObject(s),l.historyChanged=r,l.referrer=this.location,l},n.prototype.visitCompleted=function(e){return this.notifyApplicationAfterPageLoad(e.getTimingMetrics())},n.prototype.clickEventIsSignificant=function(e){return!(e.defaultPrevented||e.target.isContentEditable||e.which>1||e.altKey||e.ctrlKey||e.metaKey||e.shiftKey)},n.prototype.getVisitableLinkForNode=function(t){return this.nodeIsVisitable(t)?e.closest(t,"a[href]:not([target])"):void 0},n.prototype.getVisitableLocationForLink=function(t){var n;return n=new e.Location(t.getAttribute("href")),this.locationIsVisitable(n)?n:void 0},n.prototype.getActionForLink=function(e){var t;return null!=(t=e.getAttribute("data-turbolinks-action"))?t:"advance"},n.prototype.nodeIsVisitable=function(t){var n;return!(n=e.closest(t,"[data-turbolinks]"))||"false"!==n.getAttribute("data-turbolinks")},n.prototype.locationIsVisitable=function(e){return e.isPrefixedBy(this.view.getRootLocation())&&e.isHTML()},n.prototype.getCurrentRestorationData=function(){return this.getRestorationDataForIdentifier(this.restorationIdentifier)},n.prototype.getRestorationDataForIdentifier=function(e){var t;return null!=(t=this.restorationData)[e]?t[e]:t[e]={}},n}()}.call(this),function(){var t,n,i;e.start=function(){return n()?(null==e.controller&&(e.controller=t()),e.controller.start()):void 0},n=function(){return null==window.Turbolinks&&(window.Turbolinks=e),i()},t=function(){var t;return t=new e.Controller,t.adapter=new e.BrowserAdapter(t),t},i=function(){return window.Turbolinks===e},i()&&e.start()}.call(this)}).call(this),"object"==typeof module&&module.exports?module.exports=e:"function"==typeof define&&define.amd&&define(e)}).call(this);