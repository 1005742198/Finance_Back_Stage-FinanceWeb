<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 退款首页 -->
<div class="bjui-pageContent" id="pro-backindex">
        <div style="margin:0px auto 0; width:100%;">
                <!-- Tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li class="active"><a href="#backmoney" role="tab" data-toggle="tab">退款确认</a></li>
                    <li ><a href="<%=request.getContextPath()%>/debt/proissue/settle/pro-drawbacklist.do?projectId=${project.id }&cfmId=${cfmRight.id}" 
                    	role="tab" data-toggle="ajaxtab" data-target="#backlist" data-reload="false">退款明细</a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div class="tab-pane fade active in" id="backmoney">
                    	<%@ include file="/WEB-INF/jsp/pro/debt/settle/pro-dodrawback.jsp" %>
                    </div>
                  <div class="tab-pane fade" id="backlist" data-toggle="autoajaxload" data-url="<%=request.getContextPath()%>/debt/proissue/settle/pro-drawbacklist.do?projectId=${project.id }&cfmId=${cfmRight.id}" ></div>
                </div>
        </div>
</div>