/*
* @ Description: 网站的公共JS，所有页面必须引用
* @ Author: Spring
* @ Update: Spring(2016.06.24)
*/

/*=== common JS ============================================================================================*/
var config = config || {};
config.website_structure = {
    '0' : ['商品管理', '客户管理', '全网订单', '财务管理', '电商运营', '富生态'],
    '0_0' : ['商品维护', '库存管理', '商品类别', '商品规格', '商品品牌', '商品单位'],
    '0_1' : ['客户级别', '客户列表', '个人级别', '个人列表', '会员卡管理'],
    '0_2' : ['订单维护'],
    '0_3' : ['收款管理', '资金账户', '充值管理', '银行账号'],
    '0_4' : ['网站配置', '微信端配置', 'APP配置', '模板管理', '通知公告', '留言反馈'],
    '0_5' : ['微信营销', '第三方电商', '第三方支付', '域名设置', '短信设置', '应用市场'],
    '1' : ['设置', '我的账户', '帮助向导'],
    '1_0' : ['公司信息', '账户管理', '角色权限', '仓库设置', '流程设置', '参数设置', '自提点设置'],
    '1_1' : ['我的账户', '操作日志', '帮助向导'],
    '1_2' : ['商品管理', '客户管理', '全网订单', '财务管理', '电商运营', '富生态']
};
config.tools = {
    mask: false,
    alert: false,
    loading: false,
    page: false
};

config.tools.mask = $('#j_mask');
$(function () {
    // 设置IE,chrome兼容性
    $('<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"></meta>').insertAfter('head title');
    // 设置主菜单
    var asider = $('#asider');
    var docHeight = $(document).height();
    asider.css({'height':docHeight});
    // setting 顶部设置栏
    var topTools = $('.tools li');
    topTools.hover(function(){
        $(this).addClass('hover');
    },function(){
        $(this).removeClass('hover');
    });
    /*---S sideMenu 主菜单滑动---*/ 
    var j_sideMenu = $('.asider-menu'),
        sideMenuNavItems = j_sideMenu.find('li'),
        sideMenuNavItemHeight = sideMenuNavItems.eq(0).outerHeight(),
        startItem = j_sideMenu.find('li.on'),
        startTop = sideMenuNavItems.index(startItem) * sideMenuNavItemHeight,
        j_sideMenuNav_on = $('#menu_on');
    j_sideMenuNav_on.css({top:startTop,width:sideMenuNavItems.eq(0).outerWidth(),height:sideMenuNavItems.eq(0).outerHeight()});
    sideMenuNavItems.hover(function(){
      var that = $(this),
          index = that.index();
      that.addClass('on').siblings('li').removeClass('on');
      j_sideMenuNav_on.css({'top':index * sideMenuNavItemHeight},100);
    },function(){
        //$(this).removeClass('on');
    });
    j_sideMenu.bind('mouseleave',function(){
        if(startItem.length){
            startItem.addClass('on').siblings('li').removeClass('on');
            j_sideMenuNav_on.css({'top':startTop},100);
        }else{
            sideMenuNavItems.removeClass('on');
            j_sideMenuNav_on.css('top','-' + sideMenuNavItemHeight +'px');
        }
    });
    /*---E sideMenu 主菜单滑动---*/
    //设置主内容区域容器高度
    function setMainnerHeight(){
        var windowH = $(window).height(),
            mainner = $('#sectioner > .mainner'),
            headerH = $('#sectioner > .header').outerHeight(), 
            mainnerTopH = 
                parseInt(mainner.css('margin-top')) + 
                parseInt(mainner.css('margin-bottom')) + 
                parseInt(mainner.css('padding-top')) + 
                parseInt(mainner.css('padding-bottom')) + 
                parseInt(mainner.css('border-top-width')) + 
                parseInt(mainner.css('border-bottom-width'));

        mainner.css({'min-height':(windowH - headerH - mainnerTopH - 5) +'px'});
    }
    setMainnerHeight();
    $(window).on('resize',function(){
        setMainnerHeight();
    });

    /*---S placeholder 搜索类型切换---*/ 
    var j_triggers_title = $('#j_triggers_title'),
	    j_placeholders = $('#j_placeholders'),
	    key = $('#key');
    j_placeholders.find('a').bind('click',function(){
    	var placeholder = $(this).attr('data-placeholder'),
    		text = $(this).text();
    	j_triggers_title.text(text);
    	key.attr('placeholder',placeholder);
    });
    /*---E placeholder 搜索类型切换---*/
    // 全局日期设置
    if($.datepicker){
        $.datepicker.regional['zh-CN'] = {
            closeText: '关闭',
            prevText: '<上月',
            nextText: '下月>',
            currentText: '今天',
            monthNames: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
            monthNamesShort: ['一', '二', '三', '四', '五', '六', '七', '八', '九', '十', '十一', '十二'],
            dayNames: ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'],
            dayNamesShort: ['周日', '周一', '周二', '周三', '周四', '周五', '周六'],
            dayNamesMin: ['日', '一', '二', '三', '四', '五', '六'],
            weekHeader: '周',
            dateFormat: 'yy-mm-dd',
            firstDay: 1,
            isRTL: false,
            showMonthAfterYear: true,
            yearSuffix: '年'
        };
        $.datepicker.setDefaults($.datepicker.regional['zh-CN']);
    }
    // 打开筛选
    $('.btn-filter').on('click',function(){
        var filterthead = $('#' + $(this).attr('data-target')).find('.filterthead');
        filterthead.toggleClass('filterthead-hidden');
    });
});
/*----------functions-------------*/
//取得事件对象
function getEvent(e) {
    return e || window.event
}
//取得事件目标对象
function getTarget(e) {
    var e=e||window.event,
        target=e.target||e.srcElement;
    return target
}
//执行回调函数
function doCallback(fn){
    if(typeof(fn) == 'function') fn();
}
function getTarget(e) {
    var e=e||window.event,
        target=e.target||e.srcElement;
    return target
}
/*
name：阻止浏览器的默认行为
desc：参数为"事件对象"，例如：stopDefault(e)
*/
function stopDefault(e){
    //如果提供了事件对象，则这是一个非IE浏览器 
    if(e && e.preventDefault) {
    　　//阻止默认浏览器动作(W3C)
    　　e.preventDefault();
    } else {
    　　//IE中阻止函数器默认动作的方式 
    　　window.event.returnValue = false; 
    }
    return false;
};

