<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 线下还款 -->
<div class="bjui-pageContent">
                <!-- Tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li class="active"><a href="#payoffline" role="tab" data-toggle="tab">线下还款</a></li>
                    <!--  
                   <li><a href="<%=request.getContextPath()%>/incomeright/proclaims/repay/payrepay-list.do?repayId=${obj.id}" 
                    	role="tab" data-toggle="ajaxtab" data-target="#paylist" data-reload="false">划付明细</a></li>
                	-->
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div class="tab-pane fade active in" id="payoffline">
                    	<%@ include file="/WEB-INF/jsp/pro/incomeright/repay/repayoffline-cfm.jsp" %>
                    </div>
                     <!--  
                    <div class="tab-pane fade bjui-layout" id="paylist" data-toggle="autoajaxload"
                    	data-url="<%=request.getContextPath()%>/incomeright/proclaims/repay/payrepay-list.do?repayId=${obj.id}"></div>
                    	-->
                </div>
</div>
