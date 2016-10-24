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
	<form id="fassetCfmrightForm" action="<%=request.getContextPath()%>${cfmRightControllerRoot}/docfmright.do" data-toggle="validate" data-confirm-msg="确定要提交嘛？" data-callback="afterCfmRight">
	<input type="hidden" value="${project.id }" name="projectId"> 
	<input type="hidden" value="${cfmRight.id }" name="cfmId"> 
	<input type="hidden" value="3" id="cfmResult" name="cfmResult">
		 <table class="table table-condensed table-hover table-auto">
		 	<thead>
		 		<tr><th colspan="3">项目情况</th></tr>
		 	</thead>
		 	<tbody>
				<tr>
					<td>
						<label class="control-label x130">转让方：</label> 
						<span>${project.loanUserName }</span>
					</td>
					<td>
						<label class="control-label x130">挂牌金额：</label> 
						<span>${project.projectMoney} 元</span>
					</td>
					<td>
						<label class="control-label x130">转让结束时间：</label> 
						<span><fmt:formatDate value="${project.buyTimeEnd }" pattern="yyyy-MM-dd HH:mm:ss"/> </span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">报价人数：</label> 
						<span>${cfmRight.applyUserNumbers } 人</span>
					</td>
					<td>
						<label class="control-label x130">到账总额：</label>
						<span><fmt:formatNumber value="${cfmRight.payReceivedMoney }" pattern="0.00"/> 元</span>
					</td>
					<td>
						<label class="control-label x130">到账人数：</label>
						<span>${cfmRight.payReceivedUserNumbers } 人</span>
					</td>
				</tr>
			 	<thead>
			 		<tr><th colspan="3">核保确权</th></tr>
			 	</thead>
				<tr>
					<td>
						<label class="control-label x130">成交金额：</label> 
						<span><fmt:formatNumber value="${cfmRight.cfmRightMoney }" pattern="0.00"/> 元</span>
					</td>
					<td colspan="2">
						<label class="control-label x130">成交人数：</label> 
						<span>${cfmRight.cfmRightUserNumbers } 人</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">需退款总金额：</label> 
						<span><fmt:formatNumber value="${cfmRight.unRightMoney }" pattern="0.00"/> 元</span>
					</td>
					<td>
						<label class="control-label x130">需退款总人数：</label> 
						<span>${cfmRight.unRightUserNumbers } 人</span>
					</td>
					<td>
						<label class="control-label x130">退款情况：</label> 
						<span>${cfmRight.getDrawbackStatusDesc() }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">需放款金额：</label> 
						<span><fmt:formatNumber value="${cfmRight.realseMoney() }" pattern="0.00"/>元</span>
					</td>
					<td>
						<label class="control-label x130">收款方：</label> 
						<span>${project.loanUserName }</span>
					</td>
					<td>
						<label class="control-label x130">放款情况：</label> 
						<span>${cfmRight.getProReleaseStatus() }</span>
					</td>
				</tr>
				</tbody>
			 	<thead>
			 		<tr><th colspan="3">融资费用明细</th></tr>
			 	</thead>
			 	<tbody>
				<tr>
					<td>
						<label class="control-label x130">交易顾问服务费率：</label> 
						<span><fmt:formatNumber value="${project.advioserFee*100 }" pattern="0.000"/> %</span>
					</td>
					<td colspan="2">
						<label class="control-label x130">交易顾问服务费：</label> 
						<span><fmt:formatNumber value="${cfmRight.rzAdvioserFee }" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">投资顾问服务费率：</label> 
						<span><fmt:formatNumber value="${project.investAdvioserFee*100}" pattern="0.000"/> %</span>
					</td>
					<td colspan="2">
						<label class="control-label x130">投资顾问服务费：</label> 
						<span><fmt:formatNumber value="${cfmRight.tzAdvioserFee }" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">平台运营费率：</label> 
						<span><fmt:formatNumber value="${project.platformFee*100 }" pattern="0.000"/> %</span>
					</td>
					<td colspan="2">
						<label class="control-label x130">平台运营费用：</label> 
						<span><fmt:formatNumber value="${cfmRight.ptFee}" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<label class="control-label x130">审核意见：</label> 
						<textarea cols="60" rows="4" data-toggle="autoheight" data-rule="required;length[~200, true]" name="cfmRemark" ></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
	    			<button type="submit" class="btn btn-orange" id="backBtn">核保不通过</button>
	    			<c:if test="${cfmRight.applyOrderIds !=null &&cfmRight.applyOrderIds !='' }">
	    				<button type="submit" class="btn btn-blue" id="submitBtn">核保通过</button>
	    			</c:if>
	    			<button class="btn btn-close" data-icon="close">关闭</button>
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
