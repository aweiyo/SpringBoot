//验证的正则
var checkFormRegExp = {
    decmal: "^([+-]?)\\d*\\.\\d+$", //浮点数
    decmal1: "^[1-9]\\d*.\\d*|0.\\d*[1-9]\\d*$", //正浮点数
    decmal2: "^-([1-9]\\d*.\\d*|0.\\d*[1-9]\\d*)$", //负浮点数
    decmal3: "^-?([1-9]\\d*.\\d*|0.\\d*[1-9]\\d*|0?.0+|0)$", //浮点数
    decmal4: "^[1-9]\\d*.\\d*|0.\\d*[1-9]\\d*|0?.0+|0$", //非负浮点数（正浮点数 + 0）
    decmal5: "^(-([1-9]\\d*.\\d*|0.\\d*[1-9]\\d*))|0?.0+|0$", //非正浮点数（负浮点数 + 0）
    intege: "^-?[1-9]\\d*$", //整数
    intege1: "^[1-9]\\d*$", //正整数
    intege2: "^-[1-9]\\d*$", //负整数
    num: "^([+-]?)\\d*\\.?\\d+$", //数字
    num1: "^[1-9]\\d*|0$", //正数（正整数 + 0）
    num2: "^-[1-9]\\d*|0$", //负数（负整数 + 0）
    ascii: "^[\\x00-\\xFF]+$", //仅ACSII字符
    chinese: "^[\\u4e00-\\u9fa5]+$", //仅中文
    color: "^[a-fA-F0-9]{6}$", //颜色
    date: "^\\d{4}(\\-|\\/|\.)\\d{1,2}\\1\\d{1,2}$", //日期
    email: "^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$", //邮件
    idcard: "^[1-9]([0-9]{14}|[0-9]{17})$", //身份证
    ip4: "^(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)\\.(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)\\.(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)\\.(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)$", //ip地址
    letter: "^[A-Za-z]+$", //字母
    letter_l: "^[a-z]+$", //小写字母
    letter_u: "^[A-Z]+$", //大写字母
    mobile: "^0?(13|15|17|18|14)[0-9]{9}$", //手机
    notempty: "^\\S+$", //非空
    password: "^.*[A-Za-z0-9\\w_-]+.*$", //密码
    fullNumber: "^[0-9]+$", //数字
    picture: "(.*)\\.(jpg|bmp|gif|ico|pcx|jpeg|tif|png|raw|tga)$", //图片
    qq: "^[1-9]*[1-9][0-9]*$", //QQ号码
    rar: "(.*)\\.(rar|zip|7zip|tgz)$", //压缩文件
    tel: "^[0-9\-()（）]{7,18}$", //电话号码的函数(包括验证国内区号,国际区号,分机号)
    url: "^http[s]?:\\/\\/([\\w-]+\\.)+[\\w-]+([\\w-./?%&=]*)?$", //url
    username: "^[A-Za-z0-9_\\-\\u4e00-\\u9fa5]+$", //户名
    deptname: "^[A-Za-z0-9_()（）\\-\\u4e00-\\u9fa5]+$", //单位名
    zipcode: "^\\d{6}$", //邮编
    realname: "^[A-Za-z\\u4e00-\\u9fa5]+$", // 真实姓名
    companyname: "^[A-Za-z0-9_()（）\\-\\u4e00-\\u9fa5]+$",
    companyaddr: "^[A-Za-z0-9_()（）\\#\\-\\u4e00-\\u9fa5]+$",
    companysite: "^http[s]?:\\/\\/([\\w-]+\\.)+[\\w-]+([\\w-./?%&#=]*)?$",
    //myself
    isPhone: /^0{0,1}(13[0-9]|14[0-9]|15[0-9]|18[0-9])[0-9]{8}$/, //电话号码
    numb: /^[0-9]{11}$/, //11位数字
    isEmail: /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/, //电子邮箱
    nick: /^\w*[a-z]+\w*$/, //由字母数字组成
    patrn: /^.*[A-Za-z0-9\\w_-]+.*$/, //允许大小写字母、数字、小数点、下划线、横杠组成(匹配密码)
    hanziReg: /[\u4e00-\u9fa5]+/, //汉字
    number: /^[0-9]+$/, //纯数字
    gtZeroNumber: /^[0-9]\d*(\.\d+)?$/
};

