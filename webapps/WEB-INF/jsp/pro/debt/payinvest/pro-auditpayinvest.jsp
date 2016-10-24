<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 发起兑付划款 -->
<div class="bjui-pageContent">
	<form id="formSubmit" action="<%=request.getContextPath()%>/debt/proclaims/payinvest/audit.do" data-toggle="validate" data-confirm-msg="确定要提交嘛？"  data-callback="callback">
		<input type="hidden" name="id" value="${projectMoneyApply.id }">
		<input type="hidden" name="relationId" value="${obj.id}">
		<input type="hidden" id="pass" name="pass" value="0">
		 <table class="table table-condensed table-hover" width="100%">
			 	<thead>
			 		<tr><th colspan="2">项目信息</th></tr>
			 	</thead>
				<tr align="left">
					<td>
						<label class="control-label x130">项目编号：</label> 
						<span>${obj.projectCode}</span>
					</td>
					<td>
						<label class="control-label x130">项目名称：</label> 
						<span>${obj.projectName}</span>
					</td>
				</tr>
				<tr align="left">
					<td>
						<label class="control-label x130">本期还款金额：</label> 
						<span><fmt:formatNumber value="${obj.paidPrincipal+obj.paidInterest+obj.paidOverInterest}"/>元</span>
					</td>
					<td>
						<label class="control-label x130">本期还款日期：</label> 
						<span><fmt:formatDate value="${obj.lastRepayTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</td>
				</tr>
			 	<thead>
			 		<tr><th colspan="2">兑付信息</th></tr>
			 	</thead>
				<tr align="left">
					<td>
						<label class="control-label x130">兑付期数：</label> 
						<span>${obj.periodNumber}</span>
					</td>
					<td>
						<label class="control-label x130">应兑付日期：</label> 
						<span><fmt:formatDate value="${obj.payInvestDate}" pattern="yyyy-MM-dd"/></span>
					</td>
				</tr>
				<tr align="left">
					<td>
						<label class="control-label x130">本期未兑付本金：</label> 
						<span><fmt:formatNumber value="${obj.investPrincipal-obj.paidInvestPrincipal}" pattern="0.00"/>元</span>
					</td>
					<td>
						<label class="control-label x130">本期未兑付利息：</label> 
						<span><fmt:formatNumber value="${obj.investInterest-obj.paidInvestInterest}" pattern="0.00"/>元</span>
					</td>
				</tr>
				<tr align="left">
					<td>
						<label class="control-label x130">累计已兑金额：</label> 
						<span><fmt:formatNumber value="${obj.paidInvestPrincipal+obj.paidInvestInterest+obj.paidInvestOverInterest}" pattern="0.00"/>元</span>
					</td>
					<td>
						<label class="control-label x130">逾期罚息未兑付金额：</label> 
						<span><fmt:formatNumber value="${obj.investOverInterest-obj.paidInvestOverInterest}" pattern="0.00"/>元</span>
					</td>
				</tr>
				<tr align="left">
					<td>
						<label class="control-label x130">本期未兑付总额：</label> 
						<span><fmt:formatNumber value="${obj.investPrincipal+obj.investInterest+obj.investOverInterest-obj.paidInvestPrincipal-obj.paidInvestInterest-obj.paidInvestOverInterest}" pattern="0.00"/>元</span>
					</td>
					<td>
						<label class="control-label x130">逾期天数：</label> 
						<span>${obj.investOverDay}天</span>
					</td>
				</tr>
				<tr align="left">
					<td>
						<label class="control-label x130">可兑金额：</label> 
						<span><fmt:formatNumber value="${obj.investPrincipal+obj.investInterest+obj.investOverInterest-obj.paidInvestPrincipal-obj.paidInvestInterest-obj.paidInvestOverInterest}" pattern="0.00"/>元</span>
					</td>
					<td>
						<label class="control-label x130">兑付投资者人数：</label> 
						<span>${total }人</span>
					</td>
				</tr>
				<tr align="left">
					<td>
						<label class="control-label x130">申请人：</label> 
						${projectMoneyApply.createOperatorName}
					</td>
					<td>
						<label class="control-label x130">申请金额：</label> 
						<fmt:formatNumber value="${projectMoneyApply.applyMoney }" pattern="0.00"/>  元
					</td>
				</tr>
				<tr align="left">
					<td colspan="2">
						<label class="control-label x130">申请意见：</label> 
						${projectMoneyApply.applyRemark }
					</td>
				</tr>
				<tr align="left">
					<td colspan="2">
						<label class="control-label x130">兑付申请历史：</label> 
						<a href="<%=request.getContextPath()%>/debt/proclaims/payinvest/applyhistory.do?relationId=${obj.id}" data-toggle="dialog" data-width="800"  
   				data-height="600" data-id="applyhistory" data-mask="true">点击查看</a>
					</td>
				</tr>
				<!-- <tr align="left">
					<td colspan="2">
						<label class="control-label x130">短信验证码：</label> 
						<input data-autoClose="true" id="validCode" name="validCode" type="text" data-rule="required" data-msg-required="请填写短信验证码"  data-timely="0" autocomplete="off">
						<a class="btn btn-default" id="getCode">点击获取验证码</a>
					</td>
				</tr> -->
				<tr align="left">
					<td colspan="2">
						<label class="control-label x130">兑付复核意见：</label> 
						<textarea cols="40" rows="4"  data-rule="required;length[~200, true]" name="auditRemark"></textarea>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
					<button type="submit" class="btn-blue" id="checkPassBtn">同意兑付划款</button>
					<a href="javascript:;" class="btn btn-orange"  id="checkBackBtn">退回</a>
					</td>
				</tr>
		 </table>
	</form>
</div>
<script type="text/javascript">
function callback(json) {
	if(json.statusCode == 200) {
		$(this).alertmsg("correct", json.message);
		$(this).dialog("closeCurrent");
		$(this).navtab("refresh");
	}else {
		$(this).alertmsg("error", json.message);
	}
}
$("#formSubmit").on('click','#checkBackBtn',function(e){
	$("#formSubmit").on("valid.form", function(e, form) {
		$("#pass").val(0);
	    $(form).data("confirmMsg", "确定退回？").bjuiajax('ajaxForm', $(form).data())
	});
	$(e.delegateTarget).trigger("validate");
}).on("click", "#checkPassBtn", function(){
	$("#formSubmit").on("valid.form", function(e, form) {
		$("#pass").val(1);
	    $(form).data("confirmMsg", "确定同意兑付？").bjuiajax('ajaxForm', $(form).data())
	});
})
var ti = 0;
function resend() {
	$.ajax({
		type : "post",
		url : "<%=request.getContextPath()%>/debt/proclaims/payinvest/sendPayInvestCaptcha.do",
		data : {k:$("#k").val()},
		dataType : "json",
		timeout : 5000,
		cache : false,
		success : function(data, textStatus) {
			if(data.statusCode == 200){
				$("#mainForm").validator("hideMsg", "#validCode");
				if (ti <= 0) {
			        ti = data.data * 60;
			        var self = $('#getCode');
			        self.addClass('btn-disable');
			        self.text(ti+"秒后可重新获取");
			        self.off("click");
			        var _inter = setInterval(function () {
			            if (ti <= 0) {
			                self.removeClass('btn-disable');
			                self.text('点击获取验证码');
			                self.on("click", resend);
			                window.clearInterval(_inter);
			            } else {
			                self.text(ti+"秒后可重新获取");
			                ti--;
			            }
			        }, 1000);
			    }
			}else{
				$("#mainForm").validator("showMsg", data.data);
			}
		}
	});
}
$("#getCode").on("click", resend);
</script>
