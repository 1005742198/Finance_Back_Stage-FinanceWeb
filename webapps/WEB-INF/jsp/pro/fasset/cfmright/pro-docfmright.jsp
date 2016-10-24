<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
fieldset{margin-top:8px; height:200px;}
</style>
<div class="bjui-pageContent">
	<form id="fassetCfmrightForm" action="<%=request.getContextPath()%>${cfmRightControllerRoot}/docfmright.do" data-toggle="validate" data-confirm-msg="确定要提交嘛？" data-callback="afterCfmRight">
	<input type="hidden" value="${project.id }" name="projectId"> 
	<input type="hidden" value="${cfmRight.id }" name="cfmId"> 
	<input type="hidden" value="3" id="cfmResult" name="cfmResult">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">	
				<div class="panel panel-default ">
					<div class="panel-heading">核保审核：</div>						
					<table class="table table-hover table-auto">
						<tbody>
							<tr>
								<td>
									<label class="control-label x130">项目编号：</label> 
									<span>${project.projectCode }</span>
								</td>
								<td colspan="2">
									<label class="control-label x130">项目名称：</label> 
									<span>${project.projectName}</span>
								</td>
							</tr>
							<tr>
								<td>
									<label class="control-label x130">转让方：</label> 
									<span>${project.loanUserName }</span>
								</td>
								<td colspan="2">
									<label class="control-label x130">挂牌金额：</label> 
									<span>${project.projectMoney} 元</span>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<label class="control-label x130">转让结束时间：</label> 
									<span><fmt:formatDate value="${project.buyTimeEnd }" pattern="yyyy-MM-dd HH:mm:ss"/> </span>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<label class="control-label x130">受让方资格条件：</label>
									<span>${project.tradePartyQualification }</span>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<label class="control-label x130">转让相关条件：</label>
									<span>${project.tradeTerm }</span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row" style="overflow:hidden;">
			<div class="col-md-12">	
				<div class="panel panel-default">
					<div class="panel-heading">意向报价列表：（核保通过的请选中左侧复选框）</div>						
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-4">
								<fieldset>
									<legend>意向报价方</legend>
									<!-- Tabs -->
									<ul class="nav nav-stacked" role="tablist">
										<c:forEach var="obj" items="${orderList}" varStatus="varStatus">
											<li><a href="#order_${obj.id}" role="tab" data-toggle="tab">
											<input type="checkbox" name="cfmrgithOrderId" value="${obj.id}" data-toggle="icheck" data-label="${obj.orderUserName }"></a></li>
										</c:forEach>
									</ul>
								</fieldset>
							</div>
							<div class="col-md-8">
								<fieldset>
									<legend>机构信息</legend>
									<!-- Tab panes -->
									<div class="tab-content" style="border:none;">
										<c:forEach var="obj" items="${orderList}" varStatus="varStatus">
										<div class="tab-pane fade in" id="order_${obj.id}">
											<table class="table table-hover my-table " >
											  <tbody>
												<tr>
													<td>
														<label class="control-label">机构编号：</label> 
														<span>${obj.orderUserCode }</span>
													</td>
													<td>
														<label class="control-label">机构名称：</label> 
														<span>${obj.orderUserName}</span>
													</td>
												</tr>
												<tr>
													<td>
														<label class="control-label">资产总额：</label> 
														<span><fmt:formatNumber value="${obj.orderUserFinanTotalAsset}" pattern="0.00"/> 元</span>
													</td>
													<td>
														<label class="control-label ">转让报价：</label> 
														<span><fmt:formatNumber value="${obj.orderMoney }" pattern="0.00"/> 元</span>
													</td>
												</tr>
												<tr>
													<td>
														<label class="control-label">转让保证金：</label> 
														<span><fmt:formatNumber value="${obj.guaranteeMoney }" pattern="0.00"/> 元</span>
													</td>
													<td>
														<label class="control-label">已支付金额：</label> 
														<span><fmt:formatNumber value="${obj.paidMoney }" pattern="0.00"/> 元</span>
													</td>
												</tr>
												<tr>
													<td>
														<label class="control-label">注册资本：</label> 
														<span><fmt:formatNumber value="${obj.orderUserFinanGroupBusIncome }" pattern="0.00"/> 元</span>
													</td>
													<td>
														<label class="control-label">净资产：</label> 
														<span><fmt:formatNumber value="${obj.orderUserFinanNetAsset}" pattern="0.00"/> 元</span>
													</td>
												</tr>
												<tr>
													<td colspan="2">
														<label class="control-label">营业收入：</label> 
														<span><fmt:formatNumber value="${obj.orderUserFinanBusIncome }" pattern="0.00"/> 元</span>
													</td>
												</tr>
											  </tbody>
									    </table>
										</div>
										</c:forEach>
									</div>
									
								</fieldset>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">	
				<div class="panel panel-default">
					<div class="panel-heading">审核意见：</div>
					<textarea cols="80" rows="5" data-toggle="autoheight" data-rule="required;length[~200, true]" name="cfmRemark" ></textarea>					
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 text-center">	
				<c:if test="${not empty orderList}">
				<button type="submit" class="btn btn-blue" id="submitBtn">核保通过</button>
				</c:if>
				<button type="submit" class="btn btn-orange" id="backBtn">核保不通过</button>
			</div>
		</div>
	</div>
	</form>
</div>
<script>
	function afterCfmRight(json){
		if(json.statusCode == 200){
			$(this).alertmsg("correct", json.message, {autoClose:false,okCall:function(){$(this).dialog("closeCurrent");$(this).navtab("refresh");}});
		}else{
			$(this).alertmsg("error", json.message);
		}
	}
	$(':submit').click(function(){
		var _this=$(this);
		var cfmStatus = 3;
		if(_this.attr("id")=="submitBtn") {
			cfmStatus = 2;
		}
		$("#cfmResult").val(cfmStatus); 
		$("#fassetCfmrightForm").data("confirmMsg",function(){
			return '确定要'+_this.text().trim()+'吗？';
		})
	});
</script>