//验证规则
var checkFormRules = {
    isNull: function (str) {
        return (str == "" || typeof str != "string");
    },
    isNumber: function (str) {
        return new RegExp(checkFormRegExp.number).test(str);
    },
    betweenLength: function (str, _min, _max) {
        return (str.length >= _min && str.length <= _max);
    },
    isUid: function (str) {
        return new RegExp(checkFormRegExp.username).test(str);
    },
    fullNumberName: function (str) {
        return new RegExp(checkFormRegExp.fullNumber).test(str);
    },
    isPwd: function (str) {
        return /^.*([\W_a-zA-z0-9-])+.*$/i.test(str);
    },
    isPwdRepeat: function (str1, str2) {
        return (str1 == str2);
    },
    isEmail: function (str) {
        return new RegExp(checkFormRegExp.email).test(str);
    },
    isTel: function (str) {
        return new RegExp(checkFormRegExp.tel).test(str);
    },
    isMobile: function (str) {
        return new RegExp(checkFormRegExp.mobile).test(str);
    },
    checkType: function (element) {
        return (element.attr("type") == "checkbox" || element.attr("type") == "radio" || element.attr("rel") == "select");
    },
    isRealName: function (str) {
        return new RegExp(checkFormRegExp.realname).test(str);
    },
    isCompanyname: function (str) {
        return new RegExp(checkFormRegExp.companyname).test(str);
    },
    isChinese: function (str) {
        return new RegExp(checkFormRegExp.chinese).test(str);
    },
    isCompanyaddr: function (str) {
        return new RegExp(checkFormRegExp.companyaddr).test(str);
    },
    isCompanysite: function (str) {
        return new RegExp(checkFormRegExp.companysite).test(str);
    },
    simplePwd: function (str) {
//        var pin = $("#regName").val();
//        if (pin.length > 0) {
//            pin = strTrim(pin);
//            if (pin == str) {
//                return true;
//            }
//        }
        return pwdLevel(str) == 1;
    },
    weakPwd: function (str) {
        for(var i = 0; i < weakPwdArray.length; i++) {
            if(weakPwdArray[i] == str) {
                return true;
            }
        }
        return false;
    },
    isZipcode:function(str){
    	return new RegExp(checkFormRegExp.zipcode).test(str);
    },
    isGtZeroNumber:function(str){
        var isValid = new RegExp(checkFormRegExp.gtZeroNumber).test(str);
        if(!isValid){
            return isValid;
        }
        if(parseFloat(str) < 0){
            return false;
        }
        return true;
    }
};

//验证文本
var checkFormPrompt = {
    regName: {
        onFocus: "请输入手机号",
        succeed: "",
        isNull: "请输入手机号",
        error: {
            beUsed: "该手机号已被使用，请重新输入。如果您是&quot;{1}&quot;，请立刻<a href='#' class='blue'>登录</a>",
            badLength: "用户名长度只能在6-20位字符之间",
            badFormat: "用户名只能由中文、英文、数字及“_”、“-”组成",
            fullNumberName: "<span>用户名不能是纯数字，请确认输入的是手机号或者重新输入</span>",
            noChinese: '用户名中不能包含中文',
            badMail: '邮箱地址不正确，请重新输入',
            badMobileNum: '手机号码输入不正确'
        },
        onFocusExpand: function () {
        }
    },
    logName: {
        onFocus: "请填写注册的用户名、手机号或邮箱",
        succeed: "",
        isNull: "请填写注册的用户名、手机号或邮箱",
        error: "请填写注册的用户名、手机号或邮箱"
    },
    pwd: {
        onFocus: "<span>6-20位字符，可使用字母、数字或符号的组合，不建议使用纯数字，纯字母，纯符号</span>",
        onFocusMini: "由6-20位字符，采用字母、数字或符号的组合。",
        succeed: "",
        isNull: "请输入密码",
        error: {
            badLength: "密码长度只能在6-20位字符之间",
            badFormat: "密码只能由英文、数字及标点符号组成",
            simplePwd: "<span>该密码比较简单，有被盗风险，建议您更改为复杂密码，如字母+数字的组合</span>",
            weakPwd: "<span>该密码比较简单，有被盗风险，建议您更改为复杂密码</span>"
        },
        onFocusExpand: function () {
        }
    },
    pwdRepeat: {
        onFocus: "请再次输入密码",
        succeed: "",
        isNull: "请输入密码",
        error: {
            badLength: "密码长度只能在6-20位字符之间",
            badFormat2: "两次输入密码不一致",
            badFormat1: "密码只能由英文、数字及标点符号组成"
        }
    },
    mobileCode: {
        onFocus: "短信验证码",
        succeed: "",
        isNull: "短信验证码",
        error: "验证码错误"
    },
    captcha: {
        onFocus: "请输入验证码",
        succeed: "",
        isNull: "请输入验证码",
        error: "验证码错误"
    },
    protocol: {
        onFocus: "",
        succeed: "",
        isNull: "请先阅读并同意《用户注册协议》",
        error: ""
    },
    empty: {
        onFocus: "",
        succeed: "",
        isNull: "",
        error: ""
    }
};

