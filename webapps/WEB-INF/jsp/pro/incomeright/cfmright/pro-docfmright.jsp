<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.other-table th{background-color:#fff!important;text-align:center;}
	.other-table td{text-align:center;}
	.other-table .wrap_bjui_btn_box{width:100%;}
</style>
<!-- 核保审核 确权-->
<div class="bjui-pageContent">
	<form id="byUnderwriterform" action="<%=request.getContextPath()%>/incomeright/cfmright/docfmright.do" data-toggle="validate" data-confirm-msg="确定要提交嘛？" data-callback="afterCfmRight">

		 <table class="table table-condensed table-hover table-auto">
		 	<thead>
		 		<tr><th colspan="3">产品融资情况</th></tr>
		 	</thead>
		 	<tbody>
				<tr>
					<td>
						<label class="control-label x130">产品编号：</label> 
						<input type="hidden" value="${project.id }" name="projectId"> 
						<span>${project.projectCode }</span>
					</td>
					<td colspan="2">
						<label class="control-label x130">产品名称：</label> 
						<span>${project.projectName}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">发行人：</label> 
						<input type="hidden" value="${cfmRight.id }" name="cfmId"> 
						<input type="hidden" value="1" id="cfmResult" name="cfmResult"> 
						<span>${project.loanUserName }</span>
					</td>
					<td>
						<label class="control-label x130">计划融资总额：</label> 
						<span>${cfmRight.projectMoney} 元</span>
					</td>
					<td>
						<label class="control-label x130">认购结束时间：</label> 
						<span><fmt:formatDate value="${project.buyTimeEnd }" pattern="yyyy-MM-dd HH:mm:ss"/> </span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">认购总额：</label>
						<span><fmt:formatNumber value="${cfmRight.applyTotalMoney}" pattern="0.00"/> 元</span>
					</td>
					<td>
						<label class="control-label x130">认购总人数：</label> 
						<span>${cfmRight.applyUserNumbers } 人</span>
					</td>
					<td>
						<label class="control-label x130">认购超募金额：</label>
						<span><fmt:formatNumber value="${cfmRight.applyOutMoney}" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">认购到账总额：</label> 
						<span><fmt:formatNumber value="${cfmRight.payReceivedMoney}" pattern="0.00"/> 元</span>
					</td>
					<td>
						<label class="control-label x130">认购到账总人数：</label> 
						<span>${cfmRight.payReceivedUserNumbers } 人</span>
					</td>
					<td>
						<label class="control-label x130">到账超募金额：</label> 
						<span><fmt:formatNumber value="${cfmRight.payReceivedOutMoney}" pattern="0.00"/> 元</span>
					</td>
				</tr>
			 	<thead>
			 		<tr><th colspan="3">核保确权</th></tr>
			 	</thead>
				<tr>
					<td>
						<label class="control-label x130">可确权总金额：</label> 
						<span><fmt:formatNumber value="${cfmRight.cfmRightMoney}" pattern="0.00"/> 元</span>
					</td>
					<td colspan="2">
						<label class="control-label x130">可确权认购总人数：</label> 
						<span>${cfmRight.cfmRightUserNumbers } 人</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">需退款总金额：</label> 
						<span><fmt:formatNumber value="${cfmRight.unRightMoney}" pattern="0.00"/> 元</span>
					</td>
					<td colspan="2">
						<label class="control-label x130">需退款总人数：</label> 
						<span>${cfmRight.unRightUserNumbers } 人</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">应付发行人：</label> 
						<span><fmt:formatNumber value="${handleMoney}" pattern="0.00"/>元</span>
					</td>
					<td colspan="2">
						<label class="control-label x130">融资费用总额：</label> 
						<span><fmt:formatNumber value="${sumFee}" pattern="0.00"/> 元</span>
					</td>
				</tr>
				</tbody>
			 	<thead>
			 		<tr><th colspan="3">融资费用明细</th></tr>
			 	</thead>
			 	<tbody>
				<tr>
					<td>
						<label class="control-label x130">融资服务费率：</label> 
						<span><fmt:formatNumber value="${project.advioserFee*100}" pattern="0.000"/> %</span>
					</td>
					<td colspan="2">
						<label class="control-label x130">融资费用总额：</label> 
						<span><fmt:formatNumber value="${cfmRight.rzAdvioserFee}" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">平台运营费率：</label> 
						<span><fmt:formatNumber value="${project.platformFee*100}" pattern="0.000"/> %</span>
					</td>
					<td colspan="2">
						<label class="control-label x130">平台运营费用：</label> 
						<span><fmt:formatNumber value="${cfmRight.ptFee}" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">默认承销服务费率：</label> 
						<span><fmt:formatNumber value="${project.investAdvioserFee*100}" pattern="0.000"/> %</span>
					</td>
					<td colspan="2">
						<label class="control-label x130">承销服务费总额：</label> 
						<span><fmt:formatNumber value="${cfmRight.tzAdvioserFee }" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<c:if test="${!cfmRight.noSaleagent()}">
				<tr>
					<td colspan="3">
						<table class="table table-condensed table-hover other-table">
	            		<thead>
	                	<tr>
	                    <th width="20%">承销机构</th>
	                    <th width="10%">承销方式</th>
	                    <th width="20%">承销额度</th>
	                    <th width="20%">实际承销金额</th>
	                    <th width="10%">承销费率</th>
	                    <th width="10%">承销服务费用</th>
	                	</tr>
	            		</thead>
				        <tbody>
				        	<c:forEach var="agent" items="${cfmRight.saleagentList}" varStatus="status"> 
				        	<tr>
				        	<td>${agent.saleMemberName }</td>
				        	<td>
				        	<c:forEach var="saleType" items="${saleTypeIdList}"> 	
				        		<c:if test="${agent.saleTypeId==saleType.typeId }">${saleType.typeName}</c:if>
		                    </c:forEach></td>
				        	<td><fmt:formatNumber value="${agent.saleMoney }" pattern="0.00"/> 元</td>
				        	<td><fmt:formatNumber value="${agent.saleCfmRightMoney }" pattern="0.00"/> 元</td>
				        	<td><fmt:formatNumber value="${agent.saleFeeRate}" type="PERCENT" maxFractionDigits="3" minFractionDigits="2"/></td>
				        	<td><fmt:formatNumber value="${agent.saleFee }" pattern="0.00"/> 元</td>
				        	</tr>
				        	</c:forEach>
				        </tbody>
	        			</table>
					</td>
				</tr>
				</c:if>
				<tr>
					<td colspan="3">
						<label class="control-label x130">审核意见：</label> 
						<textarea cols="60" rows="4" data-toggle="autoheight" data-rule="required;length[~200, true]" name="cfmRemark" ></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
	    			<c:if test="${cfmRight.applyOrderIds !=null &&cfmRight.applyOrderIds !='' }">
	    				<button type="submit" class="btn-blue" >核保通过</button>
	    			</c:if>
	    			<a href="javascript:noByUnderwriter();" class="btn btn-orange" >核保不通过</a>
					</td>
				</tr>
		 </table>
	</form>
</div>
<script>
	function afterCfmRight(json){
		if(json.statusCode == 200){
			$(this).alertmsg("correct", json.message, {autoClose:false,okCall:function(){$(this).dialog("closeCurrent");$(this).navtab("refresh");}});
		}else{
			$(this).alertmsg("error", json.message, {autoClose:false,okCall:function(){$(this).dialog("refresh");}});
		}
	}
	//核保不通过
	function noByUnderwriter(){
		$(this).alertmsg("confirm","确定核保不通过?",{okCall:function(){
			$("#cfmResult").val(0);
			$("#byUnderwriterform").submit();
		}});
	}
</script>
