<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 定向债权发行结算明细 -->
<div class="bjui-pageContent">
	<div class="container-fluid">
		<div class="row bottom-part">
			<div class="col-md-12">	
                <!-- Tabs -->
                <ul class="nav nav-tabs" role="tablist">
                	<c:if test="${project.isCfmrightinfo() }">
						<li class="active"><a href="#cfmrightResult" role="tab" data-toggle="tab">核保结果</a></li>
						<li><a href="<%=request.getContextPath()%>/debt/orderapply/list.do?projectId=${project.id}&payStatus=2"
							role="tab" data-toggle="ajaxtab" data-target="#cfmrightDetails" data-reload="false">核保明细</a></li>
					</c:if>
					<c:if test="${project.isShowReleaseDetail() }">
						<li <c:if test="${!project.isCfmrightinfo() }">class="active"</c:if>><a href="<%=request.getContextPath()%>/incomeright/settle/settle-release-detail.do?projectId=${project.id}"
							role="tab" data-toggle="ajaxtab" data-target="#releaseMoney" data-reload="false">放款结果</a></li>
						<li><a href="<%=request.getContextPath()%>/incomeright/settle/settle-release-list.do?projectId=${project.id}"
							role="tab" data-toggle="ajaxtab" data-target="#releaseDetails" data-reload="false">放款明细</a></li>
					</c:if>
					<c:if test="${project.isShowDrawbackDetail() }">
						<li <c:if test="${!project.isCfmrightinfo() && !project.isShowReleaseDetail() }">class="active"</c:if>><a href="<%=request.getContextPath()%>/incomeright/settle/settle-drawback-detail.do?projectId=${project.id}"
							role="tab" data-toggle="ajaxtab" data-target="#drawbackMoney" data-reload="false">退款结果</a></li>
						<li><a href="<%=request.getContextPath()%>/incomeright/settle/info-settle-drawback-list.do?projectId=${project.id}"
							role="tab" data-toggle="ajaxtab" data-target="#drawbackDetails" data-reload="false">退款明细</a></li>
					</c:if>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                	<c:if test="${project.isCfmrightinfo() }">
						<div class="tab-pane fade active in" id="cfmrightResult">
							<%@ include file="/WEB-INF/jsp/pro/incomeright/info/pro-cfmrightinfo.jsp"%></div>
						<div class="tab-pane fade bjui-layout" id="cfmrightDetails" data-toggle="autoajaxload"
							data-url="<%=request.getContextPath()%>/debt/orderapply/list.do?projectId=${project.id}"></div>
					</c:if>
					<c:if test="${project.isShowReleaseDetail() }">
						<div 
							<c:if test="${!project.isCfmrightinfo() }">class="tab-pane fade active in"</c:if>
							<c:if test="${project.isCfmrightinfo() }">class="tab-pane fade bjui-layout"</c:if>
							id="releaseMoney" data-toggle="autoajaxload"
							data-url="<%=request.getContextPath()%>/incomeright/settle/settle-release-detail.do?projectId=${project.id}"></div>
						<div class="tab-pane fade bjui-layout" id="releaseDetails" ></div>
						<!--  <div class="tab-pane fade bjui-layout" id="releaseDetails" data-toggle="autoajaxload"
							data-url="<%=request.getContextPath()%>/incomeright/settle/settle-release-list.do?projectId=${project.id}"></div>-->
					</c:if>
					<c:if test="${project.isShowDrawbackDetail() }">
						<div 
							<c:if test="${!project.isCfmrightinfo() && !project.isShowReleaseDetail() }">class="tab-pane fade active in"</c:if>
							<c:if test="${project.isCfmrightinfo() || project.isShowReleaseDetail() }">class="tab-pane fade bjui-layout"</c:if>
							 data-toggle="autoajaxload" id="drawbackMoney" 
							data-url="<%=request.getContextPath()%>/incomeright/settle/settle-drawback-detail.do?projectId=${project.id}"></div>
						<div class="tab-pane fade bjui-layout" id="drawbackDetails" ></div>
						<!--  <div class="tab-pane fade bjui-layout" id="drawbackDetails" data-toggle="autoajaxload"
							data-url="<%=request.getContextPath()%>/incomeright/settle/info-settle-drawback-list.do?projectId=${project.id}"></div>-->
					</c:if>
                </div>
        </div>
		</div>	
	</div>
</div>

<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">关闭</button></li>
    </ul>
</div>