var register = {
    form: $('#j_form_register'),
    username: {
        input: $('#j_username'),
        tip: $('#j_username_tip'),
        parent: $('#j_item_username'),
        active: false
    },
    password: {
        input: $('#j_password'),
        input2: $('#j_password2'),
        tip: $('#j_password_tip'),
        tip2: $('#j_password_tip2'),
        parent: $('#j_item_password'),
        parent2: $('#j_item_password2'),
        defaultValue: '',
        passwordVal: null,
        active: false,
        active2: false
    },
    captcha: {
        input: $('#j_captcha'),
        parent: $('#j_item_captcha'),
        tip: '',
        active: false
    },
    mobileCode: {
        input: $('#j_mobileCode'),
        parent: $('#j_item_mobileCode'),
        tip: $('#j_password_tip'),
        use: false,
        active: false
    },
    agreement: {
        input: $('#j_isAgreement'),
        tip: '',
        active: false
    },
    submit: {
        button: $('#j_btn_register')
    }
};

//验证操作函数   
var checkFormFn = {
    onError: function(ele){
        if(!ele.hasClass('onError')) ele.addClass('onError');
        if(ele.hasClass('onCorrect')) ele.removeClass('onCorrect');
    },
    onCorrect: function(ele){
        if(ele.hasClass('onError')) ele.removeClass('onError');
        if(!ele.hasClass('onCorrect')) ele.addClass('onCorrect');
    },
    onDefault: function(ele){
        if(ele.hasClass('onError')) ele.removeClass('onError');
        if(!ele.hasClass('onCorrect')) ele.removeClass('onCorrect');
    }
}

/* 异步验证用户名 start */
register.username.input.bind({focusin:function(){
	register.username.parent.removeClass('onError');
	register.username.parent.addClass('onFocus');
	register.username.tip.html(checkFormPrompt.regName.onFocus);
},blur:function(){
	var val = $(this).val();
	checkUsername(val);
},focusout:function(){
	register.username.parent.removeClass('onFocus');
}});

function turnToMobileCode(){
    if(register.mobileCode.parent.css('display') == 'none') register.mobileCode.parent.fadeIn('fast');
    if(register.captcha.parent.css('display') == 'block')  register.captcha.parent.hide();
}
function turnToCaptcha(){
    if(register.captcha.parent.css('display') == 'none') register.captcha.parent.fadeIn('fast');
    if(register.mobileCode.parent.css('display') == 'block')  register.mobileCode.parent.hide();
}
function checkUsername(val){
	var obj = register.username,
        errorTip = checkFormPrompt.regName.error,
        value = val;

	if (value == "" || value == obj.defaultValue){
        turnToCaptcha();
        register.mobileCode.use = false;
	    obj.active = false;
	    return false;
	}else{
        //必须在6~20位之间
        if(value.length < 6 || value.length > 20){
            checkFormFn.onError(obj.parent);
            obj.tip.html(errorTip.badLength);
            turnToCaptcha();
            register.mobileCode.use = false;
            obj.active = false;
            return false;
        }
        //是否包含汉字
        if(checkFormRegExp.hanziReg.test(value)){
            checkFormFn.onError(obj.parent);
            obj.tip.html(errorTip.noChinese);
            turnToCaptcha();
            register.mobileCode.use = false;
            obj.active = false;
            return false;
        }
        //检查是否是电子邮箱或手机号码
        if(value.indexOf("@") > 0){
            if(!checkFormRules.isEmail(value)){
                checkFormFn.onError(obj.parent);
                obj.tip.html(errorTip.badMail);
                turnToCaptcha();
                register.mobileCode.use = false;
                obj.active = false;
                return false;
            }
        }else if(checkFormRegExp.number.test(value)){
            if(checkFormRegExp.numb.test(value)){
                if(!checkFormRegExp.isPhone.test(value)){
                    checkFormFn.onError(obj.parent);
                    obj.tip.html(errorTip.badMobileNum);
                    obj.active = false;
                    return false;
                }else{
                    turnToMobileCode();
                    register.mobileCode.use = true;
                    // turnToCaptcha();
                    // register.mobileCode.parent.fadeIn('fast');
                    // register.captcha.parent.hide();
                }
            }else{
                if(!checkFormRegExp.nick.test(value)){
                    checkFormFn.onError(obj.parent);
                    obj.tip.html(errorTip.fullNumberName);
                    turnToCaptcha();
                    register.mobileCode.use = false;
                    obj.active = false;
                    return false;
                }
            }
        }else{
            turnToCaptcha();
        }
    }

    //通过检测，准备发送校验
    obj.active = true;
    obj.parent.removeClass('onError');
    obj.tip.html("检测中...");
    $.post(
        "#",//url
        {account:obj.input.val()},//data
        function(data){//callback
        if(data == "0"){
          checkFormFn.onCorrect(obj.parent);
          obj.active = true;
          return true;
        }else if(data == "1"){
          checkFormFn.onError(obj.parent);
          obj.tip.html('该用户名已存在，立刻<a class="blue" href="login.html">登录</a>吧？"');
          obj.active = false;
        }else {
          checkFormFn.onError(username.parent);
          obj.tip.html("账号含有特殊字符");
          obj.active = false;
        }
    });

}
/* 验证用户名 end */

