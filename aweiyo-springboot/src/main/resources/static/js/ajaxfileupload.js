// JavaScript Document
jQuery.extend({

	createUploadIframe : function(id, uri) {
		// create frame
		var frameId = 'jUploadFrame' + id;
		var io;

		if (window.ActiveXObject) {
			try{
				io = document.createElement('<iframe id="' + frameId + '" name="' + frameId + '" />');
			}
			catch(e)
			{
				io = document.createElement('iframe');
				io.id = frameId;
				io.name = frameId;
			}
			if (typeof uri == 'boolean') {
				io.src = 'javascript:false';
			} else if (typeof uri == 'string') {
				io.src = uri;
			}
		} else {
			io = document.createElement('iframe');
			io.id = frameId;
			io.name = frameId;
		}
		io.style.position = 'absolute';
		io.style.top = '-1000px';
		io.style.left = '-1000px';

		document.body.appendChild(io);

		return io;
	},
	createUploadForm : function(id, fileElementId, data) {
		// create form
		var formId = 'jUploadForm' + id;
		var fileId = 'jUploadFile' + id;
		var form = jQuery('<form  action="" method="POST" name="' + formId
				+ '" id="' + formId + '" enctype="multipart/form-data"></form>');
		var oldElement = jQuery('#' + fileElementId);
		var newElement = jQuery(oldElement).clone();
		jQuery(oldElement).attr('id', fileId);
		jQuery(oldElement).before(newElement);
		jQuery(oldElement).appendTo(form);
		// set post parms
		if (data) {    
           for (var i in data) {    
               jQuery('<input type="hidden" name="' + i + '" value="' + data[i] + '" />').appendTo(form);    
           }    
        }
		// set attributes
		jQuery(form).css('position', 'absolute');
		jQuery(form).css('top', '-1200px');
		jQuery(form).css('left', '-1200px');
		jQuery(form).appendTo('body');
		return form;
	},

	ajaxFileUpload : function(s) {
		// TODO introduce global settings, allowing the client to modify them
		// for all requests, not only timeout
		s = jQuery.extend({}, jQuery.ajaxSettings, s);
		var id = s.fileElementId;
		var form = jQuery.createUploadForm(id, s.fileElementId, s.data);
		var io = jQuery.createUploadIframe(id, s.secureuri);
		var frameId = 'jUploadFrame' + id;
		var formId = 'jUploadForm' + id;

		if (s.global && !jQuery.active++) {
			// Watch for a new set of requests
			jQuery.event.trigger("ajaxStart");
		}
		var requestDone = false;
		// Create the request object
		var xml = {};
		if (s.global) {
			jQuery.event.trigger("ajaxSend", [xml, s]);
		}

		var uploadCallback = function(isTimeout) {
			// Wait for a response to come back
			var io = document.getElementById(frameId);
			try {
				if (io.contentWindow) {
					xml.responseText = io.contentWindow.document.body
							? io.contentWindow.document.body.innerHTML
							: null;
					xml.responseXML = io.contentWindow.document.XMLDocument
							? io.contentWindow.document.XMLDocument
							: io.contentWindow.document;

				} else if (io.contentDocument) {
					xml.responseText = io.contentDocument.document.body
							? io.contentDocument.document.body.innerHTML
							: null;
					xml.responseXML = io.contentDocument.document.XMLDocument
							? io.contentDocument.document.XMLDocument
							: io.contentDocument.document;
				}
			} catch (e) {
				jQuery.handleError(s, xml, null, e);
			}
			if (xml || isTimeout == "timeout") {
				requestDone = true;
				var status;
				try {
					status = isTimeout != "timeout" ? "success" : "error";
					// Make sure that the request was successful or notmodified
					if (status != "error") {
						// process the data (runs the xml through httpData
						// regardless of callback)
						var data = jQuery.uploadHttpData(xml, s.dataType);
						if (s.success) {
							// ifa local callback was specified, fire it and
							// pass it the data
							s.success(data, status);
						};
						if (s.global) {
							// Fire the global callback
							jQuery.event.trigger("ajaxSuccess", [xml, s]);
						};
					} else {
						jQuery.handleError(s, xml, status);
					}

				} catch (e) {
					status = "error";
					jQuery.handleError(s, xml, status, e);
				};
				if (s.global) {
					// The request was completed
					jQuery.event.trigger("ajaxComplete", [xml, s]);
				};

				// Handle the global AJAX counter
				if (s.global && !--jQuery.active) {
					jQuery.event.trigger("ajaxStop");
				};
				if (s.complete) {
					s.complete(xml, status);
				};

				jQuery(io).unbind();

				setTimeout(function() {
							try {
								jQuery(io).remove();
								jQuery(form).remove();

							} catch (e) {
								jQuery.handleError(s, xml, null, e);
							}

						}, 100);

				xml = null;

			};
		}
		// Timeout checker
		if (s.timeout > 0) {
			setTimeout(function() {

						if (!requestDone) {
							// Check to see ifthe request is still happening
							uploadCallback("timeout");
						}

					}, s.timeout);
		}
		try {
			var form = jQuery('#' + formId);
			var paradata = s.data;
			if (paradata) {    
	           for (var i in paradata) { 
	        	   s.url = s.url + "&" + i + "=" + paradata[i];
	           }    
	        }
			jQuery(form).attr('action', s.url);
			jQuery(form).attr('method', 'POST');
			jQuery(form).attr('target', frameId);
			if (form.encoding) {
				form.encoding = 'multipart/form-data';
			} else {
				form.enctype = 'multipart/form-data';
			}
			jQuery(form).submit();

		} catch (e) {
			jQuery.handleError(s, xml, null, e);
		}
		if (window.attachEvent) {
			document.getElementById(frameId).attachEvent('onload',
					uploadCallback);
		} else {
			document.getElementById(frameId).addEventListener('load',
					uploadCallback, false);
		}
		return {
			abort : function() {
			}
		};

	},

	uploadHttpData : function(r, type) {
		var data = !type;
		data = type == "xml" || data ? r.responseXML : r.responseText;
		// ifthe type is "script", eval it in global context
		if (type == "script") {
			jQuery.globalEval(data);
		}

		// Get the JavaScript object, ifJSON is used.
		if (type == "json") {
			eval("data = " + data);
		}

		// evaluate scripts within html
		if (type == "html") {
			jQuery("<div>").html(data).evalScripts();
		}

		return data;
	},
	
	handleError: function( s, xhr, status, e )      {  
        // If a local callback was specified, fire it  
                if ( s.error ) {  
                    s.error.call( s.context || s, xhr, status, e );  
                }  
  
                // Fire the global callback  
                if ( s.global ) {  
                    (s.context ? jQuery(s.context) : jQuery.event).trigger( "ajaxError", [xhr, s, e] );  
                }  
    } 
});


