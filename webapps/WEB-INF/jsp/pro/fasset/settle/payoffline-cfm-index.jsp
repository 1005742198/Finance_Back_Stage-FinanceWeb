<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 线下到款确认 -->
<div class="bjui-pageContent">
	<div class="container-fluid">
		<div class="row bottom-part">
			<div class="col-md-12">	
                <!-- Tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li class="active"><a href="#payoffline" role="tab" data-toggle="tab">到款确认</a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div class="tab-pane fade active in" id="payoffline">
                    	<%@ include file="/WEB-INF/jsp/pro/fasset/settle/bidlist-payoffline-cfm.jsp" %>
                    </div>
                </div>
        </div>
		</div>
	</div>
</div>
