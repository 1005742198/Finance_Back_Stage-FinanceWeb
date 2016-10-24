<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 金融资产转让结算明细 -->
<div class="bjui-pageContent">
	<div class="container-fluid">
		<div class="row top-part">
			<div class="col-md-12">	
				<div class="panel panel-default" style="max-height:200px;">
					<div class="panel-heading">项目情况：</div>						
					 <table class="table table-condensed table-hover" width="100%" >
						<tr>
							<td>
								<label class="control-label x140">项目编号：</label> 
								<span>${project.projectCode }</span>
							</td>
							<td>
								<label class="control-label x140">项目名称：</label> 
								<span>${project.projectName }</span>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="row bottom-part">
			<div class="col-md-12">	
                <!-- Tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li class="active"><a href="#cfmRight" role="tab" data-toggle="tab">核保结果</a></li>
                    <li><a href="<%=request.getContextPath()%>/fasset/proissue/settle/pro-cfmright-detail.do?projectId=${project.id}" 
                    	role="tab" data-toggle="ajaxtab" data-target="#cfmRightDetail" data-reload="true">核保明细</a></li>
                    <c:if test="${project.isShowReleaseDetail() }">
                    	<li><a href="<%=request.getContextPath()%>/fasset/proissue/settle/settle-release-detail.do?projectId=${project.id}"
							role="tab" data-toggle="ajaxtab" data-target="#releaseMoneydetail" data-reload="false">放款结果</a></li>
                    	<li><a href="#releaseMoney" role="tab" data-toggle="tab" data-reload="false">放款明细</a></li>
                    </c:if>
                    <c:if test="${project.isShowDrawbackDetail() }">
                    	<li><a href="<%=request.getContextPath()%>/fasset/proissue/settle/settle-drawback-detail.do?projectId=${project.id}"
							role="tab" data-toggle="ajaxtab" data-target="#drawbackMoneydetail" data-reload="false">退款结果</a></li>
	                    <li><a href="<%=request.getContextPath()%>/fasset/proissue/settle/info-settle-drawback-list.do?projectId=${project.id}" 
	                    	role="tab" data-toggle="ajaxtab" data-target="#drawbackMoney" data-reload="false">退款明细</a></li>
                    </c:if>
                    <c:if test="${project.isShowBreakPayDetail() }">
                    	<li><a href="<%=request.getContextPath()%>/fasset/proissue/settle/settle-broken-detail.do?projectId=${project.id}"
							role="tab" data-toggle="ajaxtab" data-target="#brokenMoneydetail" data-reload="false">违约金划付结果</a></li>
	                    <li><a href="<%=request.getContextPath()%>/fasset/proissue/settle/info-settle-broken-list.do?projectId=${project.id}" 
	                    	role="tab" data-toggle="ajaxtab" data-target="#brokenMoney" data-reload="false">违约金划付明细</a></li>
                    </c:if>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div class="tab-pane fade active in" id="cfmRight"><%@ include file="/WEB-INF/jsp/pro/fasset/info/pro-cfmrightinfo.jsp"%></div>
                    <div class="tab-pane fade bjui-layout" id="cfmRightDetail" data-toggle="autoajaxload"
                    	data-url="<%=request.getContextPath()%>/fasset/proissue/settle/pro-cfmright-detail.do?projectId=${project.id}"></div>
                    <c:if test="${project.isShowReleaseDetail() }">
                    	<div class="tab-pane fade bjui-layout" id="releaseMoneydetail" data-toggle="autoajaxload"
							data-url="<%=request.getContextPath()%>/fasset/proissue/settle/settle-release-detail.do?projectId=${project.id}"></div>
	                    <div class="tab-pane fade bjui-layout" id="releaseMoney">
	                    	<%@ include file="/WEB-INF/jsp/pro/fasset/settle/info-settle-release-list.jsp" %>
	                    </div>
                    </c:if>
                    <c:if test="${project.isShowDrawbackDetail() }">
                    	<div class="tab-pane fade bjui-layout" data-toggle="autoajaxload" id="drawbackMoneydetail" 
							data-url="<%=request.getContextPath()%>/fasset/proissue/settle/settle-drawback-detail.do?projectId=${project.id}"></div>
                   		<div class="tab-pane fade bjui-layout" id="drawbackMoney" data-toggle="autoajaxload"
                    		data-url="<%=request.getContextPath()%>/fasset/proissue/settle/info-settle-drawback-list.do?projectId=${project.id}"></div>
                    </c:if>
                    <c:if test="${project.isShowBreakPayDetail() }">
                    <div class="tab-pane fade bjui-layout" id="brokenMoneydetail" data-toggle="autoajaxload"
                    	data-url="<%=request.getContextPath()%>/fasset/proissue/settle/settle-broken-detail.do?projectId=${project.id}"></div>
                    <div class="tab-pane fade bjui-layout" id="brokenMoney" data-toggle="autoajaxload"
                    	data-url="<%=request.getContextPath()%>/fasset/proissue/settle/info-settle-broken-list.do?projectId=${project.id}"></div>
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