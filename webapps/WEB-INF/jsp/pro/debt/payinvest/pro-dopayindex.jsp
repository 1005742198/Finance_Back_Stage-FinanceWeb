<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 本息兑付首页 -->
<div class="bjui-pageContent" id="pro-dopayindex">
        <div style="margin:0px auto 0; width:100%;">
                <!-- Tabs -->
                <ul class="nav nav-tabs" role="tablist">
                	<c:choose>
	                	<c:when test="${powerlist.contains('/debt/proclaims/payinvest/to-audit.do') && not empty projectMoneyApply && projectMoneyApply.applyStatus == 1 }">
	                		<li <c:if test="${search.index == 1}">class="active"</c:if>><a href="#payinvest" role="tab" data-toggle="tab">确认兑付划款</a></li>
	                		<li <c:if test="${search.index == 2}">class="active"</c:if>><a href="#paydetail" role="tab" data-toggle="tab">本期兑付明细</a></li>
	                	</c:when>
	                	<c:when test="${powerlist.contains('/debt/proclaims/payinvest/to-apply.do') }">
	                		<li <c:if test="${search.index == 1}">class="active"</c:if>><a href="#payinvest" role="tab" data-toggle="tab">申请兑付划款</a></li>
	                		<li <c:if test="${search.index == 2}">class="active"</c:if>><a href="#paydetail" role="tab" data-toggle="tab">本期兑付明细</a></li>
	                	</c:when>
	                	<c:otherwise>
							<li class="active"><a href="#paydetail" role="tab" data-toggle="tab">本期兑付明细</a></li>	                	
	                	</c:otherwise>
	                </c:choose>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                <c:choose>
                	<c:when test="${powerlist.contains('/debt/proclaims/payinvest/to-audit.do') && not empty projectMoneyApply && projectMoneyApply.applyStatus == 1}">
	                    <div class="tab-pane fade <c:if test="${search.index == 1}">active in</c:if>" id="payinvest">
	                    	<%@ include file="/WEB-INF/jsp/pro/debt/payinvest/pro-auditpayinvest.jsp" %>
	                    </div>
	                    <div class="tab-pane fade bjui-layout <c:if test="${search.index == 2}">active in</c:if>" id="paydetail">
	                    	<%@ include file="/WEB-INF/jsp/pro/debt/payinvest/pro-payinvestdetail.jsp" %>
	                    </div>
                    </c:when>
                    <c:when test="${powerlist.contains('/debt/proclaims/payinvest/to-apply.do')}">
	                    <div class="tab-pane fade <c:if test="${search.index == 1}">active in</c:if>" id="payinvest">
	                    	<%@ include file="/WEB-INF/jsp/pro/debt/payinvest/pro-applypayinvest.jsp" %>
	                    </div>
	                    <div class="tab-pane fade bjui-layout <c:if test="${search.index == 2}">active in</c:if>" id="paydetail">
	                    	<%@ include file="/WEB-INF/jsp/pro/debt/payinvest/pro-payinvestdetail.jsp" %>
	                    </div>
                    </c:when>
                    <c:otherwise>
	                    <div class="tab-pane fade bjui-layout active in" id="paydetail">
	                    	<%@ include file="/WEB-INF/jsp/pro/debt/payinvest/pro-payinvestdetail.jsp" %>
	                    </div>
                    </c:otherwise>
                  </c:choose>
                </div>
        </div>
</div>