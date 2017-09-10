var config = config || {};
config.tools.mask = $('#j_mask');
/*===== alert 弹窗类 ===============================================================================================*/
//弹出窗口
function uiAlert(id,callback){
    if(!config.tools.mask.length){
        config.tools.mask = $('<!--S ui-mask--><div class="ui-mask" id="j_mask"></div><!--E ui-mask-->').appendTo('body');
    }
    var elem = $(id);
    var func = callback;
    config.tools.mask.show();
    elem.css({'margin-top':-(elem.outerHeight()/2),'margin-left':-(elem.outerWidth()/2 - 63)}).show();
    doCallback(callback);
}
//关闭弹出窗口
function uiAlertClose(id,callback){
    var elem = $(id);
    var func = callback;
    doCallback(callback);
    config.tools.mask.hide();
    elem.hide();
}
//窗口切换
function uiAlertSwitch(elem1,elem2,callback){
    var elem1 = $(elem1);
    var elem2 = $(elem2);
    elem1.hide();
    elem2.css({'margin-top':-(elem2.outerHeight()/2),'margin-left':-(elem2.outerWidth()/2 - 63)}).show();
    doCallback(callback);
}
//消息提示窗
function uiAlertMsg(type,text,timeout,callback){
    var type = 'succ' || type, 
        text = text, 
        timeout = timeout, 
        callback = callback,
        html = $('<div class="ui-alert-msg" id="J_UiAlertMsg'+ new Date().getTime() +'"><div class="text"><i class="icon icon-check"></i>'+ text +'</div></div>');
    html.appendTo('body').addClass('show');
    setTimeout(function(){
        html.removeClass('show');
        setTimeout(function(){
            html.remove();
        },200);
    },timeout);
}

/*
name：显示对象，打开对象
desc：参数为id号，数量无限，例如：show('id1','id2'...)
*/
function show(){
    var arg = arguments;
    for(var i = 0, j = arg.length; i<j; i++){
        var one = typeof(arg[i]) === 'string'?document.getElementById(arg[i]):arg[i];
        one.style.display = 'block';
    }
}
/*
name：隐藏对象，关闭对象
desc：参数为id号，数量无限，例如：hide('id1','id2'...)
*/
function hide(){
    var arg = arguments;
    for(var i = 0, j = arg.length; i<j; i++){
        var one = typeof(arg[i]) === 'string'?document.getElementById(arg[i]):arg[i];
        one.style.display = 'none';
    }
}
// 推送消息
function UiMSGPropelling(elem){
    this.outer    = $(elem);
    this.closeBtn = this.outer.find('.ui-MSGPropelling-closeBtn');
    this.height   = this.outer.outerHeight();
    this.defaultTitle = '运营中心';
    this.timer    = null;
    this.timeout  = 5000;
}
UiMSGPropelling.prototype = {
    close: function(){
        this.outer.css('bottom', '-'+ this.height +'px');
    },
    init: function(){
        var that = this;
        this.closeBtn.bind('click',function(){
            that.close();
        });
        that.outer.hover(function(){
            clearTimeout(that.timer);
        },function(){
            that.timer = setTimeout(function(){
                that.close();
            },that.timeout);
        });
    },
    show: function(title,newTitle,newDesc,newSrc){
        var that = this;
        var title    = title.length > 0 ? title : this.defaultTitle;
        var newTitle = newTitle;
        var newDesc  = newDesc;
        var newSrc   = newSrc;
        this.outer.find('.title-text').text(title);
        this.outer.find('.newTitle-text').text(newTitle);
        this.outer.find('.newDesc-text').text(newDesc);
        this.outer.find('.newSrc-text').attr('href',newSrc);
        this.outer.css('bottom',0);
        this.timer = setTimeout(function(){
            that.close();
        },this.timeout);
    }
}

