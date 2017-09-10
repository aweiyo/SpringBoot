<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://localhost:8080/static/js/jquery-1.7.2.min.js"></script>
<script src="../static/js/public.js"></script>
<script src="../static/js/jquery.availability-1.0.3.js"></script>
<script>
	
	//判断v变量是否为空，allowBlank是否允许输入全空格
	function _isEmpty(v, allowBlank) {
		return v === null || v === undefined || v === '' || (!allowBlank ? (new RegExp("^[ ]+$").test(v)) : true);
	}
	
	function _onBlurMaxLength(obj, len) {
		if(!_isEmpty(obj, false) && !isNaN(len) && (Number(len) > 0)) {
			var val = $(obj).val();
			if(!_isEmpty(val, false)) {
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
			alertTitle = (_isEmpty(alertTitle, false) ? "消息提醒" : alertTitle);
			$(checkObj).each(function() {
				var id = $(this)[0].id;
				var val = $("#"+id).val();
				if(_isEmpty(val, false)) {
					var msg = $(this)[0].msg;
					msg = (_isEmpty(msg, false) ? "表单校验不通过。" : msg);
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



<title>运营中心，泥客网</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="shortcut icon"
	href="http://img.niiker.com/group1/M00/02/66/wKgAD1hXT9yAd5BXAAAQvknTk0w758.ico"
	type="image/x-icon">
<link rel="stylesheet" type="text/css" href="../static/js/public.css">
<link rel="stylesheet" type="text/css" href="../static/js/index.css">
<link rel="stylesheet" type="text/css"
	href="../static/js/jquery-ui.min.css">
</head>
<body class="background-gray">
	<!--S asider-->

	<div id="asider" style="height: 1052px;">

		<div class="asider-header">
			<h1 class="logo">
				<a title="泥客网" href="javascript:void(0)"><img
					onerror="javascript:this.src=&#39;http://s.niiker.com/yp/ui/main/images/blank.png&#39;;"
					src="../static/js/wKgAD1j5IY-AUQMQAAAKDVWHOWg121.png" alt="泥客网"
					width="110" height="56"></a>
			</h1>
		</div>

		<div class="asider-menu">
			<ul>

				<li id="menu_ec" class="on"><a
					href="http://busi.niiker.com/business/cms/channel/list"><i></i><span>网站建设</span></a></li>

				<li id="menu_customer"><a
					href="http://busi.niiker.com/business/person/member"><i></i><span>客户管理</span></a></li>

				<li id="menu_order"><a
					href="http://busi.niiker.com/business/post/info"><i></i><span>职位管理</span></a></li>

				<li id="menu_product"><a
					href="http://busi.niiker.com/business/resume/allResume"><i></i><span>简历管理</span></a></li>

				<li id="menu_O2O"><a
					href="http://busi.niiker.com/business/purview/business/role"><i></i><span>权限管理</span></a></li>

				<li id="menu_ecology"><a
					href="http://busi.niiker.com/business/setting/business"><i></i><span>系统设置</span></a></li>

				<span id="menu_on" style="top: 0px; width: 110px; height: 92px;"></span>
			</ul>
		</div>
	</div>
	<!--E asider-->
	<!--S sectioner-->
	<div id="sectioner" class="hasfixedPage">
		<!--S header-->

		<div class="header">



			<div class="toolbar">
				<div class="wrap">
					<div class="companyName" title="深圳市富润电子商务有限公司">
						<span title="深圳市富润电子商务有限公司">富润FEC</span>
					</div>
					<div class="tools">
						<ul>
							<li class="item-buyBtn">
								<div class="dt">
									<a class="ui-tag" target="_blank" href="http://www.niiker.com/">泥客网</a>
								</div>
							</li>
							<li class="item-user dropmenu">
								<div class="dt">
									<div class="user">
										<span class="user-txt"><span title="风清扬">风清扬</span></span> <span
											class="user-img"> <img
											onerror="javascript:this.src=&#39;http://s.niiker.com/yp/ui/main/images/user.png&#39;;"
											src="../static/js/wKgAD1hh2UiAbtFjAAAZsyLD9xQ249.jpg"
											alt="风清扬" width="40" height="40">
										</span>
									</div>
								</div>
								<div class="dd" style="width: 80px;">
									<ul>
										<li><a href="http://busi.niiker.com/business/my/account"
											title="我的账户">我的账户</a></li>
										<li><a
											href="http://busi.niiker.com/business/my/modifyPassword"
											title="修改密码">修改密码</a></li>
										<li><a href="http://busi.niiker.com/business/my/opLog"
											title="操作日志">操作日志</a></li>
										<li><a href="javascript:void(0);"
											onclick="clickLoginOut()" title="退出登录"> <span
												class="font-theme"> <i class="icon icon-exit"></i>退出
											</span>
										</a>
											<form
												action="http://busi.niiker.com/business/cms/channel/list"
												method="post" name="loginOutForm" style="display: none;"></form>
										</li>
									</ul>
									<i class="icon-arrow-up"></i>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<script>
function clickLoginOut() {
	_uiMini.confrim('提示','是否确定退出当前帐号？',
		function() {
			document.loginOutForm.action = "http://busi.niiker.com/login/loginOut";
			document.loginOutForm.submit();
		}
	);
}
</script>

			<div class="header-main">
				<div class="wrap">
					<div class="breadcrumb">
						<span class="bc-home"><a
							href="http://busi.niiker.com/business/index">首页</a></span>
					</div>
					<div class="lastLogTime">
						<span class="gray">上次登录时间：2017-09-08 21:37:03</span>
					</div>
					<div class="global-shortcut">
						<ul class="items">
							<li class="item"><a href="javascript:void(0)" title="消息提醒 "><i
									class="icon icon-msg"></i> <em class="icon-dots">0</em> <span
									class="gs-tip">消息提醒 <span class="red">0</span><i
										class="icon-arrow-up"></i></span> </a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!--E header-->
		<!--S mainner-->
		<div class="mainner taber wrap" style="min-height: 207px;">
			<div class="tabNavs">
				<ul>


					<li class="tabNav on"><a
						href="http://busi.niiker.com/business/cms/channel/list">频道管理</a></li>

					<li class="tabNav "><a
						href="http://busi.niiker.com/business/cms/stand/list">展位管理</a></li>

					<li class="tabNav "><a
						href="http://busi.niiker.com/business/website/advert">广告管理</a></li>

					<li class="tabNav "><a
						href="http://busi.niiker.com/business/website/article">文章管理</a></li>

					<li class="tabNav "><a
						href="http://busi.niiker.com/business/website/flink">友情链接</a></li>

					<li class="tabNav "><a
						href="http://busi.niiker.com/business/website/news">新闻管理</a></li>

					<li class="tabNav "><a
						href="http://busi.niiker.com/business/website/topic">专题管理</a></li>

					<li class="tabNav "><a
						href="http://busi.niiker.com/business/website/notice">公告管理</a></li>

					<li class="tabNav "><a
						href="http://busi.niiker.com/business/website/activity">活动管理</a></li>

					<li class="tabNav "><a
						href="http://busi.niiker.com/business/website/help">帮助中心</a></li>

					<li class="tabNav "><a
						href="http://busi.niiker.com/business/website/version">版本更新</a></li>

					<li class="tabNav "><a
						href="http://busi.niiker.com/business/website/areaSite">区域站点</a></li>

					<li class="tabNav "><a
						href="http://busi.niiker.com/business/website/config">网站设置</a></li>

				</ul>
			</div>
			<div class="tabCons">
				<div class="operationBar">
					<span class="oper-main"> <span class="widget-sort"> <span
							class="group group-sort">筛选： <span class="sort-dl">
									<span class="sort-dt"> <span>全部专属</span><i
										class="icon icon-borarr-down"></i>
								</span> <span class="sort-dd">
										<ul>
											<li><a href="javascript:void(0)" title="全部专属"
												onclick="chooseChannelBelongBtn(&#39;&#39;, &#39;全部专属&#39;)">全部专属</a></li>



											<li><a href="javascript:void(0)" title="前端网站"
												onclick="chooseChannelBelongBtn(&#39;1&#39;, &#39;前端网站&#39;)">前端网站</a></li>

											<li><a href="javascript:void(0)" title="触屏网站"
												onclick="chooseChannelBelongBtn(&#39;2&#39;, &#39;触屏网站&#39;)">触屏网站</a></li>



										</ul> <i class="icon-arrow-up"></i>
								</span>
							</span>
						</span> <span class="group group-sort">排序： <span class="sort-dl">
									<span class="sort-dt"> 创建时间<i
										class="icon icon-sort-down"></i><i
										class="icon icon-borarr-down"></i>
								</span> <span class="sort-dd">
										<ul>
											<li><a title="创建时间" href="javascript:void(0);"
												onclick="chooseSortBtn(&#39;createTimeSort_2&#39;)">创建时间<i
													class="icon icon-sort-down"></i></a></li>
											<li><a title="创建时间" href="javascript:void(0);"
												onclick="chooseSortBtn(&#39;createTimeSort_1&#39;)">创建时间<i
													class="icon icon-sort-up"></i></a></li>
										</ul> <i class="icon-arrow-up"></i>
								</span>
							</span>
						</span>
					</span>
					</span> <span class="oper-extra"> <span class="group"> <span
							class="quickSearch" style="width: 310px;"> <input
								class="quickSearch-text textm" id="_quickSearch_" value=""
								style="width: 277px;" type="text"
								placeholder="频道名称/频道简称/频道别名/频道描述" onkeydown="onKeyDown(event)">
								<input class="quickSearch-submit btn-search" type="button"
								onclick="clickQuickSearch()">
						</span>
					</span> <span class="group"> <a class="btn-refresh"
							href="javascript:void(0);" onclick="clickRefreshBtn()"><i
								class="icon icon-refresh"></i>刷新</a>
					</span> <span class="group"> <a href="javascript:void(0)"
							class="btnf-ui-m btn-add" onclick="clickAddBtn()"><i
								class="icon icon-add"></i>新增</a>

					</span>
					</span>
				</div>
				<div class="row row-list">
					<table class="table table-list table-dropList" id="channel-list">
						<thead>
							<tr>
								<th width="5%"><span><input id="topCheckAll"
										class="checkbox checkAll" type="checkbox"
										onclick="clickCheckAll(this)"></span></th>
								<th width="15%" class="text-left"><span>别名/名称/简称</span></th>
								<th width="10%" class="text-left"><span>频道专属</span></th>
								<th width="15%" class="text-left"><span>频道描述</span></th>
								<th width="10%" class="text-left"><span>SEO标题</span></th>
								<th width="10%" class="text-left"><span>SEO关键字</span></th>
								<th width="10%" class="text-left"><span>SEO描述</span></th>
								<th width="10%"><span>创建时间</span></th>
								<th width="10%"><span>操作</span></th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th colspan="9"></th>
							</tr>
						</tfoot>
						<tbody>



							<tr class="tr-hd">
								<td><span><input class="checkbox" type="checkbox"
										name="checkbox_sub" value="10$_$touch_index"
										onclick="clickCheckSub()"></span></td>
								<td class="text-left"><span>
										<p class="td-nowrap" style="font-weight: bold;"
											title="touch_index">touch_index</p>
										<p class="td-nowrap" title="触屏端-首页频道">触屏端-首页频道</p>


										<p class="td-nowrap" title="触屏端-首页频道">触屏端-首页频道</p>


								</span></td>



								<td class="text-left"><p class="td-nowrap" title="触屏网站">触屏网站</p></td>


								<td class="text-left"><p class="td-nowrap" title="触屏端-首页频道">触屏端-首页频道</p></td>
								<td class="text-left"><p class="td-nowrap" title="触屏端-首页频道">触屏端-首页频道</p></td>
								<td class="text-left"><p class="td-nowrap" title="触屏端-首页频道">触屏端-首页频道</p></td>
								<td class="text-left"><p class="td-nowrap" title="触屏端-首页频道">触屏端-首页频道</p></td>
								<td><p title="2017-06-19 22:18:51">2017-06-19 22:18:51</p></td>
								<td><span>
										<p>
											<a href="javascript:void(0)" class="blue"
												onclick="clickEditBtn(&#39;10&#39;)">修改</a> | <a
												href="javascript:void(0)" class="blue"
												onclick="clickDeleteBtn(&#39;10&#39;, &#39;touch_index&#39;)">删除</a>

										</p>
								</span> <span> <a class="blue" href="javascript:void(0);"
										onclick="showBindingList(this, &#39;10&#39;, &#39;2&#39;, &#39;touch_index&#39;);">维护频道</a>
								</span></td>
							</tr>
							<tr class="tr-bd tr-hidden">
								<td colspan="9">
									<div class="table-dropList">
										<div style="width: 95%; margin: auto;">
											<div class="row ui-tools">
												<div class="fr">
													<a href="javascript:void(0)" class="btn-delete"
														onclick="batchDeleteChannelStandRel(&#39;10&#39;, &#39;touch_index&#39;)"><i
														class="icon icon-delete"></i>批量删除</a>

												</div>
											</div>
											<div class="row">
												<table class="table table-listDetail">
													<thead>
														<tr>
															<th width="5%">序号</th>
															<th width="5%"><span><input type="checkbox"
																	class="checkbox checkAll" value="" id="topCheckAll_10"
																	onclick="clickDataCheckAll(this, &#39;10&#39;)"></span></th>
															<th width="20%">展位别名</th>
															<th width="20%">展位名称</th>
															<th width="10%">展位种类</th>
															<th width="10%">展位类型</th>
															<th width="10%">内容条数</th>
															<th width="20%">展位描述</th>
														</tr>
													</thead>
													<tbody class="unitConversion-body" id="dataListBody_10">
													</tbody>
												</table>
												<table class="table">
													<tbody>
														<tr>
															<td colspan="8"><a href="javascript:void(0)"
																class="btnf-ui-m btn-add btn-add-count-pricing"
																onclick="popDiv_j_alert_selectStand(&#39;10&#39;)"><i
																	class="icon icon-add"></i>选择展位</a></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</td>
							</tr>

							<tr class="tr-hd">
								<td><span><input class="checkbox" type="checkbox"
										name="checkbox_sub" value="9$_$pc_member_center"
										onclick="clickCheckSub()"></span></td>
								<td class="text-left"><span>
										<p class="td-nowrap" style="font-weight: bold;"
											title="pc_member_center">pc_member_center</p>
										<p class="td-nowrap" title="个人中心频道">个人中心频道</p>


										<p class="td-nowrap" title="个人中心频道">个人中心频道</p>


								</span></td>


								<td class="text-left"><p class="td-nowrap" title="前端网站">前端网站</p></td>



								<td class="text-left"><p class="td-nowrap" title="个人中心频道">个人中心频道</p></td>
								<td class="text-left"><p class="td-nowrap" title="个人中心频道">个人中心频道</p></td>
								<td class="text-left"><p class="td-nowrap" title="个人中心频道">个人中心频道</p></td>
								<td class="text-left"><p class="td-nowrap" title="个人中心频道">个人中心频道</p></td>
								<td><p title="2017-04-11 13:38:31">2017-04-11 13:38:31</p></td>
								<td><span>
										<p>
											<a href="javascript:void(0)" class="blue"
												onclick="clickEditBtn(&#39;9&#39;)">修改</a> | <a
												href="javascript:void(0)" class="blue"
												onclick="clickDeleteBtn(&#39;9&#39;, &#39;pc_member_center&#39;)">删除</a>

										</p>
								</span> <span> <a class="blue" href="javascript:void(0);"
										onclick="showBindingList(this, &#39;9&#39;, &#39;1&#39;, &#39;pc_member_center&#39;);">维护频道</a>
								</span></td>
							</tr>
							<tr class="tr-bd tr-hidden">
								<td colspan="9">
									<div class="table-dropList">
										<div style="width: 95%; margin: auto;">
											<div class="row ui-tools">
												<div class="fr">
													<a href="javascript:void(0)" class="btn-delete"
														onclick="batchDeleteChannelStandRel(&#39;9&#39;, &#39;pc_member_center&#39;)"><i
														class="icon icon-delete"></i>批量删除</a>

												</div>
											</div>
											<div class="row">
												<table class="table table-listDetail">
													<thead>
														<tr>
															<th width="5%">序号</th>
															<th width="5%"><span><input type="checkbox"
																	class="checkbox checkAll" value="" id="topCheckAll_9"
																	onclick="clickDataCheckAll(this, &#39;9&#39;)"></span></th>
															<th width="20%">展位别名</th>
															<th width="20%">展位名称</th>
															<th width="10%">展位种类</th>
															<th width="10%">展位类型</th>
															<th width="10%">内容条数</th>
															<th width="20%">展位描述</th>
														</tr>
													</thead>
													<tbody class="unitConversion-body" id="dataListBody_9">
													</tbody>
												</table>
												<table class="table">
													<tbody>
														<tr>
															<td colspan="8"><a href="javascript:void(0)"
																class="btnf-ui-m btn-add btn-add-count-pricing"
																onclick="popDiv_j_alert_selectStand(&#39;9&#39;)"><i
																	class="icon icon-add"></i>选择展位</a></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</td>
							</tr>

							<tr class="tr-hd">
								<td><span><input class="checkbox" type="checkbox"
										name="checkbox_sub" value="8$_$pc_activity_list"
										onclick="clickCheckSub()"></span></td>
								<td class="text-left"><span>
										<p class="td-nowrap" style="font-weight: bold;"
											title="pc_activity_list">pc_activity_list</p>
										<p class="td-nowrap" title="活动列表">活动列表</p>


										<p class="td-nowrap" title="活动列表">活动列表</p>


								</span></td>


								<td class="text-left"><p class="td-nowrap" title="前端网站">前端网站</p></td>



								<td class="text-left"><p class="td-nowrap" title="活动列表">活动列表</p></td>
								<td class="text-left"><p class="td-nowrap" title="活动列表">活动列表</p></td>
								<td class="text-left"><p class="td-nowrap" title="活动列表">活动列表</p></td>
								<td class="text-left"><p class="td-nowrap" title="活动列表">活动列表</p></td>
								<td><p title="2017-04-11 13:25:56">2017-04-11 13:25:56</p></td>
								<td><span>
										<p>
											<a href="javascript:void(0)" class="blue"
												onclick="clickEditBtn(&#39;8&#39;)">修改</a> | <a
												href="javascript:void(0)" class="blue"
												onclick="clickDeleteBtn(&#39;8&#39;, &#39;pc_activity_list&#39;)">删除</a>

										</p>
								</span> <span> <a class="blue" href="javascript:void(0);"
										onclick="showBindingList(this, &#39;8&#39;, &#39;1&#39;, &#39;pc_activity_list&#39;);">维护频道</a>
								</span></td>
							</tr>
							<tr class="tr-bd tr-hidden">
								<td colspan="9">
									<div class="table-dropList">
										<div style="width: 95%; margin: auto;">
											<div class="row ui-tools">
												<div class="fr">
													<a href="javascript:void(0)" class="btn-delete"
														onclick="batchDeleteChannelStandRel(&#39;8&#39;, &#39;pc_activity_list&#39;)"><i
														class="icon icon-delete"></i>批量删除</a>

												</div>
											</div>
											<div class="row">
												<table class="table table-listDetail">
													<thead>
														<tr>
															<th width="5%">序号</th>
															<th width="5%"><span><input type="checkbox"
																	class="checkbox checkAll" value="" id="topCheckAll_8"
																	onclick="clickDataCheckAll(this, &#39;8&#39;)"></span></th>
															<th width="20%">展位别名</th>
															<th width="20%">展位名称</th>
															<th width="10%">展位种类</th>
															<th width="10%">展位类型</th>
															<th width="10%">内容条数</th>
															<th width="20%">展位描述</th>
														</tr>
													</thead>
													<tbody class="unitConversion-body" id="dataListBody_8">
													</tbody>
												</table>
												<table class="table">
													<tbody>
														<tr>
															<td colspan="8"><a href="javascript:void(0)"
																class="btnf-ui-m btn-add btn-add-count-pricing"
																onclick="popDiv_j_alert_selectStand(&#39;8&#39;)"><i
																	class="icon icon-add"></i>选择展位</a></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</td>
							</tr>

							<tr class="tr-hd">
								<td><span><input class="checkbox" type="checkbox"
										name="checkbox_sub" value="7$_$pc_notice_list"
										onclick="clickCheckSub()"></span></td>
								<td class="text-left"><span>
										<p class="td-nowrap" style="font-weight: bold;"
											title="pc_notice_list">pc_notice_list</p>
										<p class="td-nowrap" title="公告列表">公告列表</p>


										<p class="td-nowrap" title="公告列表">公告列表</p>


								</span></td>


								<td class="text-left"><p class="td-nowrap" title="前端网站">前端网站</p></td>



								<td class="text-left"><p class="td-nowrap" title="公告列表">公告列表</p></td>
								<td class="text-left"><p class="td-nowrap" title="公告列表">公告列表</p></td>
								<td class="text-left"><p class="td-nowrap" title="公告列表">公告列表</p></td>
								<td class="text-left"><p class="td-nowrap" title="公告列表">公告列表</p></td>
								<td><p title="2017-04-11 13:25:36">2017-04-11 13:25:36</p></td>
								<td><span>
										<p>
											<a href="javascript:void(0)" class="blue"
												onclick="clickEditBtn(&#39;7&#39;)">修改</a> | <a
												href="javascript:void(0)" class="blue"
												onclick="clickDeleteBtn(&#39;7&#39;, &#39;pc_notice_list&#39;)">删除</a>

										</p>
								</span> <span> <a class="blue" href="javascript:void(0);"
										onclick="showBindingList(this, &#39;7&#39;, &#39;1&#39;, &#39;pc_notice_list&#39;);">维护频道</a>
								</span></td>
							</tr>
							<tr class="tr-bd tr-hidden">
								<td colspan="9">
									<div class="table-dropList">
										<div style="width: 95%; margin: auto;">
											<div class="row ui-tools">
												<div class="fr">
													<a href="javascript:void(0)" class="btn-delete"
														onclick="batchDeleteChannelStandRel(&#39;7&#39;, &#39;pc_notice_list&#39;)"><i
														class="icon icon-delete"></i>批量删除</a>

												</div>
											</div>
											<div class="row">
												<table class="table table-listDetail">
													<thead>
														<tr>
															<th width="5%">序号</th>
															<th width="5%"><span><input type="checkbox"
																	class="checkbox checkAll" value="" id="topCheckAll_7"
																	onclick="clickDataCheckAll(this, &#39;7&#39;)"></span></th>
															<th width="20%">展位别名</th>
															<th width="20%">展位名称</th>
															<th width="10%">展位种类</th>
															<th width="10%">展位类型</th>
															<th width="10%">内容条数</th>
															<th width="20%">展位描述</th>
														</tr>
													</thead>
													<tbody class="unitConversion-body" id="dataListBody_7">
													</tbody>
												</table>
												<table class="table">
													<tbody>
														<tr>
															<td colspan="8"><a href="javascript:void(0)"
																class="btnf-ui-m btn-add btn-add-count-pricing"
																onclick="popDiv_j_alert_selectStand(&#39;7&#39;)"><i
																	class="icon icon-add"></i>选择展位</a></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</td>
							</tr>

							<tr class="tr-hd">
								<td><span><input class="checkbox" type="checkbox"
										name="checkbox_sub" value="6$_$pc_topic_list"
										onclick="clickCheckSub()"></span></td>
								<td class="text-left"><span>
										<p class="td-nowrap" style="font-weight: bold;"
											title="pc_topic_list">pc_topic_list</p>
										<p class="td-nowrap" title="专题列表">专题列表</p>


										<p class="td-nowrap" title="专题列表">专题列表</p>


								</span></td>


								<td class="text-left"><p class="td-nowrap" title="前端网站">前端网站</p></td>



								<td class="text-left"><p class="td-nowrap" title="专题列表">专题列表</p></td>
								<td class="text-left"><p class="td-nowrap" title="专题列表">专题列表</p></td>
								<td class="text-left"><p class="td-nowrap" title="专题列表">专题列表</p></td>
								<td class="text-left"><p class="td-nowrap" title="专题列表">专题列表</p></td>
								<td><p title="2017-04-11 13:24:56">2017-04-11 13:24:56</p></td>
								<td><span>
										<p>
											<a href="javascript:void(0)" class="blue"
												onclick="clickEditBtn(&#39;6&#39;)">修改</a> | <a
												href="javascript:void(0)" class="blue"
												onclick="clickDeleteBtn(&#39;6&#39;, &#39;pc_topic_list&#39;)">删除</a>

										</p>
								</span> <span> <a class="blue" href="javascript:void(0);"
										onclick="showBindingList(this, &#39;6&#39;, &#39;1&#39;, &#39;pc_topic_list&#39;);">维护频道</a>
								</span></td>
							</tr>
							<tr class="tr-bd tr-hidden">
								<td colspan="9">
									<div class="table-dropList">
										<div style="width: 95%; margin: auto;">
											<div class="row ui-tools">
												<div class="fr">
													<a href="javascript:void(0)" class="btn-delete"
														onclick="batchDeleteChannelStandRel(&#39;6&#39;, &#39;pc_topic_list&#39;)"><i
														class="icon icon-delete"></i>批量删除</a>

												</div>
											</div>
											<div class="row">
												<table class="table table-listDetail">
													<thead>
														<tr>
															<th width="5%">序号</th>
															<th width="5%"><span><input type="checkbox"
																	class="checkbox checkAll" value="" id="topCheckAll_6"
																	onclick="clickDataCheckAll(this, &#39;6&#39;)"></span></th>
															<th width="20%">展位别名</th>
															<th width="20%">展位名称</th>
															<th width="10%">展位种类</th>
															<th width="10%">展位类型</th>
															<th width="10%">内容条数</th>
															<th width="20%">展位描述</th>
														</tr>
													</thead>
													<tbody class="unitConversion-body" id="dataListBody_6">
													</tbody>
												</table>
												<table class="table">
													<tbody>
														<tr>
															<td colspan="8"><a href="javascript:void(0)"
																class="btnf-ui-m btn-add btn-add-count-pricing"
																onclick="popDiv_j_alert_selectStand(&#39;6&#39;)"><i
																	class="icon icon-add"></i>选择展位</a></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</td>
							</tr>

							<tr class="tr-hd">
								<td><span><input class="checkbox" type="checkbox"
										name="checkbox_sub" value="5$_$pc_news_list"
										onclick="clickCheckSub()"></span></td>
								<td class="text-left"><span>
										<p class="td-nowrap" style="font-weight: bold;"
											title="pc_news_list">pc_news_list</p>
										<p class="td-nowrap" title="新闻列表">新闻列表</p>


										<p class="td-nowrap" title="新闻列表">新闻列表</p>


								</span></td>


								<td class="text-left"><p class="td-nowrap" title="前端网站">前端网站</p></td>



								<td class="text-left"><p class="td-nowrap" title="新闻列表">新闻列表</p></td>
								<td class="text-left"><p class="td-nowrap" title="新闻列表">新闻列表</p></td>
								<td class="text-left"><p class="td-nowrap" title="新闻列表">新闻列表</p></td>
								<td class="text-left"><p class="td-nowrap" title="新闻列表">新闻列表</p></td>
								<td><p title="2017-04-11 10:44:17">2017-04-11 10:44:17</p></td>
								<td><span>
										<p>
											<a href="javascript:void(0)" class="blue"
												onclick="clickEditBtn(&#39;5&#39;)">修改</a> | <a
												href="javascript:void(0)" class="blue"
												onclick="clickDeleteBtn(&#39;5&#39;, &#39;pc_news_list&#39;)">删除</a>

										</p>
								</span> <span> <a class="blue" href="javascript:void(0);"
										onclick="showBindingList(this, &#39;5&#39;, &#39;1&#39;, &#39;pc_news_list&#39;);">维护频道</a>
								</span></td>
							</tr>
							<tr class="tr-bd tr-hidden">
								<td colspan="9">
									<div class="table-dropList">
										<div style="width: 95%; margin: auto;">
											<div class="row ui-tools">
												<div class="fr">
													<a href="javascript:void(0)" class="btn-delete"
														onclick="batchDeleteChannelStandRel(&#39;5&#39;, &#39;pc_news_list&#39;)"><i
														class="icon icon-delete"></i>批量删除</a>

												</div>
											</div>
											<div class="row">
												<table class="table table-listDetail">
													<thead>
														<tr>
															<th width="5%">序号</th>
															<th width="5%"><span><input type="checkbox"
																	class="checkbox checkAll" value="" id="topCheckAll_5"
																	onclick="clickDataCheckAll(this, &#39;5&#39;)"></span></th>
															<th width="20%">展位别名</th>
															<th width="20%">展位名称</th>
															<th width="10%">展位种类</th>
															<th width="10%">展位类型</th>
															<th width="10%">内容条数</th>
															<th width="20%">展位描述</th>
														</tr>
													</thead>
													<tbody class="unitConversion-body" id="dataListBody_5">
													</tbody>
												</table>
												<table class="table">
													<tbody>
														<tr>
															<td colspan="8"><a href="javascript:void(0)"
																class="btnf-ui-m btn-add btn-add-count-pricing"
																onclick="popDiv_j_alert_selectStand(&#39;5&#39;)"><i
																	class="icon icon-add"></i>选择展位</a></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</td>
							</tr>

							<tr class="tr-hd">
								<td><span><input class="checkbox" type="checkbox"
										name="checkbox_sub" value="3$_$pc_enterprice_search"
										onclick="clickCheckSub()"></span></td>
								<td class="text-left"><span>
										<p class="td-nowrap" style="font-weight: bold;"
											title="pc_enterprice_search">pc_enterprice_search</p>
										<p class="td-nowrap" title="企业搜索频道">企业搜索频道</p>


										<p class="td-nowrap" title="企业搜索频道">企业搜索频道</p>


								</span></td>


								<td class="text-left"><p class="td-nowrap" title="前端网站">前端网站</p></td>



								<td class="text-left"><p class="td-nowrap"
										title="定义企业搜索频道内容">定义企业搜索频道内容</p></td>
								<td class="text-left"><p class="td-nowrap" title=""></p></td>
								<td class="text-left"><p class="td-nowrap" title=""></p></td>
								<td class="text-left"><p class="td-nowrap" title=""></p></td>
								<td><p title="2017-04-09 20:10:29">2017-04-09 20:10:29</p></td>
								<td><span>
										<p>
											<a href="javascript:void(0)" class="blue"
												onclick="clickEditBtn(&#39;3&#39;)">修改</a> | <a
												href="javascript:void(0)" class="blue"
												onclick="clickDeleteBtn(&#39;3&#39;, &#39;pc_enterprice_search&#39;)">删除</a>

										</p>
								</span> <span> <a class="blue" href="javascript:void(0);"
										onclick="showBindingList(this, &#39;3&#39;, &#39;1&#39;, &#39;pc_enterprice_search&#39;);">维护频道</a>
								</span></td>
							</tr>
							<tr class="tr-bd tr-hidden">
								<td colspan="9">
									<div class="table-dropList">
										<div style="width: 95%; margin: auto;">
											<div class="row ui-tools">
												<div class="fr">
													<a href="javascript:void(0)" class="btn-delete"
														onclick="batchDeleteChannelStandRel(&#39;3&#39;, &#39;pc_enterprice_search&#39;)"><i
														class="icon icon-delete"></i>批量删除</a>

												</div>
											</div>
											<div class="row">
												<table class="table table-listDetail">
													<thead>
														<tr>
															<th width="5%">序号</th>
															<th width="5%"><span><input type="checkbox"
																	class="checkbox checkAll" value="" id="topCheckAll_3"
																	onclick="clickDataCheckAll(this, &#39;3&#39;)"></span></th>
															<th width="20%">展位别名</th>
															<th width="20%">展位名称</th>
															<th width="10%">展位种类</th>
															<th width="10%">展位类型</th>
															<th width="10%">内容条数</th>
															<th width="20%">展位描述</th>
														</tr>
													</thead>
													<tbody class="unitConversion-body" id="dataListBody_3">
													</tbody>
												</table>
												<table class="table">
													<tbody>
														<tr>
															<td colspan="8"><a href="javascript:void(0)"
																class="btnf-ui-m btn-add btn-add-count-pricing"
																onclick="popDiv_j_alert_selectStand(&#39;3&#39;)"><i
																	class="icon icon-add"></i>选择展位</a></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</td>
							</tr>

							<tr class="tr-hd">
								<td><span><input class="checkbox" type="checkbox"
										name="checkbox_sub" value="2$_$pc_post_search"
										onclick="clickCheckSub()"></span></td>
								<td class="text-left"><span>
										<p class="td-nowrap" style="font-weight: bold;"
											title="pc_post_search">pc_post_search</p>
										<p class="td-nowrap" title="职位搜索频道">职位搜索频道</p>


										<p class="td-nowrap" title="职位搜索频道">职位搜索频道</p>


								</span></td>


								<td class="text-left"><p class="td-nowrap" title="前端网站">前端网站</p></td>



								<td class="text-left"><p class="td-nowrap"
										title="定义职位搜索频道内容">定义职位搜索频道内容</p></td>
								<td class="text-left"><p class="td-nowrap" title=""></p></td>
								<td class="text-left"><p class="td-nowrap" title=""></p></td>
								<td class="text-left"><p class="td-nowrap" title=""></p></td>
								<td><p title="2017-04-09 19:51:30">2017-04-09 19:51:30</p></td>
								<td><span>
										<p>
											<a href="javascript:void(0)" class="blue"
												onclick="clickEditBtn(&#39;2&#39;)">修改</a> | <a
												href="javascript:void(0)" class="blue"
												onclick="clickDeleteBtn(&#39;2&#39;, &#39;pc_post_search&#39;)">删除</a>

										</p>
								</span> <span> <a class="blue" href="javascript:void(0);"
										onclick="showBindingList(this, &#39;2&#39;, &#39;1&#39;, &#39;pc_post_search&#39;);">维护频道</a>
								</span></td>
							</tr>
							<tr class="tr-bd tr-hidden">
								<td colspan="9">
									<div class="table-dropList">
										<div style="width: 95%; margin: auto;">
											<div class="row ui-tools">
												<div class="fr">
													<a href="javascript:void(0)" class="btn-delete"
														onclick="batchDeleteChannelStandRel(&#39;2&#39;, &#39;pc_post_search&#39;)"><i
														class="icon icon-delete"></i>批量删除</a>

												</div>
											</div>
											<div class="row">
												<table class="table table-listDetail">
													<thead>
														<tr>
															<th width="5%">序号</th>
															<th width="5%"><span><input type="checkbox"
																	class="checkbox checkAll" value="" id="topCheckAll_2"
																	onclick="clickDataCheckAll(this, &#39;2&#39;)"></span></th>
															<th width="20%">展位别名</th>
															<th width="20%">展位名称</th>
															<th width="10%">展位种类</th>
															<th width="10%">展位类型</th>
															<th width="10%">内容条数</th>
															<th width="20%">展位描述</th>
														</tr>
													</thead>
													<tbody class="unitConversion-body" id="dataListBody_2">
													</tbody>
												</table>
												<table class="table">
													<tbody>
														<tr>
															<td colspan="8"><a href="javascript:void(0)"
																class="btnf-ui-m btn-add btn-add-count-pricing"
																onclick="popDiv_j_alert_selectStand(&#39;2&#39;)"><i
																	class="icon icon-add"></i>选择展位</a></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</td>
							</tr>

							<tr class="tr-hd">
								<td><span><input class="checkbox" type="checkbox"
										name="checkbox_sub" value="1$_$pc_index"
										onclick="clickCheckSub()"></span></td>
								<td class="text-left"><span>
										<p class="td-nowrap" style="font-weight: bold;"
											title="pc_index">pc_index</p>
										<p class="td-nowrap" title="首页频道位">首页频道位</p>


										<p class="td-nowrap" title="首页的频道">首页的频道</p>


								</span></td>


								<td class="text-left"><p class="td-nowrap" title="前端网站">前端网站</p></td>



								<td class="text-left"><p class="td-nowrap" title="首页频道位描述">首页频道位描述</p></td>
								<td class="text-left"><p class="td-nowrap" title="首页">首页</p></td>
								<td class="text-left"><p class="td-nowrap" title="首页">首页</p></td>
								<td class="text-left"><p class="td-nowrap" title="首页">首页</p></td>
								<td><p title="2017-04-08 14:51:09">2017-04-08 14:51:09</p></td>
								<td><span>
										<p>
											<a href="javascript:void(0)" class="blue"
												onclick="clickEditBtn(&#39;1&#39;)">修改</a> | <a
												href="javascript:void(0)" class="blue"
												onclick="clickDeleteBtn(&#39;1&#39;, &#39;pc_index&#39;)">删除</a>

										</p>
								</span> <span> <a class="blue" href="javascript:void(0);"
										onclick="showBindingList(this, &#39;1&#39;, &#39;1&#39;, &#39;pc_index&#39;);">维护频道</a>
								</span></td>
							</tr>
							<tr class="tr-bd tr-hidden">
								<td colspan="9">
									<div class="table-dropList">
										<div style="width: 95%; margin: auto;">
											<div class="row ui-tools">
												<div class="fr">
													<a href="javascript:void(0)" class="btn-delete"
														onclick="batchDeleteChannelStandRel(&#39;1&#39;, &#39;pc_index&#39;)"><i
														class="icon icon-delete"></i>批量删除</a>

												</div>
											</div>
											<div class="row">
												<table class="table table-listDetail">
													<thead>
														<tr>
															<th width="5%">序号</th>
															<th width="5%"><span><input type="checkbox"
																	class="checkbox checkAll" value="" id="topCheckAll_1"
																	onclick="clickDataCheckAll(this, &#39;1&#39;)"></span></th>
															<th width="20%">展位别名</th>
															<th width="20%">展位名称</th>
															<th width="10%">展位种类</th>
															<th width="10%">展位类型</th>
															<th width="10%">内容条数</th>
															<th width="20%">展位描述</th>
														</tr>
													</thead>
													<tbody class="unitConversion-body" id="dataListBody_1">
													</tbody>
												</table>
												<table class="table">
													<tbody>
														<tr>
															<td colspan="8"><a href="javascript:void(0)"
																class="btnf-ui-m btn-add btn-add-count-pricing"
																onclick="popDiv_j_alert_selectStand(&#39;1&#39;)"><i
																	class="icon icon-add"></i>选择展位</a></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</td>
							</tr>




						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!--S fixedPage -->
		<div class="fixedPage" id="J_FixedPage">
			<div class="fixedPage-bar">
				<div class="fixedPage-action">
					<span class="check"> <input class="checkbox checkAll"
						type="checkbox" id="bottomCheckAll" onclick="clickCheckAll(this);">
					</span> <span class="batch"> <span class="item"> <a
							href="javascript:void(0)" title="批量删除" class="blue"
							onclick="clickBatchDeleteBtn()">批量删除</a>

					</span>
					</span>
				</div>
				<div class="page page-right">
					<div class="page-wrapper">

						<div class="page-inner">
							<span class="group">共计：9条 每页显示 <select id="_selectPage"
								name="_selectPage" class="select" onchange="_selectPageSize()">
									<option selected="selected" value="10">10</option>
									<option value="15">15</option>
									<option value="20">20</option>
									<option value="50">50</option>
									<option value="100">100</option>
							</select> 条
							</span> <span class="group"> 第 <input id="_selectPageIndex"
								name="_selectPageIndex" class="texts" type="text" value="1"
								onblur="_onblurPageIndex(this)"> 页
							</span> <span class="group"> 共 <em>1</em> 页
							</span> <span class="group"> <a class="page-prev"
								href="javascript:void(0)"
								onclick="_onClickBtn(&#39;0&#39;, &#39;-1&#39;, &#39;10&#39;, &#39;1&#39;)"><i
									class="cssarr-left"></i></a> <a class="page-next"
								href="javascript:void(0)"
								onclick="_onClickBtn(&#39;0&#39;, &#39;1&#39;, &#39;10&#39;, &#39;0&#39;)"><i
									class="cssarr-right"></i></a>
							</span>
						</div>
						<form action="http://busi.niiker.com/business/cms/channel/list"
							name="page_form" id="page_form" method="post">
							<input type="hidden" name="pageSize" id="pageSize" value="10">
							<input type="hidden" name="pageIndex" id="pageIndex" value="0">
							<input type="hidden" name="rowCount" id="rowCount" value="9">
							<input type="hidden" name="serviceType" id="serviceType" value="">
							<input type="hidden" name="sort" id="sort" value=""> <input
								type="hidden" name="channelBelong" id="channelBelong" value="">
							<input type="hidden" name="_quickSearch" id="_quickSearch"
								value=""> <input type="hidden" name="channelBelongName"
								id="channelBelongName" value="">
						</form>
						<script type="text/javascript">
	function _clickPage(page, size) {
		jQuery('#pageIndex').val(page);
		jQuery('#pageSize').val(size);
		document.getElementById('page_form').submit();
	}
function _onClickBtn(flag, page, size, dis) {
	if("1" == flag) {
		_clickPage(page, size);
	}else{
		var message = "";
		if(dis=="1") {
			message = "第一页";
		}else{
			message = "最后一页";
		}
		_uiMini.alert('提示','已经'+message+'了。');
	}
}
function _selectPageSize() {
	var selectPage = jQuery("#_selectPage").val();
	_clickPage('0', selectPage);
}
	function _onblurPageIndex(obj) {
		var pageIndexValue = obj.value;
		if(isNaN(pageIndexValue)) {
			_uiMini.alert("提示","请输入有效的页数。");
			_resetPageIndex();
		}else if(pageIndexValue <= 0) {
			_uiMini.alert("提示","请输入有效的页数。");
			_resetPageIndex();
		}else if(pageIndexValue >= 1 && pageIndexValue <= 1) {
			var pageSizeValue = document.getElementById("_selectPageIndex").value;
			_clickPage(pageIndexValue-1, '10');
		}else{
			_uiMini.alert("提示","请输入有效的页数。");
			_resetPageIndex();
		}
	}
	function _resetPageIndex() {
		document.getElementById("_selectPageIndex").value = "1";
	}
function _refreshPageByCondition() {
	_clickPage("0", "10");
}
function _refreshPageByCurrent() {
		var pageIndexValue = jQuery('#pageIndex').val();
		var allPageValue = "1";
		if(Number(allPageValue) > 1) {
			allPageValue = Number(allPageValue) - 1;
			if(Number(allPageValue) <= Number(pageIndexValue)) {
				jQuery('#pageIndex').val(Number(allPageValue) - 1);
			}
		}
		document.getElementById('page_form').submit();
}
</script>

					</div>
				</div>
			</div>
		</div>
		<!--E fixedPage -->
		<!--S footer-->
		<div class="footer"></div>
		<!--E footer-->
	</div>
	<!--E sectioner-->
	<!--S ui-mask-->
	<div class="ui-mask" id="j_mask"></div>
	<!--E ui-mask-->

	<div class="ui-alert" id="j_alert_AddChannelForm">
		<div class="hd">
			<span class="alert-title">新增频道</span> <span class="alert-close">
				<a class="alert-close-botton"
				href="javascript:uiAlertClose(&#39;#j_alert_AddChannelForm&#39;);"
				title="关闭"></a>
			</span>
		</div>
		<div class="bd">
			<form class="form ui-form row" id="addChannelForm"
				name="addChannelForm" method="post">
				<dl>
					<dt>
						<em class="red">*</em>频道别名
					</dt>
					<dd>
						<input onblur="_onBlurMaxLength(this, 50)" type="text"
							placeholder="频道别名不超过50个字符，建议填写英文，同一频道专属类型中唯一必填项" value=""
							id="channelAliasName_add" name="channelAliasName" class="textl">
						<a class="showTip_channelAliasName" href="javascript:void(0);"><i
							class="icon icon-question"></i></a>
					</dd>
				</dl>
				<dl>
					<dt>
						<em class="red">*</em>频道名称
					</dt>
					<dd>
						<input onblur="_onBlurMaxLength(this, 50)" type="text"
							placeholder="频道名称不超过50个字符，必填项" value="" id="channelName_add"
							name="channelName" class="textl"> <a
							class="showTip_channelName" href="javascript:void(0);"><i
							class="icon icon-question"></i></a>
					</dd>
				</dl>
				<dl>
					<dt>频道简称</dt>
					<dd>
						<input onblur="_onBlurMaxLength(this, 20)" type="text"
							placeholder="频道简称不超过20个字符" value="" id="channelSubName_add"
							name="channelSubName" class="textl">
					</dd>
				</dl>
				<dl>
					<dt>频道图标</dt>
					<dd>
						<div class="ui-uploadGroup">
							<ul class="items">
								<li id="uploadLi_properties_add" class="item">
									<div id="uploadDiv_properties_add" class="ui-uploadGroup-img">
										<a id="uploadA_properties_add" class="file btng-ui-m"
											href="javascript:void(0);"> <span>+</span> <input
											class="filePrew" type="file" id="filedField_properties_add"
											name="filedField_properties_add" size="3"
											onchange="upload_uploadFile_properties_add(this)">
										</a>
									</div>
									<div id="uploadLoading_properties_add" style="display: none;"
										class="ui-uploadGroup-img"></div>
								</li>
							</ul>
						</div>
						<input type="hidden" name="channelLogo" id="channelLogo_add">
						<div class="ui-form-tip mt20">
							请注意上传的图片是否清晰，支持"jpg,jpeg,png,bmp,gif"格式，文件大小小于2M。</div>
					</dd>
				</dl>
				<dl>
					<dt>
						<em class="red">*</em>频道专属
					</dt>
					<dd>
						<select class="select selects" name="channelBelong"
							id="channelBelong_add">



							<option value="1">前端网站</option>

							<option value="2">触屏网站</option>



						</select> <a class="showTip_channelBelong" href="javascript:void(0);"><i
							class="icon icon-question"></i></a>
					</dd>
				</dl>
				<dl>
					<dt>
						<em class="red">*</em>频道描述
					</dt>
					<dd>
						<textarea onblur="_onBlurMaxLength(this, 200)"
							placeholder="频道描述不超过200个字符，必填项" class="textarea textareas"
							name="channelDesc" id="channelDesc_add"
							style="width: 490px; resize: none;"></textarea>
					</dd>
				</dl>
				<dl>
					<dt>SEO标题</dt>
					<dd>
						<input onblur="_onBlurMaxLength(this, 100)" type="text"
							placeholder="Meta标题不超过100个字符" value="" name="seoTitle"
							id="seoTitle_add" class="textl"> <a
							class="showTip_seoTitle" href="javascript:void(0);"><i
							class="icon icon-question"></i></a>
					</dd>
				</dl>
				<dl>
					<dt>SEO关键字</dt>
					<dd>
						<input onblur="_onBlurMaxLength(this, 50)" type="text"
							placeholder="Meta关键字不超过50个字符" value="" name="seoKeywords"
							id="seoKeywords_add" class="textl"> <a
							class="showTip_seoKeywords" href="javascript:void(0);"><i
							class="icon icon-question"></i></a>
					</dd>
				</dl>
				<dl>
					<dt>SEO描述</dt>
					<dd>
						<textarea onblur="_onBlurMaxLength(this, 200)"
							placeholder="Meta描述不超过200个字符" class="textarea textareas"
							name="seoDescription" id="seoDescription_add"
							style="width: 490px; resize: none;"></textarea>
					</dd>
				</dl>
			</form>
		</div>
		<div class="ft">
			<div class="submit ui-form-submit alert-comfrim">
				<a class="btnf-ui-m alert-comfrim-btnSure"
					href="javascript:void(0);" onclick="clickAddSaveBtn()" title="保存">保存</a>
				<a class="btng-ui-m alert-comfrim-btnCancle"
					href="javascript:uiAlertClose(&#39;#j_alert_AddChannelForm&#39;);"
					title="取消">取消</a>
			</div>
		</div>
	</div>

	<div class="ui-alert" id="j_alert_EditChannelForm">
		<div class="hd">
			<span class="alert-title">修改频道</span> <span class="alert-close">
				<a class="alert-close-botton"
				href="javascript:uiAlertClose(&#39;#j_alert_EditChannelForm&#39;);"
				title="关闭"></a>
			</span>
		</div>
		<div class="bd">
			<form class="form ui-form row" id="editChannelForm"
				name="editChannelForm" method="post">
				<input type="hidden" name="id" id="id_edit"> <input
					type="hidden" name="channelAliasName"
					id="channelAliasName_hidden_edit">
				<dl>
					<dt>
						<em class="red">*</em>频道别名
					</dt>
					<dd>
						<span id="channelAliasName_edit"></span> <a
							class="showTip_channelAliasName_edit" href="javascript:void(0);"><i
							class="icon icon-question"></i></a>
					</dd>
				</dl>
				<dl>
					<dt>
						<em class="red">*</em>频道名称
					</dt>
					<dd>
						<input onblur="_onBlurMaxLength(this, 50)" type="text"
							placeholder="频道名称不超过50个字符，必填项" value="" id="channelName_edit"
							name="channelName" class="textl"> <a
							class="showTip_channelName" href="javascript:void(0);"><i
							class="icon icon-question"></i></a>
					</dd>
				</dl>
				<dl>
					<dt>频道简称</dt>
					<dd>
						<input onblur="_onBlurMaxLength(this, 20)" type="text"
							placeholder="频道简称不超过20个字符" value="" id="channelSubName_edit"
							name="channelSubName" class="textl">
					</dd>
				</dl>
				<dl>
					<dt>频道图标</dt>
					<dd>
						<div class="ui-uploadGroup">
							<ul class="items">
								<li id="uploadLi_properties_edit" class="item">
									<div id="uploadDiv_properties_edit" class="ui-uploadGroup-img">
										<a id="uploadA_properties_edit" class="file btng-ui-m"
											href="javascript:void(0);"> <span>+</span> <input
											class="filePrew" type="file" width="160" height="90"
											id="filedField_properties_edit"
											name="filedField_properties_edit" size="3"
											onchange="upload_uploadFile_properties_edit(this)">
										</a>
									</div>
									<div id="uploadLoading_properties_edit" style="display: none;"
										class="ui-uploadGroup-img"></div>
								</li>
							</ul>
						</div>
						<input type="hidden" name="channelLogo" id="channelLogo_edit">
						<div class="ui-form-tip mt20">
							请注意上传的图片是否清晰，支持"jpg,jpeg,png,bmp,gif"格式，文件大小小于2M。</div>
					</dd>
				</dl>
				<dl>
					<dt>
						<em class="red">*</em>频道专属
					</dt>
					<dd>
						<span id="channelBelong_edit"></span> <a
							class="showTip_channelBelong_edit" href="javascript:void(0);"><i
							class="icon icon-question"></i></a>
					</dd>
				</dl>
				<dl>
					<dt>
						<em class="red">*</em>频道描述
					</dt>
					<dd>
						<textarea onblur="_onBlurMaxLength(this, 200)"
							placeholder="频道描述不超过200个字符，必填项" class="textarea textareas"
							name="channelDesc" id="channelDesc_edit"
							style="width: 490px; resize: none;"></textarea>
					</dd>
				</dl>
				<dl>
					<dt>SEO标题</dt>
					<dd>
						<input onblur="_onBlurMaxLength(this, 100)" type="text"
							placeholder="Meta标题不超过100个字符" value="" name="seoTitle"
							id="seoTitle_edit" class="textl"> <a
							class="showTip_seoTitle" href="javascript:void(0);"><i
							class="icon icon-question"></i></a>
					</dd>
				</dl>
				<dl>
					<dt>SEO关键字</dt>
					<dd>
						<input onblur="_onBlurMaxLength(this, 50)" type="text"
							placeholder="Meta关键字不超过50个字符" value="" name="seoKeywords"
							id="seoKeywords_edit" class="textl"> <a
							class="showTip_seoKeywords" href="javascript:void(0);"><i
							class="icon icon-question"></i></a>
					</dd>
				</dl>
				<dl>
					<dt>SEO描述</dt>
					<dd>
						<textarea onblur="_onBlurMaxLength(this, 200)"
							placeholder="Meta描述不超过200个字符" class="textarea textareas"
							name="seoDescription" id="seoDescription_edit"
							style="width: 490px; resize: none;"></textarea>
					</dd>
				</dl>
			</form>
		</div>
		<div class="ft">
			<div class="submit ui-form-submit alert-comfrim">
				<a class="btnf-ui-m alert-comfrim-btnSure"
					href="javascript:void(0);" onclick="clickEditSaveBtn()" title="保存">保存</a>
				<a class="btng-ui-m alert-comfrim-btnCancle"
					href="javascript:uiAlertClose(&#39;#j_alert_EditChannelForm&#39;);"
					title="取消">取消</a>
			</div>
		</div>
	</div>

	<div class="ui-alert ui-alert-scroll-inner ui-alert-xl"
		id="j_alert_selectStand" style="display: none;">
		<div id="stand_inner"></div>
		<div style="display: none">
			<span id="stand_load"></span>
		</div>
	</div>

	<input type="hidden" id="stand_load_searchKeyId">
	<input type="hidden" id="stand_load_extParam1">
	<input type="hidden" id="stand_load_extParam2">
	<input type="hidden" id="stand_load_extParam3">
	<input type="hidden" id="stand_load_extParam4">
	<input type="hidden" id="stand_load_extParam5">

	<script type="text/javascript">
	var id_j_alert_selectStand = "";
	function popDiv_j_alert_selectStand(id){
	  id_j_alert_selectStand = id;
	  popData_j_alert_selectStand(0, 10, "");
	}
	function popData_j_alert_selectStand(pageIndex, pageSize, keyword) {
	  var keyword = encodeURIComponent(encodeURIComponent(keyword));
	  var url = "http://busi.niiker.com/business/cms/channel/searchPopCmsStandList?1=1" + "&pageIndex=" + pageIndex + "&pageSize=" + pageSize + "&keyword=" + keyword;
	  _UiLoading.load('请稍等...', function(){
	      loadurlCallback(url, "stand_load", "stand_inner", "popListCallBack_j_alert_selectStand");
   });
	}
function popListCallBack_j_alert_selectStand() {
		_UiLoading.close();
		uiAlert('#j_alert_selectStand');
}
</script>
	<script type="text/javascript">
function refresh_j_alert_selectStand(pageIndex, pageSize) {
	var keyword = jQuery("#keyword_j_alert_selectStand").val();
	popData_j_alert_selectStand(pageIndex, pageSize, keyword);
}
function select_j_alert_selectStand() {
	var pageSize = jQuery("#pageSize_j_alert_selectStand").val();
	refresh_j_alert_selectStand("0", pageSize);
}
	function onBlur_j_alert_selectStand(obj, pageIndex, allPage) {
		var pageIndexValue = obj.value;
		if(isNaN(pageIndexValue)) {
			_uiMini.alert("提示","请输入有效的页数。");
			reset_j_alert_selectStand(pageIndex);
		}else if(pageIndexValue <= 0) {
			_uiMini.alert("提示","请输入有效的页数。");
			reset_j_alert_selectStand(pageIndex);
		}else if(parseInt(pageIndexValue) >= 1 && parseInt(pageIndexValue) <= parseInt(allPage)) {
		}else{
			_uiMini.alert("提示","请输入有效的页数。");
			reset_j_alert_selectStand(pageIndex);
		}
	}
	function reset_j_alert_selectStand(pageIndex) {
		document.getElementById("pageIndex_j_alert_selectStand").value = (parseInt(pageIndex) + 1);
	}
	function go_j_alert_selectStand() {
		var pageIndex = jQuery("#pageIndex_j_alert_selectStand").val();
		pageIndex = (parseInt(pageIndex) - 1);
		refresh_j_alert_selectStand(pageIndex, pageSize);
	}
function clickBtn_j_alert_selectStand(flag, page, size, dis) {
	if("1" == flag) {
		refresh_j_alert_selectStand(page, size);
	}else{
		var message = "";
		if(dis=="1") {
			message = "第一页";
		}else{
			message = "最后一页";
		}
		_uiMini.alert('提示','已经'+message+'了。');
	}
}
</script>

	<input type="hidden" id="currentGroupId" value="">
	<input type="hidden" id="currentGroupBelongId" value="">
	<input type="hidden" id="currentGroupAliasId" value="">
	<form name="standForm" id="standForm"
		action="http://busi.niiker.com/business/cms/stand/list" method="post">
		<input type="hidden" name="_quickSearch" id="standAliasName_hidden">
	</form>


	<script src="../static/js/request_c.js"></script>
	<script src="../static/js/jquery-ui.min.js"></script>
	<script src="../static/js/ui-mini.js"></script>
	<div class="ui-loading" id="j_uiLoading">
		<div class="ui-loading-mask"></div>
		<div class="inner">
			<div class="msg">加载中...</div>
		</div>
	</div>
	<script src="../static/js/jquery.qtip-1.0.0-rc3.min.js"></script>
	<script src="../static/js/ajaxfileupload.js" type="text/javascript"></script>

	<script type="text/javascript">
  function onKeyDown(event){
     var e = event || window.event || arguments.callee.caller.arguments[0];
     if(e && e.keyCode==13){ // enter 键
    	  clickQuickSearch();	//调用方法搜索
     }
  }
</script>
	<script type="text/javascript">
	var _showTipObj = [
     	  {id:"showTip_channelAliasName", msg:"请填写频道别名，作为该频道专属类型中，唯一标识不能重复，必填项，建议填写英文并不超过50个字符。"},            
     	  {id:"showTip_channelAliasName_edit", msg:"显示该频道的别名，不能进行修改。"},            
     	  {id:"showTip_channelName", msg:"请填写频道名称，作为该频道的名称描述，必填项，建议填写中文并不超过50个字符。"},            
     	  {id:"showTip_channelBelong", msg:"请选择频道专属，指定该频道专属的存在类型，必选项，选择之后不能进行修改。"}, 
     	  {id:"showTip_channelLimit", msg:"请填写内容最多显示的条数，必填项，0表示不限制条数。"}, 
     	  {id:"showTip_channelBelong_edit", msg:"显示该频道的专属，不能进行修改。"},          
     	  {id:"showTip_seoTitle", msg:"请填写Meta的标题，作为SEO的标题信息，不超过100个字符。"},            
     	  {id:"showTip_seoKeywords", msg:"请填写Meta的关键字，作为SEO的关键字，不超过50个字符。"}        
    ];
	
	function onblurLimit(obj) {
		var val = $(obj).val();
		if(!_isEmpty(val, false)) {
			if(_regExpFunction.ispzNumber(val)) {
				$(obj).val(val);
			} else {
				$(obj).val("0");
			}
		}else{
			$(obj).val("0");
		}
	}
</script>
	<script type="text/javascript">
	function clickCheckAll(obj) {
	  	$("input[name='checkbox_sub']").attr("checked", obj.checked);
	  	$("#topCheckAll").attr("checked", obj.checked); 
	  	$("#bottomCheckAll").attr("checked", obj.checked); 
	}
	
	function clickCheckSub() {
	  	var checkbox_sub = $("input[name='checkbox_sub']");
	  	var selected = (checkbox_sub.length == $("input[name='checkbox_sub']:checked").length ? true : false);
	  	$("#topCheckAll").attr("checked", selected); 
	  	$("#bottomCheckAll").attr("checked", selected); 
	}
	
	function clickPopCheckAll(obj) {
	  	$("input[name='pop_checkbox_sub']").attr("checked", obj.checked);
	  	$("#popTopCheckAll").attr("checked", obj.checked); 
	}
	
	function clickPopCheckSub() {
	  	var pop_checkbox_sub = $("input[name='pop_checkbox_sub']");
	  	var selected = (pop_checkbox_sub.length == $("input[name='pop_checkbox_sub']:checked").length ? true : false);
	  	$("#popTopCheckAll").attr("checked", selected); 
	}
	
	function clickDataCheckAll(obj,id){
	  	$("input[name='data_checkbox_sub_"+id+"']").attr("checked", obj.checked);
	  	$("#topCheckAll_"+id).attr("checked", obj.checked); 
	}
	
	function clickDataCheckSub(id) {
	  	var checkbox_sub = $("input[name='data_checkbox_sub_"+id+"']");
	  	var selected = (checkbox_sub.length == $("input[name='data_checkbox_sub_"+id+"']:checked").length ? true : false);
	  	$("#topCheckAll_"+id).attr("checked", selected); 
	}
</script>
	<script type="text/javascript">
	function clickRefreshBtn() {
		window.location.href = "http://busi.niiker.com/business/cms/channel/list";
	}
	
	function chooseChannelBelongBtn(channelBelong, channelBelongName) {
		$("#channelBelong").val(channelBelong);
		$("#channelBelongName").val(channelBelongName);
		_refreshPageByCondition();
	}
	
	function chooseSortBtn(sort) {
		$("#sort").val(sort);
		_refreshPageByCondition();
	}
	
	function clickQuickSearch() {
		$("#_quickSearch").val($("#_quickSearch_").val());
		_refreshPageByCondition();
	}
</script>
	<script type="text/javascript">
	function clickAddBtn() {
		$("#channelAliasName_add").val("");
		$("#channelSubName_add").val("");
		$("#channelName_add").val("");
		$("#channelDesc_add").val("");
		$("#channelBelong_add").val("1");
		$("#channelLimit_add").val("0");
		$("#seoTitle_add").val("");
		$("#seoKeywords_add").val("");
		$("#seoDescription_add").val("");
		resetPropertiesUploadImage_add();
		uiAlert('#j_alert_AddChannelForm');
	}
	
	function clickAddSaveBtn(){
		var _checkObj = [
	   		{id:"channelAliasName_add", msg:"频道别名不能为空，请重新输入。"},
	   		{id:"channelName_add", msg:"频道名称不能为空，请重新输入。"},
	   		{id:"channelDesc_add", msg:"频道描述不能为空，请重新输入。"},
	   		{id:"channelBelong_add", msg:"频道专属不能为空，请重新选择。"}
	    ];
		if(_checkFormEmpty("消息提醒", _checkObj)) {
			_uiMini.confrim('消息提醒','是否确认新增该频道信息？',function(){
				_UiLoading.load('正在保存中，请稍等...', function(){}, function() {
				    $.ajax({
					      type: "POST",
					      url: "http://busi.niiker.com/business/cms/channel/add",
					      data: $('#addChannelForm').serialize(),
					      error: function(request) {
					        _UiLoading.close();
					        _uiMini.alert('消息提醒','保存该频道信息失败，请重新输入。');
					      },
					      success: function(data) {
					    	_UiLoading.close();
					        if("0" == data) {
					          	_uiMini.alert('消息提醒','保存该频道信息成功。',function() {
					          		clickRefreshBtn();
					          	});
					        }else if("2" == data){
					          	_uiMini.alert('消息提醒','该频道专属类型中已存在相同的频道别名，请重新输入。', function() {
					          		$("#channelAliasName_add").focus();
					          	});
					        }else{
					          	_uiMini.alert('消息提醒','保存该频道信息失败，请重新输入。');
					        }
					      }
				    });
				});
			});
		}
	}
	
	function clickEditBtn(channelId) {
		if(!_isEmpty(channelId, false)) {
			resetPropertiesUploadImage_edit();
			$("#channelName_edit").val("");
			$("#channelSubName_edit").val("");
			$("#channelDesc_edit").val("");
			$("#seoTitle_edit").val("");
			$("#seoKeywords_edit").val("");
			$("#seoDescription_edit").val("");
			$("#id_edit").val(channelId);
			$("#channelAliasName_hidden_edit").val("");
			resetPropertiesUploadImage_edit();
			$.ajax({
			      type: "POST",
			      url: "http://busi.niiker.com/business/cms/channel/detail",
			      data:{"id" : channelId},
			      error: function(request) {
			    	  _uiMini.alert('消息提醒','获取该频道信息失败。');
			      },
			      success: function(data) {
			          if(!_isEmpty(data, false)) {
			            var obj = eval("("+data+")");
			            $("#channelAliasName_hidden_edit").val(obj.channelAliasName);
			            $("#channelAliasName_edit").html(obj.channelAliasName);
			            $("#channelName_edit").val(obj.channelName);
			            $("#channelSubName_edit").val(obj.channelSubName);
			            $("#channelDesc_edit").val(obj.channelDesc);
			            var channelBelong = obj.channelBelong;
			            var channelBelongName = "";
			            if(!_isEmpty(channelBelong, false)) {
			            	if("1"==channelBelong) {
			            		channelBelongName = "前端网站";
			            	}else if("2"==channelBelong) {
			            		channelBelongName = "触屏网站";
			            	}
			            }
			            $("#channelBelong_edit").html(channelBelongName);
			            $("#seoTitle_edit").val(obj.seoTitle);
			            $("#seoKeywords_edit").val(obj.seoKeywords);
			            $("#seoDescription_edit").val(obj.seoDescription);
			            var channelLogo = obj.channelLogo;
		  	  			if(!_isEmpty(channelLogo, false)) {
		  	  		      	var fileUrl = obj.channelLogo_url;
		  	  		      	var data = {"fileState":"0", "fileName":channelLogo, "fileUrl":fileUrl};
		  	  		    	_uploadFileAfter_properties_edit(data);
		  	  	  		}
		  	  			
		  			  	uiAlert('#j_alert_EditChannelForm');
			          }else{
			        	  _uiMini.alert('消息提醒','获取该频道信息失败。');
			          }
			      }
			    });
		} else {
			_uiMini.alert('消息提醒','请选择需要修改的频道。');
		}
	}
	
	function clickEditSaveBtn(){
		var _checkObj = [
	   		{id:"channelName_edit", msg:"频道名称不能为空，请重新输入。"},
	   		{id:"channelDesc_edit", msg:"频道描述不能为空，请重新输入。"}
	    ];
		if(_checkFormEmpty("消息提醒", _checkObj)) {
		  	_uiMini.confrim('消息提醒','是否确认修改该频道信息？',function() {
		  		_UiLoading.load('正在修改中，请稍等...', function(){}, function() {
				    $.ajax({
				      	type: "POST",
				      	url: "http://busi.niiker.com/business/cms/channel/update",
				      	data:$('#editChannelForm').serialize(),
				      	error: function(request) {
				      		_UiLoading.close();
				        	_uiMini.alert('消息提醒','修改该频道信息失败，请重新输入。');
				      	},
				      	success: function(data) {
				      		_UiLoading.close();
				        	if("0" == data) {
				          		_uiMini.alert('消息提醒','修改该频道信息成功。',function() {
				        	  		_refreshPageByCurrent();
				          		});
				        	}else{
				          		_uiMini.alert('消息提醒','修改该频道信息失败，请重新输入。');
				        	}
				      	}
				    });
		  		});
		  	});
		}
	}
	
	function clickDeleteBtn(channelId, channelAliasName){
		if(!_isEmpty(channelId, false) && !_isEmpty(channelAliasName, false)) {
			deleteChannelData(channelId, channelAliasName);
		} else {
			_uiMini.alert('消息提醒',"请选择需要删除的频道信息。");
		}
	}
	
	function clickBatchDeleteBtn(){
	  	var checkBox_sub = $("input[name='checkbox_sub']:checked");
	  	if(checkBox_sub.length <= 0 && !_isEmpty(checkBox_sub, false)){
	    	_uiMini.alert('消息提醒',"请选择需要删除的频道信息。");
	  	}else{
	    	var item_ids = "";
	    	var item_alias = "";
	    	checkBox_sub.each(function(){
		      	var item = $(this).val();
		      	var items = item.split("$_$");
		      	var item_id = items[0];
		      	var item_alia = items[1];
		      	item_ids = item_ids + (_isEmpty(item_ids, false) ? "" : ",") + item_id;
		      	item_alias = item_alias + (_isEmpty(item_alias, false) ? "" : ",") + item_alia;
		    });
	    	deleteChannelData(item_ids, item_alias);
	  	}
	}
	
	function deleteChannelData(ids, channelAliasNames){
		if(!_isEmpty(ids, false) && !_isEmpty(channelAliasNames, false)) {
			_uiMini.confrim('消息提醒','是否确定删除频道信息，此操作不可逆?',function(){
				_UiLoading.load('正在删除中，请稍等...', function(){}, function() {
					$.ajax({
						type: "POST",
					    url: "http://busi.niiker.com/business/cms/channel/del",
					    data: {ids:ids, channelAliasNames:channelAliasNames},
					    error: function(request) {
					    	_UiLoading.close();
					        _uiMini.alert('消息提醒','删除频道信息失败，请重新操作。');
					    },
					    success: function(data) {
					    	_UiLoading.close();
					    	if("0" == data) {
					    		_uiMini.alert('消息提醒','删除频道信息成功。',function() {
						        	 _refreshPageByCurrent();
						        });
					    	} else {
					    		_uiMini.alert('消息提醒','删除频道信息失败，请重新操作。');
					    	}
					    }
					});
				});
		  	});
		} else {
			_uiMini.alert('消息提醒',"请选择需要删除的频道信息。");
		}
	}
	
	function clickStandDataSearch(standAliasName) {
		if(!_isEmpty(standAliasName, false)) {
			$("#standAliasName_hidden").val(standAliasName);
			$("#standForm").submit();
		} else {
			_uiMini.alert('消息提醒','请选择需要查看的展位信息。');
		}
	}
</script>
	<script type="text/javascript">
	function toggleFormMore(elem, target){
	    var elem = $(elem),
	        tr = elem.closest('.tr-hd'),
	        data = elem.attr('data-class'),
	        target = tr.next('.tr-bd').find(data),
	        isTargetVisible = target.is(':visible');
	    $('.btnf-showMore').not(elem).removeClass('on');
	    tr.siblings('.tr-hd.on').removeClass('on');
	    tr.next('.tr-bd').siblings('.tr-bd').addClass('tr-hidden');
	    tr.next('.tr-bd').find(target).show().siblings('.product-detail').hide();
	    if(!tr.hasClass('on') || isTargetVisible){
	        tr.toggleClass('on').next('.tr-bd').toggleClass('tr-hidden');
	    }
	}
	
	function showBindingList(obj, channelId, channelBelong, channelAliasName){
		$("#currentGroupId").val("");
	  	$("#currentGroupBelongId").val("");
	  	$("#currentGroupAliasId").val("");
		$("#stand_load_searchKeyId").val(channelId);
		$("#stand_load_extParam1").val(channelBelong);
	  	toggleFormMore(obj, '.product-pricing');
	  	$("#currentGroupId").val(channelId);
	  	$("#currentGroupBelongId").val(channelBelong);
		$("#currentGroupAliasId").val(channelAliasName);
	  	$("#topCheckAll_"+channelId).attr("checked", false);
	  	_UiLoading.load('正在加载中，请稍等...',function(){},function() {
		    $.ajax({
		      	type: "POST",
		      	url: "http://busi.niiker.com/business/cms/channel/getCmsChannelStandRelByParam",
		      	data:{channelId:channelId},
		      	dataType:'json',
		      	error: function(request) {
		      		_UiLoading.close();
		        	_uiMini.alert('消息提醒','加载数据失败，请重新操作。');
		      	},
		      	success: function(data) {
		        	_UiLoading.close();
		        	var dataList = data.dataList;
		        	var tbody = $("#dataListBody_"+channelId);
		        	tbody.text("");
		        	if(!_isEmpty(dataList, false) && dataList.length > 0){
		          		for(var i = 0;i<dataList.length;i++){
		            		var tr = $("<tr id=\"dataListTr_"+dataList[i].id+"\"></tr>")
		            		tr.appendTo(tbody);
		            		var td1 = $("<td><span>" + (i+1) + "</span></td>")
		            		td1.appendTo(tr);
		            		var td2 = $("<td><span><input type=\"checkbox\" class=\"checkbox\" name=\"data_checkbox_sub_"+channelId+"\" onclick=\"clickDataCheckSub("+channelId+")\" value=\""+dataList[i].id+"\" /></span></td>")
		            		td2.appendTo(tr);
		            		var td3 = $("<td><p class='td-nowrap' title='"+(_isEmpty(dataList[i].standAliasName, false) ? "" : dataList[i].standAliasName)+"'><a class='blue' href='javascript:void(0);' onclick=\"clickStandDataSearch('"+(_isEmpty(dataList[i].standAliasName, false) ? "" : dataList[i].standAliasName)+"')\"  >"+(_isEmpty(dataList[i].standAliasName, false) ? "" : dataList[i].standAliasName)+"</a></p></td>")
		            		td3.appendTo(tr);
		            		var td4 = $("<td><p class='td-nowrap' title='"+(_isEmpty(dataList[i].standName, false) ? "" : dataList[i].standName)+"'>"+(_isEmpty(dataList[i].standName, false) ? "" : dataList[i].standName)+"</p></td>")
		            		td4.appendTo(tr);
		            		var td5 = $("<td><p class='td-nowrap' title='"+(_isEmpty(dataList[i].standCategoryName, false) ? "" : dataList[i].standCategoryName)+"'>"+(_isEmpty(dataList[i].standCategoryName, false) ? "" : dataList[i].standCategoryName)+"</p></td>");
		            		td5.appendTo(tr);
		            		var td6 = $("<td><p class='td-nowrap' title='"+(_isEmpty(dataList[i].standTypeName, false) ? "" : dataList[i].standTypeName)+"'>"+(_isEmpty(dataList[i].standTypeName, false) ? "" : dataList[i].standTypeName)+"</p></td>");
		            		td6.appendTo(tr);
		            		var td7 = $("<td><p class='td-nowrap'>"+(_isEmpty(dataList[i].standLimitName, false) ? "" : dataList[i].standLimitName)+"</p></td>");
		            		td7.appendTo(tr);
		            		var td8 = $("<td><p class='td-nowrap' title='"+(_isEmpty(dataList[i].standDesc, false) ? "" : dataList[i].standDesc)+"'>"+(_isEmpty(dataList[i].standDesc, false) ? "" : dataList[i].standDesc)+"</p></td>")
		            		td8.appendTo(tr);
		          		}
		        	}
		      	}
		    });
	  	});
	}
</script>
	<script type="text/javascript">
	function saveForm(){
	  	var checkBox_sub = $("input[name='pop_checkbox_sub']:checked");
	    var item_ids = "";
	    checkBox_sub.each(function(){
	      	var item_id = $(this).val();
	      	item_ids = item_ids + (_isEmpty(item_ids, false) ? "" : ",") + item_id;
	    });
	    var channelId = $("#currentGroupId").val();
	    var channelBelong = $("#currentGroupBelongId").val();
	    var channelAlias = $("#currentGroupAliasId").val();
	    if(_isEmpty(channelId, false)) {
	    	_uiMini.alert('消息提醒','请选择需要进行绑定的频道信息。');
	    	return;
	    } 
	    if(_isEmpty(item_ids, false)) {
	    	_uiMini.alert('消息提醒','请选择需要绑定的展位信息。');
	    	return;
	    }
	    _UiLoading.load('正在绑定中，请稍等...',function(){},function() {
	      	$.ajax({
	        	type: "POST",
	        	url: "http://busi.niiker.com/business/cms/channel/bind",
	        	data: {ids:item_ids, channelId:channelId, channelAlias:channelAlias},
	        	error: function(request) {
	        		_UiLoading.close();
	          		_uiMini.alert('消息提醒','绑定展位信息失败，请重新操作。');
	        	},
	        	success: function(data) {
	          		_UiLoading.close();
	          		if("0" == data) {
	            		_uiMini.alert('消息提醒','绑定操作成功。', function() {
	            			showBindingList(null, channelId, channelBelong, channelAlias);
	            		});
	          		}else{
	          			_uiMini.alert('消息提醒','绑定展位信息失败，请重新操作。');
	          		}
	        	}
	      	});
	    });
	}
	
	function batchDeleteChannelStandRel(channelId, channelAliasName) {
	  	var data_checkBox_sub = $("input[name='data_checkbox_sub_"+channelId+"']:checked");
	  	if(data_checkBox_sub.length <= 0 && !_isEmpty(channelId, false)){
	    	_uiMini.alert('消息提醒',"请选择需要删除的展位信息。");
	  	}else{
	    	var item_ids = "";
	    	data_checkBox_sub.each(function(){
	      		var item_id = $(this).val();
	      		item_ids = item_ids + (_isEmpty(item_ids, false) ? "" : ",") + item_id;
	    	});
	    	_uiMini.confrim('消息提醒','是否确定删除已选的展位信息？', function(){
	    		_UiLoading.load('正在删除中，请稍等...',function(){},function(){
	    		    $.ajax({
	    		      	type: "POST",
	    		      	url: "http://busi.niiker.com/business/cms/channel/bindDel",
	    		      	data:{ids:item_ids,channelId:channelId,channelAliasName:channelAliasName},
	    		      	error: function(request) {
	    		      		_UiLoading.close();
	    		        	_uiMini.alert('消息提醒','删除绑定的展位信息失败，请重新操作。');
	    		      	},
	    		      	success: function(data) {
	    		      		_UiLoading.close();
	    		        	if("0" == data) {
	    		          		_uiMini.alert('消息提醒','删除绑定的展位信息成功。',function() {
	    		        	  		var channelId = $("#currentGroupId").val();
	    		        	  		var channelBelong = $("#currentGroupBelongId").val();
	    		        	  		var channelAlias = $("#currentGroupAliasId").val();
	    		        	  		showBindingList(null, channelId, channelBelong, channelAlias);
	    		          		});
	    		        	}else{
	    		        		_uiMini.alert('消息提醒','删除绑定的展位信息失败，请重新操作。');
	    		        	}
	    		      	}
	    		    });
	    	  	});
	    	});
	  	}
	}
	
	function upload_uploadFile_properties_add(obj) {
	    var uploadDiv = $("#uploadDiv_properties_add");
	    var uploadLoading = $("#uploadLoading_properties_add");
	    var uploadLi = $("#uploadLi_properties_add");
	    uploadLi.addClass("item-loading");
	    uploadDiv.hide();
	    uploadLoading.show();
	    var paramo = {"bid":"1", "upload_type":"channelLogo", "file_size":"2", "file_type":"jpg,jpeg,png,bmp,gif"};
	    _uploadFile(obj, paramo, "_uploadFileAfter_properties_add");
	}

	function _uploadFileAfter_properties_add(data) {
	    if("0"==data.fileState) {
	      var fileName = data.fileName;
	      var fileUrl = data.fileUrl;
	      var uploadLi_properties = jQuery("#uploadLi_properties_add");
	      uploadLi_properties.removeClass("item-loading");
	      uploadLi_properties.addClass("item-loaded");
	      var s = '<div class="ui-uploadGroup-img">\n';
	      s = s + '<a href="'+fileUrl+'" target="_blank"><img src="'+fileUrl+'" width="26" height="23" alt="" /></a>\n';
	      s = s + '</div>\n';
	      s = s + '<a class="ui-uploadGroup-deleteItem" href="javascript:void(0);" title="删除" onclick="delete_uploadFile_properties_add()"><i class="icon-delete"></i></a>';
	      uploadLi_properties.html("");
	      uploadLi_properties.html(s);
	      jQuery("#channelLogo_add").val(fileName);
	    }else{
	      _uiMini.alert("频道管理", data.fileMessage);
	      resetPropertiesUploadImage_add();
	    }
	}

	function delete_uploadFile_properties_add() {
	    var fileName = $("#channelLogo_add").val();
	    var paramo = {"bid":"1", "upload_type":"channelLogo", "file_name":fileName};
	    _deleteFile(paramo, "_deleteFileAfter_properties_add");
	}

	function _deleteFileAfter_properties_add() {
		  resetPropertiesUploadImage_add();
	}
	
	//还原编辑层图片上传的初始化样式
	function resetPropertiesUploadImage_add() {
		jQuery("#channelLogo_add").val("");
	  	var uploadLi_properties = jQuery("#uploadLi_properties_add");
	    uploadLi_properties.removeClass("item-loaded");
	    var s = '<div id="uploadDiv_properties_add" class="ui-uploadGroup-img">\n';
	    s = s + '<a id="uploadA_properties_add" class="file btng-ui-m" href="javascript:void(0);">\n';
	    s = s + '<span>+</span>\n';
	    s = s + '<input class="filePrew" type="file" id="filedField_properties_add" name="filedField_properties_add" size="3" onchange="upload_uploadFile_properties_add(this)">\n';
	    s = s + '</a>\n';
	    s = s + '</div>\n';
	    s = s + '<div id="uploadLoading_properties_add" style="display: none;" class="ui-uploadGroup-img"></div>\n';
	    uploadLi_properties.html("");
	    uploadLi_properties.html(s);
	}
	
	function upload_uploadFile_properties_edit(obj) {
	    //修改样式.
	    var uploadDiv = $("#uploadDiv_properties_edit");
	    var uploadLoading = $("#uploadLoading_properties_edit");
	    var uploadLi = $("#uploadLi_properties_edit");
	    uploadLi.addClass("item-loading");
	    uploadDiv.hide();
	    uploadLoading.show();
	    var paramo = {"bid":"1", "upload_type":"channelLogo", "file_size":"2", "file_type":"jpg,jpeg,png,bmp,gif"};
	    _uploadFile(obj, paramo, "_uploadFileAfter_properties_edit");
	}

	function _uploadFileAfter_properties_edit(data) {
	    if("0"==data.fileState) {
	      var fileName = data.fileName;
	      var fileUrl = data.fileUrl;
	      var uploadLi_properties = jQuery("#uploadLi_properties_edit");
	      uploadLi_properties.removeClass("item-loading");
	      uploadLi_properties.addClass("item-loaded");
	      var s = '<div class="ui-uploadGroup-img">\n';
	      s = s + '<a href="'+fileUrl+'" target="_blank"><img src="'+fileUrl+'" width="26" height="23" alt="" /></a>\n';
	      s = s + '</div>\n';
	      s = s + '<a class="ui-uploadGroup-deleteItem" href="javascript:void(0);" title="删除" onclick="delete_uploadFile_properties_edit()"><i class="icon-delete"></i></a>';
	      uploadLi_properties.html("");
	      uploadLi_properties.html(s);
	      jQuery("#channelLogo_edit").val(fileName);
	    }else{
	      _uiMini.alert("频道管理", data.fileMessage);
	      resetPropertiesUploadImage_edit();
	    }
	}

	function delete_uploadFile_properties_edit() {
	    var fileName = $("#channelLogo_edit").val();
	    var paramo = {"bid":"1", "upload_type":"channelLogo", "file_name":fileName};
	    _deleteFile(paramo, "_deleteFileAfter_properties_edit");
	}

	function _deleteFileAfter_properties_edit() {
		resetPropertiesUploadImage_edit();
	}
	
	//还原编辑层图片上传的初始化样式
	function resetPropertiesUploadImage_edit() {
		jQuery("#channelLogo_edit").val("");
	  	var uploadLi_properties = jQuery("#uploadLi_properties_edit");
	    uploadLi_properties.removeClass("item-loaded");
	    var s = '<div id="uploadDiv_properties_edit" class="ui-uploadGroup-img">\n';
	    s = s + '<a id="uploadA_properties_edit" class="file btng-ui-m" href="javascript:void(0);">\n';
	    s = s + '<span>+</span>\n';
	    s = s + '<input class="filePrew" type="file" id="filedField_properties_edit" name="filedField_properties_edit" size="3" onchange="upload_uploadFile_properties_edit(this)">\n';
	    s = s + '</a>\n';
	    s = s + '</div>\n';
	    s = s + '<div id="uploadLoading_properties_edit" style="display: none;" class="ui-uploadGroup-img"></div>\n';
	    uploadLi_properties.html("");
	    uploadLi_properties.html(s);
	}
</script>
</body>
</html>