/*
name：停止事件冒泡
desc：参数为"事件对象"，例如：stopBubble(e)
*/
function stopBubble(e){
    //如果提供了事件对象，则这是一个非IE浏览器
  if(e && e.stopPropagation) {
　　//因此它支持W3C的stopPropagation()方法
　　e.stopPropagation(); 
  } else {
　　//否则，我们需要使用IE的方式来取消事件冒泡 
　　window.event.cancelBubble = true;
  }
  return false; 
};

$.fn.levelCheckbox = function(ops) {
    var defaults = $.extend({
        parentNodes: '.hasChild',    // 所有父级节点
        lastChild: '.lastChild'     // 所有子集节点
    }, ops);

    return this.each(function() {
        var elem = $(this);
        var parentNodes = elem.find(defaults.parentNodes);
        var lastChild = elem.find(defaults.lastChild);

        // 如果节点为空，则返回
        if (!parentNodes || !lastChild) return;
        // 绑定父节点点击事件
        parentNodes.live('click',function(){
            var node     = $(this);
            var checked  = node.find('.checkbox').prop('checked');
            var level    = parseInt(node.attr('data-level'));
            var nextParent = node.closest('.root-level-' + level).find(defaults.parentNodes);

            nextParent.find('.checkbox').prop('checked',checked);

            // 节点选中
            if (checked) {
                for(var i=0; i<level; i++){
                    node.closest('.root-level-' + i).find(defaults.parentNodes).eq(0).find('.checkbox').prop('checked',checked);
                }
            }
            // 节点反选
            if (!checked) {
                for(var i=level; i>=0; i--){
                    if(!node.closest('.root-level-' + i).siblings('.root').find(':checked').length > 0){
                        node.closest('.root-level-' + (i - 1)).find(defaults.parentNodes).eq(0).find('.checkbox').prop('checked',checked);
                    }else break;
                }
                node.closest('.root-level-' + level).find('.lastChild .checkbox').prop('checked',checked);
            }
        });
        // 绑定子节点点击事件
        lastChild.live('click',function(){
            var node     = $(this);

            var checked  = node.find('.checkbox').prop('checked');
            var level    = parseInt(node.attr('data-level'));

            // 节点选中
            if (checked) {
                for(var i=level-1; i>=0; i--){
                    node.closest('.root-level-' + i).find(defaults.parentNodes).eq(0).find('.checkbox').prop('checked',checked);
                }
            }
            // 节点反选
            if (!checked) {
                if(!node.siblings('.lastChild').find(':checked').length > 0){
                    node.closest('.root-level-' + (level-1)).find(defaults.parentNodes).eq(0).find('.checkbox').prop('checked',checked);
                }else return;
                for(var i=level-1; i>=0; i--){
                    node.closest('.root-level-' + i).find(defaults.parentNodes).eq(0).find('.checkbox').prop('checked',checked);
                    if(node.closest('.root-level-' + i).siblings('.root').find(':checked').length) break;
                }
            }
        });
    });
}

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
        // if(!newTitle.length > 0 || !newDesc.length > 0 || !newSrc.length > 0){
        //     alert('推送标题或表述或链接都需要填写！');
        //     return false;
        // }
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
            that.close(newhtml,clearHTML);
        });
        btnSure.bind('click',function(){
            doCallback(sureFn);
            that.close(newhtml,clearHTML);
        });
        btnCancel.bind('click',function(){
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

/*
name：展开收缩 切换对象
desc：con(目标id),style(展开方式：‘slide’,'toggle')
*/
function toggleList(con,style){
  var con = $(con),
      sty = style;

  sty == 'slide' ? con.slideToggle('fast') : con.toggle();
}
/*
name：切换Class
desc：con(目标id，this),className(类名：‘slide’,'on')
*/
function toggleClass(con,className){
  var con = $(con),
      cla = className;

  con.toggleClass(cla);
}

/*===== droplist 下拉列表 ===============================================================================================*/
//droplist
function droplist(elem,that){
    var elem = $(elem);
    var that = $(that);
    var width = parseInt(elem.outerWidth()) - 2;
    var height = parseInt(elem.outerHeight()) - 1;
    var thatH = that.outerHeight();
    var offset = elem.offset();
    var left = offset.left;
    var windowH = $(window).height();
    var sTop = $(document).scrollTop();
    var top = offset.top + height;

    $('.ui-selecter-input').removeClass('focus');
    elem.addClass('focus');
    
    if(offset.top - sTop + thatH > windowH){
        top -= (height + thatH);
    };

    that.css({'left':left,'top':top,'width':width}).show();
    that.find('.ui-droplist-closeBtn').unbind().bind('click',function(){
        elem.removeClass('focus');
        that.hide();
    });
}
//droplist close
function droplistClose(elem){
    var elem = $(elem);
    $('.ui-selecter-input').removeClass('focus');
    elem.hide();
}

/*===== ui-loading 加载进度、流程进度 ===============================================================================================*/
// setProgressEex 流程条进度设置
function setProgressEex(){
    $('.ui-progress-ex').each(function(){
        var elem = $(this), 
            statusBar = elem.find('.status-bar-inner'), 
            steps = elem.find('.flow-group .on').length - 1;
        if (steps) {
            statusBar.animate({'width': (steps*279 + 29) +'px'}, 500);
        }
    })
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

/*//////////////////////////////////////S JQuery插件////////////////////////////////*/
(function($) { 
$.fn.extend({
    /*
    ===================================================================================
    name：输入框删除文本(removeVal)
    make: xiaohe (qq)1563482488
    date：2016.05.25
    desc：注意html结构
    ===================================================================================
    */ 
    removeVal: function(ops) {
        var defaults = $.extend({
            callback: function(){}
        }, ops);

        // 循环遍历
        return this.each(function(){
            var self = $(this),
                wrap = $('<div class="ui-input"><div class="ui-input-wrap"></div></div>'),
                btn  = $('<span class="ui-input-btnRemove"></span>');

            // 初始化
            self
            .wrap(wrap)
            .after(btn);

            // 监听输入
            self.on('keyup', function(){
                var val = $.trim(self.val());

                if(val)
                    btn.show();
                else
                    btn.hide();
            });

            // 监听删除
            btn.on('click', function(){
                self.val('');
                btn.hide();

                // 执行回调函数
                doCallback(defaults.callback);
            });
        });
            
    },
    /*
    ===================================================================================
    name：展开收缩(uiAccordion)
    make: xiaohe (qq)1563482488
    date：2016.05.24
    desc：注意html结构
    ===================================================================================
    */ 
    uiAccordion: function(ops) {
        var defaults = $.extend({
            mt: '.ui-dl-accordion-sw',
            mc: '.ui-dl-accordion-mc',
            display: 'slideToggle'
        }, ops);

        // 循环遍历
        return this.each(function(){
            var elem = $(this), 
                sw = elem.find(defaults.mt), 
                mc = elem.find(defaults.mc);

            sw.on('click', function(){
                $(this).toggleClass('on');
                if(defaults.display == 'slideToggle')
                    mc.slideToggle(320);
                else
                    mc.toggle();
            });
        });
            
    },
    /*
    ===================================================================================
    name：左右选择功能列表(joinSelect)
    make: xiaohe (qq)1563482488
    date：2016.04.27
    desc：注意html结构
    ===================================================================================
    */ 
    joinSelect: function(ops) {
        var defaults = $.extend({
            defaults: ""   // 
        }, ops);

        // 循环遍历
        return this.each(function(){
            var self = $(this), 
                option = self.find('.joinSelect-option .joinSelect-selectBox-ul'),
                select = self.find('.joinSelect-select .joinSelect-selectBox-ul'),
                btnAdd = self.find('.btn-add'),
                btnRemove = self.find('.btn-remove'),
                optionAllBtn = self.find('.joinSelect-option .joinSelect-selectAll-btn'),
                selectAllBtn = self.find('.joinSelect-select .joinSelect-selectAll-btn');

            // 事件绑定
            option.add(select).on('click',function(e){
                var self = $(this), 
                    target = $(e.target),
                    allBtn = self.parent().next().find('.joinSelect-selectAll-btn');

                if(target.is('li') && !target.hasClass('moved')) target.toggleClass('on');
                
                if(self.children('li').not('.moved').length == self.children('.on').length)
                    allBtn.addClass('checked');
                else
                    allBtn.removeClass('checked');

            });
            // 双击添加
            option.on('dblclick', function(e){
                var target = $(e.target);
                if(!target.is('li') || target.hasClass('moved')) return false;
                var clones = target.removeClass('on').clone();
                target.addClass('moved');
                clones.appendTo(select);
                resetAllSelect(optionAllBtn.add(selectAllBtn));
            });
            // 双击移除
            select.on('dblclick', function(e){
                var target = $(e.target);
                if(!target.is('li')) return false;
                option.children('li[data-id='+ target.attr('data-id') +']').removeClass('moved');
                target.remove();
            });
            // 待选对象的全选
            optionAllBtn.on('click',function(e){
                selectAll($(this),option);
            });
            // 已选对象的全选
            selectAllBtn.on('click',function(e){
                selectAll($(this),select);
            });
            // 添加
            btnAdd.on('click',function(e){
                var addItems = option.children('.on'), 
                    clones = addItems.removeClass('on').clone();
                checkMove(addItems);
                addItems.addClass('moved');
                clones.appendTo(select);
                resetAllSelect(optionAllBtn.add(selectAllBtn));
            });
            // 移除
            btnRemove.on('click',function(e){
                var removeItems = select.children('.on');
                checkMove(removeItems);
                removeItems.each(function(){
                    var dataid = $(this).attr('data-id');
                    option.children('li[data-id='+dataid+']').removeClass('moved');
                    $(this).remove();
                });
                resetAllSelect(optionAllBtn.add(selectAllBtn));
            });
        });

        // select all 切换全选
        function selectAll(elem,items){
            if(!elem.hasClass('checked'))
                items.children('li').not('.moved').addClass('on');
            else
                items.children('li').not('.moved').removeClass('on');

            toggleAllSelect(elem);
        }
        // toggle all select 切换全选
        function toggleAllSelect(elem){
            var elem = elem;
            elem.toggleClass('checked');
        }
        // reset all select 重置全选
        function resetAllSelect(elem){
            var elem = elem;
            elem.removeClass('checked');
        }
        // checkMove 检查移动
        function checkMove(elem){
            if(!elem.length){
                alert('没选中选项或选项为空！');
                return false;
            }
        }
    },
    /*
    ===================================================================================
    name：div版select下拉选择(dropSelect)
    make: xiaohe (qq)1563482488
    date：2016.04.20
    desc：注意html结构
    ===================================================================================
    */ 
    dropSelect: function(ops) {
        var defaults = $.extend({
            drop: $('.ui-dropSelect-drop'),   // 下拉的层
            setFullWidth: true,   // 是否设置下拉层与选择框等宽
            selectLabel: 'tree-label',
            dropOffsetTop: 0,
            dropOffsetLeft: 0
        }, ops);

        var activeElem = null;

        // 点击空白处和按钮栏收起
        $(document).add(defaults.drop.find('.action')).on('click',function(){
            defaults.drop.stop().slideUp('fast',function(){
                activeElem = null;
            });
        });

        // 循环遍历
        return this.each(function(){
            var self = $(this), 
                drop = defaults.drop,
                width = self.outerWidth(),
                height = self.outerHeight(),
                wrap = $('<div class="ui-dropSelect"><div class="ui-dropSelect-wrap"></div></div>'), 
                btnSwitch = $('<i class="ui-dropSelect-arr cssarr-down"></i>');

            //初始化
            // 事件绑定
            wrap.add(drop).on('click',function(e){
                // 取消事件冒泡
                if(document.all) window.event.cancelBubble = true;
                else e.stopPropagation();

                var target = $(e.target);
                if(target.hasClass(defaults.selectLabel)){
                    activeElem.val(target.text());
                    defaults.drop.hide();
                    activeElem = null;
                }
            });
            self
            .wrap(wrap)
            .after(btnSwitch)
            .on('click',function(){
                width = self.outerWidth();
                height = self.outerHeight();
                setPosition();
                activeElem = self;
                drop.stop().slideDown('fast');
            });
            btnSwitch.on('click',function(){
                setPosition();
                drop.stop().slideToggle('fast');
                activeElem = drop.is(':visible') ? self : null;
            });

            function setPosition(){
                var currElem = $('.ui-dropSelect-drop:visible');
                width = self.outerWidth();
                if(activeElem != self) currElem.hide();
                var left = self.offset().left,
                    top  = self.offset().top;
                drop.css({
                    'left': left + defaults.dropOffsetLeft + 'px',
                    'top': top + height + defaults.dropOffsetTop + 'px'
                });
                if(defaults.setFullWidth)
                    drop.css('width', width + 'px');
            }
        });
    },
    /*
    ===================================================================================
    name：简单信息显示层(hoverLayer)
    make: xiaohe (qq)1563482488
    date：2016.05.24
    desc：注意html结构
    ===================================================================================
    */ 
    hoverLayer: function(ops) {
        var defaults = $.extend({
            drop: $('.ui-hoverLayer'),   // 下拉的层
            align: 'left',   // 层的对齐方式    
            dropOffsetTop: 0,   // 设置左偏移位置
            dropOffsetLeft: 0   // 设置右偏移位置
        }, ops);

        // 循环遍历
        return this.each(function(){
            var self = $(this), 
                drop = self.next(defaults.drop),
                height = self.outerHeight();

            //初始化
            // 鼠标滑过
            self.hover(function(){
                self.addClass('on');
                setPosition();
                drop.stop().slideDown('fast');
            },function(){
                self.removeClass('on');
                layerClose();
            });
            // 鼠标滑过
            drop.hover(function(){
                self.addClass('on');
                drop.stop().slideDown(0);
            },function(){
                self.removeClass('on');
                layerClose();
            });

            function setPosition(){
                var left = self.offset().left,
                    top = self.offset().top,
                    windowW = $(window).width(),
                    windowH = $(window).height(),
                    dropW = defaults.drop.outerWidth(),
                    dropH = defaults.drop.outerHeight();

                left = (left + dropW) > windowW ? (windowW - dropW) : left + defaults.dropOffsetLeft;
                top = (top + dropH) > windowH ? (top - dropH - defaults.dropOffsetTop) : (top + height + defaults.dropOffsetTop);

                drop.css({
                    'left': left + 'px',
                    'top': top + 'px'
                });
            }
        });

        function layerClose(){
            defaults.drop.stop().slideUp('fast');
        }
    },
    /*
    ===================================================================================
    name：下拉层(dropLayer)
    make: xiaohe (qq)1563482488
    date：2016.05.18
    desc：注意html结构
    ===================================================================================
    */ 
    dropLayer: function(ops) {
        var defaults = $.extend({
            drop: $('.ui-dropLayer'),   // 下拉的层
            inEvent: 'click',   // 进入触发事件    
            outEvent: 'click',   // 消失触发事件    
            align: 'left',   // 层的对齐方式    
            dropOffsetTop: 0,   // 设置左偏移位置
            dropOffsetLeft: 0   // 设置右偏移位置
        }, ops);

        var activeElem = null;

        // 点击空白处和按钮栏收起
        $(document).add(defaults.drop.find('.action')).on(defaults.outEvent,layerClose);

        // 循环遍历
        return this.each(function(){
            var self = $(this), 
                drop = defaults.drop,
                height = self.outerHeight();

            //初始化
            // 点击本身取消事件冒泡
            self.add(drop).on(defaults.inEvent,function(e){
                stopBubble(e);
            });

            self.on(defaults.inEvent,function(){
                setPosition();
                activeElem = self;
                drop.stop().slideDown('fast');
            });

            function setPosition(){
                var currElem = $('.ui-dropLayer:visible'),
                    left = self.offset().left,
                    top = self.offset().top,
                    windowW = $(window).width(),
                    windowH = $(window).height(),
                    dropW = defaults.drop.outerWidth(),
                    dropH = defaults.drop.outerHeight();

                if(activeElem != self) currElem.hide();

                left = (left + dropW) > windowW ? (windowW - dropW) : left + defaults.dropOffsetLeft;
                top = (top + dropH) > windowH ? (top - dropH - defaults.dropOffsetTop) : (top + height + defaults.dropOffsetTop);

                drop.css({
                    'left': left + 'px',
                    'top': top + 'px'
                });
            }
        });

        function layerClose(){
            defaults.drop.stop().slideUp('fast',function(){
                activeElem = null;
            });
        }
    },
    /*
    ===================================================================================
    name：淡显幻灯片(banner)
    make: xiaohe (qq)1563482488
    date：2013.03.15
    desc：注意html结构
    ===================================================================================
    */ 
    banner: function(ops) {
        var defaults = $.extend({
            speed: 800,    // 当前的索引
            time: 5000     // 切换间隔
        }, ops);

        return this.each(function() {
            var _this = $(this),
                _imgs = _this.find('.currPic li'),
                _img0 = _this.find('.currPic li:first'),
                _ctrl = _this.find('.currTitle li'),
                _indx = 0;
                _leng = _imgs.length;
            //初始化
            _img0.show().siblings('li').hide();
            //自动开始
            var timer = setInterval(IntervalShow, defaults.time);
            //滑过控制按钮
            _ctrl.mouseover(function() {
                _indx = _ctrl.index(this);
                myShow(_indx);
            });
            //滑入停止动画，滑出开始动画
            _this.hover(function() {
                if (timer) {
                    clearInterval(timer);
                    timer = null;
                }
            },function() {
                timer = setInterval(IntervalShow, defaults.time);
            });
            //切换函数
            function myShow(i) {
                _ctrl.eq(i).addClass("on").siblings("li").removeClass("on");
                _imgs.eq(i).stop(true, true).fadeIn(defaults.speed).siblings("li").fadeOut(defaults.speed);
            }
            //定时切换
            function IntervalShow() {
                myShow(_indx);
                _indx++;
                if (_indx == _leng) { _indx = 0; }
            }
        });
    },
    /*
    ===================================================================================
    name：选项卡切换(不带延迟加载图片)
    make: xiaohe (qq)1563482488
    date：2013.11.01
    desc：html结构
    ===================================================================================
    */
    taber: function(ops) {
        var defaults = {           
            tabNavs: '.tabNavs', //选项卡头部
            tabNav: '.tabNav', //选项卡头部列表项class
            target: 'data-id', //绑定的目标id
            tabCon: '.tabCon',//选项卡主体列表项class
            tabCons: '.tabCons',
            tabConsn: '.tabCons-n',
            onEvent: 'click', //出发事件，mouseover/click

        };
        var options = $.extend(defaults,ops);

        return this.each(function(){
            var _this = $(this),
                tabconsy=_this.find(".tabCons"),
                j_tabNav_1=_this.find(".j_tabNav_1"),
                j_tabNav_2=_this.find(".j_tabNav_2"),
                j_tabNav_3=_this.find(".j_tabNav_3"),
                event = options.onEvent == 'mouseover'?'mouseover':'click';
            _this.find(options.tabNav).bind(event,function(){
                var that = $('#'+ $(this).attr(options.target));
                $(this).addClass('on').siblings(options.tabNav).removeClass('on');   // 切换tab栏选中状态
                that.addClass('on').siblings(options.tabCon).removeClass('on');   // 切换内容
             });
            j_tabNav_1.click(function(){
                $(options.tabNav).trigger("click")
            });
            j_tabNav_2.click(function(){
                j_tabNav_3.trigger("click")
            });
            _this.mouseover(
                function(){
                    $(tabconsy).show();
                }
            );
            $(options.tabConsn).mouseleave(
                function(){
                    $(tabconsy).hide();
                }
            );
        });
    },hoverdelayTip: function(ops) {
        var defaults = $.extend({
            data: 'data-selector', // 绑定的数据名称
            delay: 1500           // 延迟
        }, ops);

        return this.each(function() {
            var that    = $(this),
                tipCon  = $(that.attr(defaults.data)),
                tipWid  = tipCon.outerWidth();

            that.live({'mouseenter':function(){
                var elem = $(this);
                var wid  = elem.outerWidth();
                var hei  = elem.outerHeight();
                var offs = elem.offset();
                var left = offs.left;
                var top  = offs.top;

                tipCon.css({'left':left - (tipWid - wid)/2,'top':top + hei - 1}).show();
              },'mouseleave':function(){
                tipCon.hide();
            }});

            tipCon.live({'mouseenter':function(){
                $(this).show();
              },'mouseleave':function(){
                $(this).hide();
            }});
        });
    }
/*----------------------------------------------------------------------------------*/
});
})(jQuery);
/*//////////////////////////////////////E JQuery微插件////////////////////////////////*/