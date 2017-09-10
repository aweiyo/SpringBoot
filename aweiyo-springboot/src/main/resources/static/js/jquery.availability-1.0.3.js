	var _regExpArray = {
		exp_floatNumber: "^([+-]?)\\d*\\.\\d+$", //浮点数
		exp_pFloatNumber: "^[1-9]\\d*.\\d*|0.\\d*[1-9]\\d*$", //正浮点数
		exp_nFloatNumber: "^-([1-9]\\d*.\\d*|0.\\d*[1-9]\\d*)$", //负浮点数
		exp_pzFloatNumber: "^[1-9]\\d*.\\d*|0.\\d*[1-9]\\d*|0?.0+|0$", //非负浮点数（正浮点数 + 0）
		exp_nzloatNumber: "^(-([1-9]\\d*.\\d*|0.\\d*[1-9]\\d*))|0?.0+|0$", //非正浮点数（负浮点数 + 0）
		exp_intNumber: "^-?[1-9]\\d*$", //整数
		exp_pIntNumber: "^[1-9]\\d*$", //正整数
		exp_nIntNumber: "^-[1-9]\\d*$", //负整数
		exp_pzNumber: "^[1-9]\\d*|0$", //正数（正整数 + 0）
		exp_nzNumber: "^-[1-9]\\d*|0$", //负数（负整数 + 0）
		exp_asciiChar: "^[\\x00-\\xFF]+$", //仅ACSII字符
		exp_chinese: "^[\\u4e00-\\u9fa5]+$", //仅中文
		exp_color: "^[a-fA-F0-9]{6}$", //颜色
		exp_date: "^\\d{4}(\\-|\\/|\.)\\d{1,2}\\1\\d{1,2}$", //日期
		exp_email: "^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$", //邮件
		exp_idCard: "^[1-9]([0-9]{14}|[0-9]{17})$", //身份证
		exp_ipAddr: "^(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)\\.(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)\\.(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)\\.(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)$", //ip地址
		exp_letter: "^[A-Za-z]+$", //字母
		exp_lowerLetter: "^[a-z]+$", //小写字母
		exp_upperLetter: "^[A-Z]+$", //大写字母
		exp_mobile: "^0?(13|15|17|18|14)[0-9]{9}$", //手机
		exp_numberLetter: /^[0-9a-zA-Z]*$/g, //数字与字母的组合
		exp_notEmpty: "^\\S+$", //非空
		exp_password: "^.*[A-Za-z0-9\\w_-]+.*$", //密码
		exp_number: "^[0-9]+$", //全数字
		exp_picture: "(.*)\\.(jpg|bmp|gif|ico|pcx|jpeg|tif|png|raw|tga)$", //图片
		exp_qq: "^[1-9]*[1-9][0-9]*$", //QQ号码
		exp_rar: "(.*)\\.(rar|zip|7zip|tgz)$", //压缩文件
		exp_telephone: "^[0-9\-()（）]{7,18}$", //电话号码的函数(包括验证国内区号,国际区号,分机号)
		exp_url: "^http[s]?:\\/\\/([\\w-]+\\.)+[\\w-]+([\\w-./?%&=]*)?$", //url
		exp_postCode: "^\\d{6}$", //邮编
		exp_telePhoneNew:"\d{2,5}-\d{7,8}"//固定号码
	};

	var _regExpFunction = {
		// 判断str是否为空，通过allowBlank来进行替换返回为空时的替代值
		isEmpty: function (str, allowBlank) {
			return str === null || str === undefined || (!allowBlank ? str === '' : false);
		},
		// 通过正则表达式判断str是否为空
		isEmpty: function (str) {
			return !new RegExp(_regExpArray.exp_notEmpty).test(str);
		},
		// 通过正则表达式判断str是否不为空
		isNotEmpty: function (str) {
			return new RegExp(_regExpArray.exp_notEmpty).test(str);
		},
		// 通过正则表达式判断str的长度是否在_min和_max的之间，中文字符占一位字符
		betweenLength: function (str, _min, _max) {
			if ((new RegExp(_regExpArray.exp_notEmpty).test(str)) && (new RegExp(_regExpArray.exp_pzNumber).test(_min)) && (new RegExp(_regExpArray.exp_pzNumber).test(_max))) {
				return (str.length >= _min && str.length <= _max);
			}
			return false;
		},
		// 判断str的长度是否最大范围之内
		maxLength: function (str, _max) {
			if ((new RegExp(_regExpArray.exp_notEmpty).test(str)) && (new RegExp(_regExpArray.exp_pIntNumber).test(_max))) {
				return (str.length <= _max);
			}
			return false;
		},
		// 通过正则表达式判断str是否全部为数字
		isNumber: function (str) {
			return new RegExp(_regExpArray.exp_number).test(str);
		},
		// 通过正则表达式判断str是否全部为正数和0
		ispzNumber: function (str) {
			return new RegExp(_regExpArray.exp_pzNumber).test(str);	
		},
		// 通过正则表达式判断str是否全部为负数和0
		isnzNumber: function (str) {
			return new RegExp(_regExpArray.exp_nzNumber).test(str);
		},
		// 通过正则表达式判断str是否为邮箱格式****@**.**
		isEmail: function (str) {
			return new RegExp(_regExpArray.exp_email).test(str);
		},
		// 通过正则表达式判断str是否为电话号码格式 区号-********或(区号)********或（区号）********
		isTelephone: function (str) {
			return new RegExp(_regExpArray.exp_telephone).test(str);
		},
		isTelephoneNew: function (str) {
			return new RegExp(_regExpArray.exp_telePhoneNew).test(str);
		},
		// 通过正则表达式判断str是否为移动电话格式，支持12 13 14 15 16 17 18 19开头的手机号码
		isMobile: function (str) {
			return new RegExp(_regExpArray.exp_mobile).test(str);
		},
		// 通过正则表达式判断str是否为浮点数
		isFloatNumber: function (str) {
			return new RegExp(_regExpArray.exp_floatNumber).test(str);
		},
		// 通过正则表达式判断str是否为正浮点数
		ispFloatNumber: function (str) {
			return new RegExp(_regExpArray.exp_pFloatNumber).test(str);
		},
		// 通过正则表达式判断str是否为正浮点数和0
		ispzFloatNumber: function (str) {
			return new RegExp(_regExpArray.exp_pzFloatNumber).test(str);
		},
		// 通过正则表达式判断str是否为负浮点数
		isnFloatNumber: function (str) {
			return new RegExp(_regExpArray.exp_nFloatNumber).test(str);
		},
		// 通过正则表达式判断str是否为负浮点数和0
		isnzFloatNumber: function (str) {
			return new RegExp(_regExpArray.exp_nzFloatNumber).test(str);
		},
		// 通过正则表达式判断str是否为整数
		isIntNumber: function (str) {
			return new RegExp(_regExpArray.exp_intNumber).test(str);
		},
		// 通过正则表达式判断str是否为正整数
		ispIntNumber: function (str) {
			return new RegExp(_regExpArray.exp_pIntNumber).test(str);
		},
		// 通过正则表达式判断str是否为负整数
		isnIntNumber: function (str) {
			return new RegExp(_regExpArray.exp_nIntNumber).test(str);
		},
		// 通过正则表达式判断str是否为Ascii
		isAsciiChar: function (str) {
			return new RegExp(_regExpArray.exp_asciiChar).test(str);
		},
		// 通过正则表达式判断str是否全为中文
		isChinese: function (str) {
			return new RegExp(_regExpArray.exp_chinese).test(str);
		},
		// 通过正则表达式判断str是否为颜色的格式
		isColor: function (str) {
			return new RegExp(_regExpArray.exp_color).test(str);
		},
		// 通过正则表达式判断str是否为日期date的格式
		isDate: function (str) {
			return new RegExp(_regExpArray.exp_date).test(str);
		},
		// 通过正则表达式判断str是否为身份证号格式
		isIdCard: function (str) {
			return new RegExp(_regExpArray.exp_idCard).test(str);
		},
		// 通过正则表达式判断str是否为ip地址格式
		isIpAddr: function (str) {
			return new RegExp(_regExpArray.exp_ipAddr).test(str);
		},
		// 通过正则表达式判断str是否全为字母
		isLetter: function (str) {
			return new RegExp(_regExpArray.exp_letter).test(str);
		},
		// 通过正则表达式判断str是否全为小写字母
		isLowerLetter: function (str) {
			return new RegExp(_regExpArray.exp_lowerLetter).test(str);
		},
		// 通过正则表达式判断str是否全为大写字母
		isUpperLetter: function (str) {
			return new RegExp(_regExpArray.exp_upperLetter).test(str);
		},
		// 通过正则表达式判断str是否为图片名称的格式
		isPicture: function (str) {
			return new RegExp(_regExpArray.exp_picture).test(str);
		},
		// 通过正则表达式判断str是否为QQ号码的格式
		isQQ: function (str) {
			return new RegExp(_regExpArray.exp_qq).test(str);
		},
		// 通过正则表达式判断str是否为压缩文件名的格式
		isRar: function (str) {
			return new RegExp(_regExpArray.exp_rar).test(str);
		},
		// 通过正则表达式判断str是否为网站url地址格式
		isUrl: function (str) {
			return new RegExp(_regExpArray.exp_url).test(str);
		},
		// 通过正则表达式判断str是否为邮编号码格式
		isPostCode: function (str) {
			return new RegExp(_regExpArray.exp_postCode).test(str);
		},
		// 通过正则表达式判断str是否为数字、字母或数字与字母组合格式
		isNumberAndLetter: function (str) {
			return new RegExp(_regExpArray.exp_numberLetter).test(str);
		},
		// 传递正则表达式规则用该规则判断str
		isTest: function (regExp, str) {
			if (new RegExp(_regExpArray.exp_notEmpty).test(str)) {
				return new RegExp(regExp).test(str);
			}
			return false;
		}
	};