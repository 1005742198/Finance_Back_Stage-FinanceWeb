<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 项目信息 -->
<div class="bjui-pageContent">
        <div style="margin:0px auto 0; width:100%;">
                <!-- Tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li class="active"><a href="#baseinfo" role="tab" data-toggle="tab">核保审核</a></li>
                    <li ><a href="<%=request.getContextPath()%>/debt/orderapply/list.do?projectId=${cfmRight.projectId}" 
                    	role="tab" data-toggle="ajaxtab" data-target="#orderapply" data-reload="false">认购明细</a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div class="tab-pane fade active in" id="baseinfo">
                    	<%@ include file="/WEB-INF/jsp/pro/debt/cfmright/pro-docfmright.jsp" %>
                    </div>
                    <div class="tab-pane fade bjui-layout" id="orderapply" data-toggle="autoajaxload"
							data-url="<%=request.getContextPath()%>/debt/orderapply/list.do?projectId=${cfmRight.projectId}"></div>
                </div>
        </div>
</div>

<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">关闭</button></li>
    </ul>
</div>