// ui-alert-mini 弹窗提示(确认提示框)
function UiAlertMini(){
    this.defTitle = '普通提示';
    this.autoClose= false;
    this.hasMask  = true;
    this.timeout  = 5000;
}
UiAlertMini.prototype = {
    close: function(elem,callback){
        elem.hide(0,function(){
            doCallback(callback);
        });
    },
    create: function(type,title,desc,sureFn,cancelFn,timeout){
        var that     = this;
        var autoClose= that.autoClose;
        var timer    = null;
        var timeout  = parseInt(timeout);
        var alertid  = 'j_alert'+ new Date().getTime();
        var title    = title == '' ? that.defTitle : title;
        var desc     = desc;
        var sureFn   = sureFn;
        var cancelFn = cancelFn;
        var newhtml  = $('<div class="ui-alert ui-alert-mini" id="'+ alertid +'"></div>');
        config.tools.mask.show();
        newhtml.append(modle(type));
        newhtml.appendTo('body').show();
        function modle(type){
            var type = type;
            var html = '';
                html += '<div class="hd">';
                html += '<span class="alert-title">'+ title +'</span>';
                html += '<span class="alert-close">';
                html += '<a class="alert-close-botton" href="javascript:void(0);" title="close"></a>';
                html += '</span>';
                html += '</div>';
                html += '<div class="bd">';
                html += '<p class="msg msg-succ">'+ desc +'</p>';
                html += '</div>';
                html += '<div class="ft">';
                html += '<div class="submit ui-form-submit alert-comfrim">';
                html += '<a class="btnf-ui-m alert-comfrim-btnSure" href="javascript:void(0);" title="确定">确定</a>';
            if(type == 'confrim')
                html += '<a class="btng-ui-m alert-comfrim-btnCancle" href="javascript:void(0);" title="取消">取消</a>'
                html += '</div>';
                html += '</div>';
            return html;
        }
        //是否自动关闭
        if(timeout > 0) autoClose = true;
        if(autoClose){
            timer = setTimeout(function(){
                that.close(newhtml,clearHTML);
            },timeout);
            newhtml.hover(function(){
                clearTimeout(timer);
            },function(){
                timer = setTimeout(function(){
                    that.close(newhtml,clearHTML);
                },timeout);
            });
        }
        //添加事件
        var btnClose  = newhtml.find('.alert-close-botton');
        var btnSure   = newhtml.find('.alert-comfrim-btnSure');
        var btnCancel = newhtml.find('.alert-comfrim-btnCancle');
        btnClose.bind('click',function(){
        	config.tools.mask.hide();
            that.close(newhtml,clearHTML);
        });
        btnSure.bind('click',function(){
        	config.tools.mask.hide();
            doCallback(sureFn);
            that.close(newhtml,clearHTML);
        });
        btnCancel.bind('click',function(){
        	config.tools.mask.hide();
            doCallback(cancelFn);
            that.close(newhtml,clearHTML);
        });
        //清除内存，回收垃圾
        function clearHTML(){
            clearTimeout(timer);
            btnClose.unbind('click');
            btnSure.unbind('click');
            btnCancel.unbind('click');
            newhtml.remove();
        }
    },
    init: function(){
    },
    confrim: function(title,desc,sureFn,cancelFn,timeout){
        this.create('confrim',title,desc,sureFn,cancelFn,timeout);
    },
    alert: function(title,desc,sureFn,timeout){
        this.create('normal',title,desc,sureFn,'',timeout);
    }
}

// 显示加载中
function UiLoading(){
    this.outer    = null;
    this.inner    = null;
    this.defdesc  = '正在加载中，请稍后...';
}
UiLoading.prototype = {
    close: function(){
        this.outer.hide();
    },
    init: function(){
        var that    = this;
        var oldelem = $('#j_uiLoading');
        var newhtml = $('<div class="ui-loading" id="j_uiLoading"><div class="ui-loading-mask"></div><div class="inner"><div class="msg">加载中...</div></div></div>');
        if(oldelem.length){
            this.outer = oldelem;
        }else{
            newhtml.appendTo('body');
            this.outer = newhtml;
        }
        this.inner = this.outer.find('.msg');
    },
    load: function(desc,beforeFn,succFn){
        var that     = this;
        var desc     = desc.length > 0 ? desc : that.defdesc;
        var beforeFn = beforeFn;
        var succFn   = succFn;
        doCallback(beforeFn);
        that.inner.text(desc);
        that.outer.show();
        doCallback(succFn);
    }
}

function uiLoading(){
    var j_loading = $('#j_loading');
    var j_mask = $('#j_mask');
    var width = j_loading.outerWidth();
    j_loading.css('margin-left','-' + (width/2 - 63));
    if(j_mask && j_mask.is(':visible')){
        j_mask.attr('data-open','yes');
        j_loading.show();
    }else{
        j_mask.show();
        j_loading.show();
    }
}
function uiLoadingClose(){
    var j_loading = $('#j_loading');
    var j_mask = $('#j_mask');
    if(j_mask.attr('data-open') == 'yes'){
        j_mask.removeAttr('data-open');
    }else{
        j_mask.hide();
    }
    j_loading.hide();
}

var _uiMini = new UiAlertMini();
var _UiLoading = new UiLoading();
_UiLoading.init();