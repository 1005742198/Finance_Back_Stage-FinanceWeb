<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--[if lte IE 7]>
    <div id="errorie"><div>您还在使用老掉牙的IE，正常使用系统前请升级您的浏览器到 IE8以上版本 <a target="_blank" href="javascript:;">点击升级</a>&nbsp;&nbsp;强烈建议您更改换浏览器：<a href="javascript:;" target="_blank">谷歌 Chrome</a></div></div>
<![endif]-->
<header id="bjui-header">
    <div class="bjui-navbar-header">
        <button type="button" class="bjui-navbar-toggle btn-default" data-toggle="collapse" data-target="#bjui-navbar-collapse">
            <i class="fa fa-bars"></i>
        </button>
        <!--
        <a class="bjui-navbar-logo" href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/App/OA/Public/Img/logo.png"></a>
          -->
        <h3 class="bjui-navbar-tit">${exchange.ptomsSysName }——${exchange.simpleName }</h3>
    
    </div>
    <nav id="bjui-navbar-collapse">
        <ul class="bjui-navbar-right">
            <li class="datetime"><div><span id="bjui-date"></span> <span id="bjui-clock"></span></div></li>
            <!-- <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">切换系统 <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="javascript:;" target="_blank"><i class="fa fa-flag"></i>交易所网站</a></li>
                    <li class="divider"></li>
                    <li><a href="/ewsdOA"><i class="fa fa-flag"></i>交易所运营平台</a></li>
                    <li class="divider"></li>
                </ul>
            </li> -->
            <li><a href="<%=request.getContextPath()%>/message/getusermsgs.do" 
    				data-toggle="navtab" data-id="message" data-title="消息" data-fresh=true >消息 <span class="badge" id="unReadCount"></span></a></li>
            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">我的账户 <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="<%=request.getContextPath() %>/toModifyPwd.do" data-toggle="dialog" data-id="changepwd_page" data-mask="true" data-width="550" data-height="300">&nbsp;<span class="fa fa-lock"></span> 修改密码</a></li>
                    <li><a href="<%=request.getContextPath() %>/myinfo.do" data-toggle="dialog" data-id="changepwd_page" data-mask="true" data-width="600" data-height="500">&nbsp;<span class="fa fa-user"></span> 我的资料</a></li>
                    <!--li><a href="{:U('Admin/Index/cache')}" data-toggle="navtab">&nbsp;<span class="fa fa-trash"></span> 清理缓存</a></li-->
                    <li class="divider"></li>
                    <li><a href="<%=request.getContextPath() %>/logout.do" class="red">&nbsp;<span class="fa fa-power-off"></span>退出系统</a></li>
                </ul>
            </li>
            <!-- <li class="dropdown"><a href="#" class="dropdown-toggle theme purple" data-toggle="dropdown"><i class="fa fa-tree"></i></a>
                <ul class="dropdown-menu" role="menu" id="bjui-themes">
                    <li><a href="javascript:;" class="theme_default" data-toggle="theme" data-theme="default">&nbsp;<i class="fa fa-tree"></i> 黑白分明&nbsp;&nbsp;</a></li>
                    <li><a href="javascript:;" class="theme_orange" data-toggle="theme" data-theme="orange">&nbsp;<i class="fa fa-tree"></i> 橘子红了</a></li>
                    <li class="active"><a href="javascript:;" class="theme_purple" data-toggle="theme" data-theme="purple">&nbsp;<i class="fa fa-tree"></i> 紫罗兰</a></li>
                    <li><a href="javascript:;" class="theme_blue" data-toggle="theme" data-theme="blue">&nbsp;<i class="fa fa-tree"></i> 青出于蓝</a></li>
                    <li><a href="javascript:;" class="theme_red" data-toggle="theme" data-theme="red">&nbsp;<i class="fa fa-tree"></i> 红红火火</a></li>
                    <li><a href="javascript:;" class="theme_green" data-toggle="theme" data-theme="green">&nbsp;<i class="fa fa-tree"></i> 绿草如茵</a></li>
                </ul>
            </li> -->
        </ul>
    </nav>
</header>
<script type="text/javascript">
$(function(){
	$.ajax({
				type:"POST",
				async: true,
				url:'<%=request.getContextPath()%>/message/getunreadcount.do',
				success:function(data){
					if(data.unReadCount !=0)
						if(data.unReadCount !=0) $("#unReadCount").show().html(data.unReadCount);
						else $("#unReadCount").hide();
				}	
			});
});
</script>