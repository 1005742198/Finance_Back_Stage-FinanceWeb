<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 金融资产转让结算 -->
<div class="bjui-pageContent">
	<div class="container-fluid">
		<div class="row bottom-part">
			<div class="col-md-12">	
                <!-- Tabs -->
                <ul class="nav nav-tabs" role="tablist">
                	<c:if test="${project.isCfmrightinfo() }">
                 		<li class="active"><a href="#cfmrightsummary" role="tab" data-toggle="tab">核保概要</a></li>
                 	</c:if>
                 	<c:if test="${project.isNotReleaseMoney() }">
	                <c:choose>
	                	<c:when test="${powerlist.contains('/fasset/proissue/settle/to-releaseaudit.do') && not empty projectMoneyApply && projectMoneyApply.applyStatus == 1 }">
	                		<li <c:if test="${!project.isCfmrightinfo() }">class="active"</c:if>>
							<a href="<%=request.getContextPath()%>/fasset/proissue/settle/to-releaseaudit.do?projectId=${project.id}" 
							role="tab" data-toggle="ajaxtab" data-target="#releaseMoney"
							data-reload="false">复核放款</a></li>
	                	</c:when>
	                	<c:when test="${powerlist.contains('/fasset/proissue/settle/to-releaseapply.do') }">
	                		<li <c:if test="${!project.isCfmrightinfo() }">class="active"</c:if>>
							<a href="<%=request.getContextPath()%>/fasset/proissue/settle/to-releaseapply.do?projectId=${project.id}" 
							role="tab" data-toggle="ajaxtab" data-target="#releaseMoney"
							data-reload="false">申请放款</a></li>
	                	</c:when>
	                </c:choose>
	                </c:if>
                    <c:if test="${project.isNotRefund()}">
	                    <li
	                    	<c:if test="${!project.isCfmrightinfo() && !project.isNotReleaseMoney() }">class='active'</c:if>
	                    ><a href="<%=request.getContextPath()%>${settleControllerRoot}/viewdrawback.do?projectId=${project.id}" 
	                    	role="tab" data-toggle="ajaxtab" data-target="#drawbackMoney" data-reload="false">退款</a></li>
                    </c:if>
                 <c:if test="${cfmright.needBroken()}">
                 	<li
                 	<c:if test="${!project.isCfmrightinfo() && !project.isNotReleaseMoney() && !project.isNotRefund()}">class='active'</c:if>
                 	><a href="<%=request.getContextPath()%>${settleControllerRoot}/viewbroken.do?cfmRightId=${cfmright.id}" 
			                    	role="tab" data-toggle="ajaxtab" data-target="#brokenMoney" data-reload="false">违约金划付</a></li>
                 </c:if>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                	<c:if test="${project.isCfmrightinfo() }">
	                	<div class="tab-pane fade active in" id="cfmrightsummary">
	                    	<%@ include file="/WEB-INF/jsp/pro/fasset/settle/pro-cfmright-summary.jsp" %>
	                    </div>
                    </c:if>
                    <c:if test="${project.isNotReleaseMoney() && (powerlist.contains('/fasset/proissue/settle/to-releaseapply.do')||powerlist.contains('/fasset/proissue/settle/to-releaseaudit.do')) }">
	                    	<div 
	                    	<c:if test="${!project.isCfmrightinfo() }">class="tab-pane fade active in"</c:if>
	                    	<c:if test="${project.isCfmrightinfo() }">class="tab-pane fade bjui-layout"</c:if>
	                    	 id="releaseMoney"></div>
	                    </c:if>
                    <c:if test="${project.isNotRefund() }">
                    	<div 
                    	<c:if test="${!project.isCfmrightinfo() && !project.isNotReleaseMoney() }">class="tab-pane fade active in"</c:if>
                    	<c:if test="${project.isCfmrightinfo() || project.isNotReleaseMoney() }">class="tab-pane fade bjui-layout"</c:if>
                    	 id="drawbackMoney" data-toggle="autoajaxload"
                    		data-url="<%=request.getContextPath()%>${settleControllerRoot}/viewdrawback.do?projectId=${project.id}"></div>
                    </c:if>
                    <c:if test="${cfmright.contractStatus == 4 }">
                    	<div 
                    	<c:if test="${!project.isCfmrightinfo() && !project.isNotReleaseMoney() && !project.isNotRefund()}">class="tab-pane fade active in"</c:if>
                    	<c:if test="${project.isCfmrightinfo() || project.isNotReleaseMoney() || project.isNotRefund()}">class="tab-pane fade bjui-layout"</c:if>
                    	 id="brokenMoney" data-toggle="autoajaxload"
                    		data-url="<%=request.getContextPath()%>${settleControllerRoot}/viewbroken.do?cfmRightId=${cfmright.id}"></div>
                    </c:if>
                </div>
        </div>
		</div>	
	</div>
</div>