/* 验证密码 start */
register.password.input.bind({focusin:function(){
    register.password.parent.removeClass('onError');
    register.password.parent.addClass('onFocus');
    register.password.tip.html(register.password.defaultTipTxt);
},blur:function(){
    var val = $(this).val();
    checkPassword(val);
},focusout:function(){
    register.password.parent.removeClass('onFocus');
}});

register.password.input2.bind({focusin:function(){
    register.password.parent2.removeClass('onError');
    register.password.parent2.addClass('onFocus');
    register.password.tip2.html(register.password.defaultTipTxt2);
},blur:function(){
    var val = $(this).val();
    checkPassword2(val);
},focusout:function(){
    register.password.parent2.removeClass('onFocus');
}});

function checkPassword(val){
    if(val == ""){
        // checkFormFn.onError(password.parent);
        // password.tip.html("密码不能为空");
        register.password.active = false;
        return false;
    }
    if(val.length < 6 || val.length > 20){
        checkFormFn.onError(register.password.parent);
        register.password.tip.html("密码长度只能在6-20位字符之间");
        register.password.active = false;
        return false;
    }
    if(!checkFormRegExp.patrn.test(val)){
        checkFormFn.onError(register.password.parent);
        register.password.tip.html("密码格式不正确");
        register.password.active = false;
        return false;
    }
    //通过测试，显示密码强度
    register.password.active = true;
    checkFormFn.onCorrect(register.password.parent);
    register.password.tip.show();
    pwdLevel(val);
    register.password.passwordVal = val;
}
function checkPassword2(val){
    if(val == ""){
        // checkFormFn.onError(password.parent2);
        // password.tip2.html("请再次输入密码"); 
        register.password.active2 = false;
        return false;
    }
    if(val != register.password.passwordVal){
        checkFormFn.onError(register.password.parent2);
        register.password.tip2.html("两次输入的密码不一致"); 
        register.password.active2 = false;
        return false;
    }else if(!checkFormRegExp.patrn.test(val)){
        checkFormFn.onError(register.password.parent2);
        register.password.tip2.html("请再次输入密码");
        register.password.active2 = false;
        return false;
    }
    checkFormFn.onCorrect(register.password.parent2);
    register.password.active2 = true;
}
/* 验证密码 end */

/* 密码强度验证 start */
function pwdLevel(val){
    var str = '<span>安全等级：</span><span class="icon_psw psw_01"></span>该密码比较简单，建议您改为复杂密码，如字母+数字的组合';
    var str1 = '<span>安全等级：</span><span class="icon_psw psw_02"></span><span></span>该密码比较简单，有被盗风险，建议您更改为复杂密码</span>';
    var str2 = '<span>安全等级：</span><span class="icon_psw psw_03"></span><span>该密码安全级别较高</span>';
    if(val.length < 6 || val.length > 20){
        // checkFormFn.onError(password.parent);
        // password.tip.html('密码长度只能在6-20位字符之间');
        return false;
    }
    if(val.match(/([0-9])+/)) register.password.tip.html(str);
    if(val.match(/([a-zA-Z])+/)) register.password.tip.html(str1);
    if(val.match(/[^a-zA-Z0-9]+/)) register.password.tip.html(str2);
}
/* 密码强度验证 end */

/* 验证验证码 start */
register.captcha.input.bind({focusin:function(){
    register.captcha.parent.removeClass('onError');
    register.captcha.parent.addClass('onFocus');
},focusout:function(){
    register.captcha.parent.removeClass('onFocus');
}});
/* 验证验证码 end */

