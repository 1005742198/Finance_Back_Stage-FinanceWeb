<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 定向债权发行核保明细 -->
<div class="bjui-pageContent">
	<div class="container-fluid">
	<!-- 
		<div class="row top-part">
			<div class="col-md-12">	
				<div class="panel panel-default" style="max-height:200px;">
					<div class="panel-heading">项目情况：</div>						
					 <table class="table table-condensed table-hover" width="100%"  >
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
		</div>
		 -->
		<div class="row bottom-part">
			<div class="col-md-12">	
                <!-- Tabs -->
                <ul class="nav nav-tabs" role="tablist">
                	<li class="active"><a href="#cfmRightinfo" role="tab" data-toggle="tab">核保结果</a></li>
                    <li><a href="<%=request.getContextPath()%>/debt/orderapply/list.do?projectId=${project.id}&payStatus=2" 
                    	role="tab" data-toggle="ajaxtab" data-target="#orderMoney" data-reload="false">核保明细</a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div class="tab-pane fade active in" id="cfmRightinfo">
                    	<%@ include file="/WEB-INF/jsp/pro/debt/info/pro-cfmrightinfo.jsp" %>
                    </div>
                    <div class="tab-pane fade bjui-layout" id="orderMoney" data-toggle="autoajaxload"
							data-url="<%=request.getContextPath()%>/debt/orderapply/list.do?projectId=${project.id}&hb=1"></div>
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