//afterFunctionΪ�ϴ����֮����ķ���
//���ݵĲ���paramo��������:
//1: file_path�ϴ��ļ��Ĵ�Ÿ�Ŀ¼�̷�ѡ�Ĭ�ϲ�������ݡ�
//2: file_type�ϴ��ļ����������ƣ�ѡ�Ĭ�ϸ�ʽΪjpg,jpeg,bmp������Ҫ���Ӷ���ö��Ÿ�����
//3: file_size�ϴ��ļ��Ĵ�С���ƣ�ѡ�Ĭ�ϴ�СΪ1M������Ҫ����ֻ��дMΪ��λ�����֣�2 3 4
//4: file_cut�ϴ����ļ��Ƿ���Ҫ��ʱ�иѡ�Ĭ��Ϊ0����ʱ�и��Ҫ��ʱ�и�봫�ݲ���ֵ1
//5: bid�����ļ��е�Ŀ¼�ṹ��Ŀǰ���̼�businessIdΪΨһ��ʶ������
//6: num�����ļ���ĵڼ��ţ�ѡ�Ĭ��Ϊ1���ڵ�һ��
//7: oid�����ļ����·����ַ����file_cut=1ʱoid�������ѡ��
//8: file_date�����ļ����·����ַ����file_cut=1ʱfile_date�������ѡ����ݸ�ʽ��"20150101"
//9: upload_type�����ļ�·�����ļ���Ĵ��������ֻ�ܴ�UploadType.java�н���ѡ��
//10: upload_time�����ļ��ϴ��ȴ�ʱ������Ϊ��λ��ѡ�Ĭ��Ϊ1500���롣
function _uploadFile(obj, paramo, afterFunction) {
	var result = "";
	var objid = obj.id;
	jQuery.ajaxFileUpload({
		url:"/upload.do?action=uploadFile",
		secureuri:false,
		fileElementId:objid,
		data:paramo,
		dataType: 'text',
		success: function(data){
			if(afterFunction && typeof(eval(afterFunction))=="function") {
				eval(afterFunction+"("+data+")");
			}
		},
		error: function(data, status, e){
		}
	});
}

//afterFunctionΪɾ�����֮����ķ���
//���ݵĲ���paramo��������:
//1: file_cut�ϴ����ļ��Ƿ���Ҫ��ʱ�иѡ�Ĭ��Ϊ0����ʱ�и��Ҫ��ʱ�и�봫�ݲ���ֵ1
//2: bid�����ļ��е�Ŀ¼�ṹ��Ŀǰ���̼�businessIdΪΨһ��ʶ������
//3: oid�����ļ����·����ַ����file_cut=1ʱoid�������ѡ��
//4: file_date�����ļ����·����ַ����file_cut=1ʱfile_date�������ѡ����ݸ�ʽ��"20150101"
//5: upload_type�����ļ�·�����ļ���Ĵ��������ֻ�ܴ�UploadType.java�н���ѡ��
//6: file_name�ļ��ϴ������ƣ�����
function _deleteFile(paramo, afterFunction) {
$.ajax({
	type: "POST",
	url: "/upload.do?action=deleteFile",
	data: paramo,
	async: false,
	error: function(request) {
	},
	success: function(data) {
		if(data) {
			var obj = eval("("+data+")");
			var state = obj.fileState;
			var param1 = obj.param1;
			var param2 = obj.param2;
			if("0"==state) {
				if(afterFunction && typeof(eval(afterFunction))=="function") {
					if((param1 === null || param1 === undefined || param1 === '') && (param2 === null || param2 === undefined || param2 === '')) {
						eval(afterFunction+"()");
					} else {
						eval(afterFunction+"("+data+")");
					}
				}
			}else{
				alert(obj.fileMessage);
			}
		}
	}
});
}