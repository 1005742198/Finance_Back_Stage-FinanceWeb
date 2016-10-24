<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 项目信息 -->
<div class="bjui-pageContent">
        <div style="margin:0px auto 0; width:100%;">
                <!-- Tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li class="active"><a href="#baseinfo" role="tab" data-toggle="tab">核保审核</a></li>
                    <li ><a href="<%=request.getContextPath()%>/fasset/orderapply/bidlist.do?projectId=${project.id}" 
                    	role="tab" data-toggle="ajaxtab" data-target="#orderapply" data-reload="false">报价明细</a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div class="tab-pane fade active in" id="baseinfo">
                    	<c:choose>
                    	<c:when test="${project.getTransferType() == 1 }">
                    	<%@ include file="/WEB-INF/jsp/pro/fasset/cfmright/pro-docfmright-split.jsp" %>
                    	</c:when>
                    	<c:otherwise>
                    	<%@ include file="/WEB-INF/jsp/pro/fasset/cfmright/pro-docfmright.jsp" %>
                    	</c:otherwise>
                    	</c:choose>
                    </div>
                    <div class="tab-pane fade bjui-layout" id="orderapply" data-toggle="autoajaxload"
							data-url="<%=request.getContextPath()%>/fasset/orderapply/bidlist.do?projectId=${project.id}"></div>
                </div>
        </div>
</div>

<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">关闭</button></li>
    </ul>
</div>