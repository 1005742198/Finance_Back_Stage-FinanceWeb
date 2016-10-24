<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 金融资产转让核保结果 -->
<div class="bjui-pageContent">
	<div class="container-fluid">
		<div class="row bottom-part">
			<div class="col-md-12">	
                <!-- Tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li  class="active"><a href="#cfmright" role="tab" data-toggle="tab" data-reload="false">核保结果</a></li>
                    <li><a href="<%=request.getContextPath()%>/fasset/proissue/settle/pro-cfmright-detail.do?projectId=${project.id}" 
	                    	role="tab" data-toggle="ajaxtab" data-target="#cfmrightdetail" data-reload="false">核保明细</a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                	<div class="tab-pane fade active in" id="cfmright">
                		<c:choose>
                    	<c:when test="${project.getTransferType() == 1 }">
                    	<%@ include file="/WEB-INF/jsp/pro/fasset/info/pro-docfmright-split.jsp" %>
                    	</c:when>
                    	<c:otherwise>
                    	<%@ include file="/WEB-INF/jsp/pro/fasset/info/pro-cfmrightinfo.jsp" %>
                    	</c:otherwise>
                    	</c:choose>
	                 </div>
                    <div class="tab-pane fade bjui-layout" id="cfmrightdetail" data-toggle="autoajaxload"
                    	data-url="<%=request.getContextPath()%>/fasset/proissue/settle/pro-cfmright-detail.do?projectId=${project.id}"></div>
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