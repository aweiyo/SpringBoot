<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0034)http://busi.niiker.com/login/index -->
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><script src="../static/js/jquery-1.7.2.min.js"></script>
<script src="../static/js/public.js"></script>
<script src="../static/js/jquery.availability-1.0.3.js"></script>
<script>
	var _uiMini = new UiAlertMini();
	var _UiLoading = new UiLoading();
	_UiLoading.init();
	
	//判断v变量是否为空，allowBlank是否允许输入全空格
	function _isEmpty(v, allowBlank) {
		return v === null || v === undefined || v === '' || (!allowBlank ? (new RegExp("^[ ]+$").test(v)) : true);
	}
	
	function _onBlurMaxLength(obj, len) {
		if(!isEmpty(obj, false) && !isNaN(len) && (Number(len) > 0)) {
			var val = $(obj).val();
			if(!isEmpty(val, false)) {
				if(!_regExpFunction.maxLength(val, len)) {
					val = val.substring(0, len);
				}	
				$(obj).val(val);
			}else{
				$(obj).val("");
			}
		}else{
			$(obj).val("");
		}
	}
	
	function _checkFormEmpty(alertTitle, checkObj) {
		var ind = 0;
		if(!_isEmpty(checkObj, false) && checkObj.length > 0) {
			alertTitle = (isEmpty(alertTitle, false) ? "消息提醒" : alertTitle);
			$(checkObj).each(function() {
				var id = $(this)[0].id;
				var val = $("#"+id).val();
				if(_isEmpty(val, false)) {
					var msg = $(this)[0].msg;
					msg = (isEmpty(msg, false) ? "表单校验不通过。" : msg);
					_uiMini.alert(alertTitle, msg, function() {
						$("#"+id).focus();
					});
					return false;
				} else {
					ind = Number(ind) + 1;
				}
			});
		}
		if(!_isEmpty(checkObj, false) && checkObj.length > 0) {
			return (ind == checkObj.length);
		}else{
			return false;
		}
	}
</script>
<script>
var _showTipRed = "red";
$(document).ready(function(){
	if(typeof(_showTipObj) != "undefined" && !_isEmpty(_showTipObj, false) && _showTipObj.length > 0) {
		$(_showTipObj).each(function() {
			var id = $(this)[0].id;
			var msg = $(this)[0].msg;
			$('.'+id).qtip({ 
			    content: '<span class="'+_showTipRed+'">'+msg+'</span>',
			    style: { name: 'cream', tip: true }
			});
		});
	}
});
</script>


<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>登录，泥客网</title><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="shortcut icon" href="http://img.niiker.com/group1/M00/02/66/wKgAD1hXT9yAd5BXAAAQvknTk0w758.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="../static/js/public.css">
<link rel="stylesheet" type="text/css" href="../static/js/member.css">
<style type="text/css">
html{width: 100%;height: 100%;}
</style>
<script src="../static/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
function clickloginbtn() {
	document.form_login.action="http://busi.niiker.com/login/login";
	document.form_login.submit();
}
function clickForgetBtn() {
	_uiMini.alert("消息", "请联系管理员.");
}
</script>
</head>
<body class="fullScreen" style="background-image:url(http://img.niiker.com/group1/M00/02/66/wKgAD1hXUFuAW8QrAAkVpLwLeEk823.jpg);">
<div class="mainner mainner-member mainner-login">
  <div class="member login">
    <div class="login-box">
      <div class="login-logo" onclick="location.href=&#39;http://www.niiker.com&#39;;">
        <p class="logo-text">中大型企业互联网云平台</p>
      </div>
      <div class="form">
        <form name="form_login" id="j_form_login" method="post" action="http://busi.niiker.com/login/index">
          <dl class="user" id="j_item_loginAccount">
            <dd><input class="text textl" id="j_loginAccount" name="account" type="text" placeholder="用户名、手机号或邮箱"><i class="icon-user"></i></dd>
            <dd>
              <div class="tipbar" id="j_loginAccount_tip">请填写注册的用户名、手机号或邮箱</div>
            </dd>
          </dl>
          <dl class="password" id="j_item_loginPwd">
            <dd><input class="text textl" id="j_loginPwd" name="password" type="password" placeholder="密码"><i class="icon-password"></i></dd>
            <dd>
              <div class="tipbar" id="j_loginPwd_tip">请填写密码</div>
            </dd>
          </dl>
          <div class="submit">
            <a class="btn-login" id="j_btn_login" href="javascript:void(0)">立即登录</a>
          </div>
          <div class="loginAuto">
            <span><a href="javascript:void(0);" onclick="clickForgetBtn()">忘记密码？</a></span>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<!--S footer-->

