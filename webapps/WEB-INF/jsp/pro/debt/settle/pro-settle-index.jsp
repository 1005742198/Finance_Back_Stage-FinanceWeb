<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 定向债权结算首页 -->
<div class="bjui-pageContent">
	<div class="container-fluid">
	<!-- 
		<div class="row top-part">
			<div class="col-md-12">	
				<div class="panel panel-default" style="max-height:200px;">
					<div class="panel-heading">项目情况：</div>						
					 <table class="table table-condensed table-hover" width="100%" >
						<tr>
							<td>
								<label class="control-label x140">项目编号：</label> 
								<span>${project.id }</span>
							</td>
							<td>
								<label class="control-label x140">项目名称：</label> 
								<span>${project.projectName }</span>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div> -->
		<div class="row bottom-part">
			<div class="col-md-12">	
                <!-- Tabs -->
                <ul class="nav nav-tabs" role="tablist">
	                <c:if test="${project.isCfmrightinfo() }">
	                	<li class="active"><a href="#cfmrightsummary" role="tab" data-toggle="tab">核保概要</a></li>
	                </c:if>
	                <c:if test="${project.isNotReleaseMoney() }">
	                <c:choose>
	                	<c:when test="${powerlist.contains('/debt/proissue/settle/to-releaseaudit.do') && not empty projectMoneyApply && projectMoneyApply.applyStatus == 1 }">
	                		<li <c:if test="${!project.isCfmrightinfo() }">class="active"</c:if>>
							<a href="<%=request.getContextPath()%>/debt/proissue/settle/to-releaseaudit.do?projectId=${project.id}" 
							role="tab" data-toggle="ajaxtab" data-target="#releaseMoney"
							data-reload="false">复核放款</a></li>
	                	</c:when>
	                	<c:when test="${powerlist.contains('/debt/proissue/settle/to-releaseapply.do') }">
	                		<li <c:if test="${!project.isCfmrightinfo() }">class="active"</c:if>>
							<a href="<%=request.getContextPath()%>/debt/proissue/settle/to-releaseapply.do?projectId=${project.id}" 
							role="tab" data-toggle="ajaxtab" data-target="#releaseMoney"
							data-reload="false">申请放款</a></li>
	                	</c:when>
	                </c:choose>
					</c:if>
					<c:if test="${project.isNotRefund() }">
						<li <c:if test="${!project.isCfmrightinfo() && !project.isNotReleaseMoney() }">class="active"</c:if>>
							<a href="<%=request.getContextPath()%>/debt/proissue/settle/to-pro-backindex.do?projectId=${project.id}"
							role="tab" data-toggle="ajaxtab" data-target="#drawbackMoney"
							data-reload="false">退款</a></li>
						<li><a href="<%=request.getContextPath()%>/debt/proissue/settle/pro-drawbacklist.do?projectId=${project.id}"
							role="tab" data-toggle="ajaxtab" data-target="#drawbackList"
							data-reload="false">退款明细</a></li>
					</c:if>
				</ul>
                <!-- Tab panes -->
                <div class="tab-content">
	                	<c:if test="${project.isCfmrightinfo() }">
	                	 	<div class="tab-pane fade active in" id="cfmrightsummary">
		                    	<%@ include file="/WEB-INF/jsp/pro/debt/settle/pro-cfmright-summary.jsp" %>
		                    </div>
		                </c:if>
		                <c:if test="${project.isNotReleaseMoney() && (powerlist.contains('/debt/proissue/settle/to-releaseapply.do')||powerlist.contains('/debt/proissue/settle/to-releaseaudit.do')) }">
	                    	<div 
	                    	<c:if test="${!project.isCfmrightinfo() }">class="tab-pane fade active in"</c:if>
	                    	<c:if test="${project.isCfmrightinfo() }">class="tab-pane fade bjui-layout"</c:if>
	                    	 id="releaseMoney"></div>
	                    </c:if>
	                    <c:if test="${project.isNotRefund() }">
			                <div 
			                <c:if test="${!project.isCfmrightinfo() && !project.isNotReleaseMoney() }">class='tab-pane fade active in'</c:if>
			                <c:if test="${project.isCfmrightinfo() || project.isNotReleaseMoney() }">class='tab-pane fade bjui-layout'</c:if>
			                 id="drawbackMoney"  data-toggle="autoajaxload"
			                 data-url="<%=request.getContextPath()%>/debt/proissue/settle/to-pro-backindex.do?projectId=${project.id}"></div>
		                    <div class="tab-pane fade bjui-layout" id="drawbackList" ></div>
	                    </c:if>
                </div>
        </div>
		</div>	
	</div>
</div>
