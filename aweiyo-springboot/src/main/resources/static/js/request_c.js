function btnSty(objId, objStyle) {
	document.getElementById(objId).style.display = objStyle
}
// 提示窗口控制
function ifodis(tagname) {
	btnSty(tagname, 'none');
}
function settime(a) {
	setTimeout(a, 1000);
}
function loadtime() {
	document.getElementById(tagname).innerHTML += "+"
}
// XML数据绑定

function loadurlCallback(url, itagname, iprolist, callback) {
	var prolist = iprolist;
	var tagname = itagname;
	// 定义往址参数
	// var url = filename;
	// 定义为异步传输模式
	var xmldoc = false;
	// Mozill,Safari等浏览器时需要创建的XMLHttp类
	if (window.XMLHttpRequest) {
		xmldoc = new XMLHttpRequest();
		if (xmldoc.overrideMimeType) {
			xmldoc.overrideMimeType('text/xml');
		}
	}
	// IE浏览器时创建的XMLHttp类
	else if (window.ActiveXObject) {
		try {
			xmldoc = new ActiveXObject("Msxml3.XMLHTTP");
		} catch (e) {
			try {
				xmldoc = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					xmldoc = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
				}
			}
		}
	}
	// 不能创建XMLHTTP类时返回
	if (!xmldoc) {
		return false;
	}
	// 调用CheckState函数
	xmldoc.onreadystatechange = function CheckState() {
		btnSty(tagname, '');
		document.getElementById(tagname).innerHTML = "正在加载数据......";
		// 收到完整的服务器响应
		if (xmldoc.readyState == 1) {
			document.getElementById(tagname).innerHTML = "正在加载数据......";
			// document.getElementById(tagname).innerHTML = "&nbsp;&nbsp;<font
			// color=red>接服务器...</font>";
		} else if (xmldoc.readyState == 2) {
			document.getElementById(tagname).innerHTML = "正在加载数据......";
		} else if (xmldoc.readyState == 3) {
			document.getElementById(tagname).innerHTML = "正在加载数据......";
			// settime(loadtime)
		} else if (xmldoc.readyState == 4) {
			// HTTP服务器响应值成功
			if (xmldoc.status == 200) {
				// 将服务器返回的字符串写到页面中ID为showdiv的区域
				// document.getElementById(tagname).innerHTML =
				// "&nbsp;&nbsp;<font color=green>加载完成</font>";
				// document.getElementById(tagname).innerHTML = "";
				// settime(ifodis);
				ifodis(tagname);
				var response = xmldoc.responseText;
				document.getElementById(prolist).innerHTML = response;
				// prolist.innerHTML = "hi";
				eval(callback + "()");
				try {
					asynPageOnLoad();
				} catch (e) {
					// alert(e.description);
				}

			} else {
				document.getElementById(tagname).innerHTML = "错误" + xmldoc.statusText + "请重新选择";
			}
		}
	}

	// 以下是再次封装传递的参数
	if(document.getElementById(tagname + "_searchKeyId")) {
		var _selectedSearchKeyId = document.getElementById(tagname + "_searchKeyId").value;
		url = url + "&_selectedSearchKeyId="+_selectedSearchKeyId;
	}
	for(var i = 1; i <= 5; i++) {
		if(document.getElementById(tagname + "_extParam" + i)) {
			var _extParamVal = document.getElementById(tagname + "_extParam" + i).value;
			url = url + "&_extParam"+i+"="+_extParamVal;
		}
	}
	
	xmldoc.open('POST', url, true);
	xmldoc.send(null);
}

function loadurl_c(url, itagname, iprolist) {
	var prolist = iprolist;
	var tagname = itagname;
	// 定义往址参数
	// var url = filename;
	// 定义为异步传输模式
	var xmldoc = false;
	// Mozill,Safari等浏览器时需要创建的XMLHttp类
	if (window.XMLHttpRequest) {
		xmldoc = new XMLHttpRequest();
		if (xmldoc.overrideMimeType) {
			xmldoc.overrideMimeType('text/xml');
		}
	}
	// IE浏览器时创建的XMLHttp类
	else if (window.ActiveXObject) {
		try {
			xmldoc = new ActiveXObject("Msxml3.XMLHTTP");
		} catch (e) {
			try {
				xmldoc = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					xmldoc = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
				}
			}
		}
	}
	// 不能创建XMLHTTP类时返回
	if (!xmldoc) {
		return false;
	}
	// 调用CheckState函数
	xmldoc.onreadystatechange = function CheckState() {
		btnSty(tagname, '');
		document.getElementById(tagname).innerHTML = "正在加载数据......";
		// 收到完整的服务器响应
		if (xmldoc.readyState == 1) {
			document.getElementById(tagname).innerHTML = "正在加载数据......";
			// document.getElementById(tagname).innerHTML = "&nbsp;&nbsp;<font
			// color=red>接服务器...</font>";
		} else if (xmldoc.readyState == 2) {
			document.getElementById(tagname).innerHTML = "正在加载数据......";
		} else if (xmldoc.readyState == 3) {
			document.getElementById(tagname).innerHTML = "正在加载数据......";
			// settime(loadtime)
		} else if (xmldoc.readyState == 4) {
			// HTTP服务器响应值成功
			if (xmldoc.status == 200) {
				// 将服务器返回的字符串写到页面中ID为showdiv的区域
				// document.getElementById(tagname).innerHTML =
				// "&nbsp;&nbsp;<font color=green>加载完成</font>";
				// document.getElementById(tagname).innerHTML = "";
				// settime(ifodis);
				ifodis(tagname);
				var response = xmldoc.responseText;
				document.getElementById(prolist).innerHTML = response;
				// prolist.innerHTML = "hi";
				try {
					asynPageOnLoad();
				} catch (e) {
					// alert(e.description);
				}
			} else {
				document.getElementById(tagname).innerHTML = "错误" + xmldoc.statusText + "请重新选择";
			}
		}
	}

	xmldoc.open('POST', url, true);
	xmldoc.send(null);
}
// 状态检测