<div class="footer footer-login">
  <div class="bottom" id="j_login_bottom" style="padding-top: 14.625px; padding-bottom: 14.625px;">
    <div class="w">
      <p style="text-align:center;">
	<span style="color:#999999;"><a href="https://github.com/aweiyo" target="_blank"><span style="color:#999999;">©2017</span></a></span><span style="color:#999999;">&nbsp;</span><br>
版权归属：aweiyo
</p>
    </div>
  </div>
</div>
<!--E footer-->

<!--[if lte IE 8]>
<div class="mask" id="mask_ie6_box" style="display:block;z-index:9999;"></div>
<div class="ie6_box" id="alert_ie6_box">
    <h6>Woo！您的IE浏览器版本过低，请升级您的浏览器，以享受更优质的浏览效果！</h6>
    <p>我们建议您使用以下浏览器之一：</p>
    <ul>
        <li><a href="http://www.downza.cn/soft/26885.html"  class="chrome">谷歌Chrome浏览器</a></li>
        <li><a href="http://www.apple.com/safari/download/"  class="safari">苹果Safari浏览器</a></li>
        <li><a href="http://www.mozilla.org/en-US/firefox/fx/"  class="firefox">Firefox浏览器</a></li>
        <li><a href="http://windows.microsoft.com/en-US/internet-explorer/downloads/ie"  class="ie89">Internet
            Explorer最新版</a></li>
    </ul>
    <span><a href="javascript:;" class="ie6_btnClose" onclick="hide_ie6_box();">暂不升级，继续浏览</a></span>
</div>
<script type="text/javascript">
    var alert_ie6_box = document.getElementById('alert_ie6_box');
    var mask_ie6_box = document.getElementById('mask_ie6_box');
    function hide_ie6_box() {
        alert_ie6_box.style.display = 'none';
        mask_ie6_box.style.display = 'none';
    }
</script>
<![endif]-->


<script src="../static/js/public.js"></script>
<script src="../static/js/checkForm.js"></script>
<script>

$(function(){
  var thisWindowHeight = $(window).height() - 521,
      j_login_content = $('#j_login_content'),
      j_login_bottom = $('#j_login_bottom');

  j_login_content.css({
    'paddingTop': thisWindowHeight *0.42,
    'paddingBottom': thisWindowHeight *0.33
  });
  j_login_bottom.css({
    'paddingTop': thisWindowHeight *0.125,
    'paddingBottom': thisWindowHeight *0.125
  });
  $(window).resize(function(){
    thisWindowHeight = $(window).height() - 521;
    j_login_content.css({
      'paddingTop': thisWindowHeight *0.42,
      'paddingBottom': thisWindowHeight *0.33
    });
    j_login_bottom.css({
      'paddingTop': thisWindowHeight *0.125,
      'paddingBottom': thisWindowHeight *0.125
    });
  });

  // 浏览器判断
  (function(){
    var elem = $('#J_WornningBar'), close = $('#J_WornningBar_Close'), timer, bottom = parseInt(elem.css('bottom'));
    if($.browser.msie || $.browser.opera){
      elem.animate({bottom: 0},400, function(){
        timer = setTimeout(closeElem,15000);
      });
      close.on('click', function(){
        closeElem();
      });
    }
    function closeElem(){
      if(timer) clearTimeout(timer);
      elem.animate({bottom: bottom},200);
    }
  })();
  
});

document.onkeydown=keyListener;    

function keyListener(e) {    
    e = e ? e : event;   
    if(e.keyCode == 13) { 
    	var account = login.username.input.val(), pwd = login.password.input.val();
	    if (account.length > 0) {
	        login.username.active = true;
	    }else{
	        checkFormFn.onError(login.username.parent);
	        login.username.tip.html(checkFormPrompt.logName.error); 
	        return false;
	    }
	    if (pwd.length > 0) {
	        login.password.active = true;
	    }else{
	        checkFormFn.onError(login.password.parent);
	        login.password.tip.html(checkFormPrompt.pwd.isNull); 
	        return false;
	    }  
        
    	_UiLoading.load('登录中，请稍等...',function(){},function(){
    		clickloginbtn();
    	});   
    }    
}
</script></body></html>