/* 验证短信验证码 start */
register.mobileCode.input.bind({focusin:function(){
    register.mobileCode.parent.removeClass('onError');
    register.mobileCode.parent.addClass('onFocus');
},focusout:function(){
    register.mobileCode.parent.removeClass('onFocus');
}});
/* 验证短信验证码 end */

/* 同意注册协议 */
function agreementCheck(){
    register.agreement.input.prop('checked',true);
}

/* 看不清验证码，换一张 */
function changeImg(idStr){
    var validateImg = document.getElementById(idStr);
    validateImg.innerHTML ='<img src="http://www.1k360.com/loginLicence?t='+randomChar(6)+'" align="middle">';
}

/* 产生随机数 */
function randomChar(l) {
    var x="123456789poiuytrewqasdfghjklmnbvcxzQWERTYUIPLKJHGFDSAZXCVBNM";
    var tmp="";
    for(var i=0;i< l;i++) {
    tmp += x.charAt(Math.ceil(Math.random()*100000000)%x.length);
    }
    return tmp;
}

/* 限制输入四个字符 */
function checkNameLength(field,maxlimit){ 
    if(field.value.length > maxlimit){
      field.value = field.value.substring(0, maxlimit);
    }
}

/*
* 绑定当用户按下回车键要执行的事件
* [TianMingXing 2014-01-11 17:10]
*/
function BindEnter(obj){
    var button = document.getElementById('submitBtn');
    if(obj.keyCode == 13)      
    {
      button.click();
      obj.returnValue = false;
    }
}

/*===============================================login 登录========================================================*/
var login = {
    form: $('#j_form_login'),
    username: {
        input: $('#j_loginAccount'),
        tip: $('#j_loginAccount_tip'),
        parent: $('#j_item_loginAccount'),
        active: false
    },
    password: {
        input: $('#j_loginPwd'),
        tip: $('#j_loginPwd_tip'),
        parent: $('#j_item_loginPwd'),
        active: false
    },
    loginAuto: {
        input: $('#j_isLoginAuto'),
        active: false
    },
    submit: {
        button: $('#j_btn_login')
    }
}
/* 用户名事件 start */
login.username.input.bind({focusin:function(){
    login.username.parent.removeClass('onError');
    login.username.parent.addClass('onFocus');
},focusout:function(){
    login.username.parent.removeClass('onFocus');
}});
/* 用户名事件 end */

/* 密码事件 start */
login.password.input.bind({focusin:function(){
    login.password.parent.removeClass('onError');
    login.password.parent.addClass('onFocus');
},focusout:function(){
    login.password.parent.removeClass('onFocus');
}});
/* 密码事件 end */

//提交时检查
login.submit.button.bind('click',function(){
    var account = login.username.input.val(),
        pwd = login.password.input.val(),
        isLoginAuto = login.loginAuto.input.is(':checked');
    if (account.length > 0) {
        login.username.active = true;
        //发送验证字符串
    }else{
        checkFormFn.onError(login.username.parent);
        login.username.tip.html(checkFormPrompt.logName.error); 
        return false;
    }
    if (pwd.length > 0) {
        login.password.active = true;
        //发送验证字符串
    }else{
        checkFormFn.onError(login.password.parent);
        login.password.tip.html(checkFormPrompt.pwd.isNull); 
        return false;
    }  

    if (isLoginAuto) {
        //保存Cookie
    }
    //通过所有验证，可以提交表单
  //alert('通过所有验证，可以提交表单');
	clickloginbtn();
});
/*=============================================== jQuery plugins 插件 ========================================================*/
(function($){
$.fn.extend({ 
    /*
    ===================================================================================
    name：输入框焦点与提示联动事件
    make: xiaohe (qq)1563482488
    date：2014.07.15
    desc：父对象
    ===================================================================================
    */ 
    focusTip: function(ops){
        var defaults = $.extend({
            target: '',            // 附加的样式的元素
            tip: '',               // 附加的文字描述的元素
            focustxt: '请输入',     // 附加的文字描述
            errorClass: 'onError', // 出错时附加的样式
            focusClass: 'onFocus'  // 获得焦点时附加的样式
        }, ops);

        return this.each(function() {
            $(this).bind({
                focusin:function(){
                    defaults.target.removeClass('onError');
                    defaults.target.addClass('onFocus');
                    defaults.tip.html(defaults.focustxt);
                },focusout:function(){
                    defaults.target.removeClass('onFocus');
                }
            });
        });
    }

});
})(jQuery);