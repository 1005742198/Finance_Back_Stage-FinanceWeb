<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 项目信息 -->
<div class="bjui-pageContent">
        <div style="margin:0px auto 0; width:100%;">
                <!-- Tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li class="active"><a href="#baseinfo" role="tab" data-toggle="tab">项目信息</a></li>
                    <li ><a href="<%=request.getContextPath()%>/debt/proissue/profiles/view.do?projectId=${obj.id}&infoType=1&belongType=1" 
                    	role="tab" data-toggle="ajaxtab" data-target="#bankinfo" data-reload="false">见证信息</a></li>
                    <li><a href="<%=request.getContextPath()%>/debt/proissue/profiles/view.do?projectId=${obj.id}&infoType=2&belongType=1" 
                    	role="tab" data-toggle="ajaxtab" data-target="#pledge" data-reload="false">质押信息</a></li>
                    <li><a href="<%=request.getContextPath()%>/debt/proissue/profiles/view.do?projectId=${obj.id}&infoType=3&belongType=1" 
                    	role="tab" data-toggle="ajaxtab" data-target="#otherfiles" data-reload="false">其他附件</a></li>
            	<li><a href="<%=request.getContextPath()%>/debt/proissue/proinfo/feedlist.do?projectId=${obj.id}&belongType=1" 
			                    	role="tab" data-toggle="ajaxtab" data-target="#feedlist" data-reload="false">项目动态</a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div class="tab-pane fade active in" id="baseinfo">
                    	<%@ include file="/WEB-INF/jsp/pro/debt/recordinfo/proinfo-base.jsp" %>
                    </div>
                    <div class="tab-pane fade" id="bankinfo"></div>
                    <div class="tab-pane fade" id="pledge"></div>
                    <div class="tab-pane fade" id="otherfiles"></div>
                    <div class="tab-pane fade bjui-layout" id="feedlist"></div>
                </div>
        </div>
</div>

<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">关闭</button></li>
    </ul>
</div>