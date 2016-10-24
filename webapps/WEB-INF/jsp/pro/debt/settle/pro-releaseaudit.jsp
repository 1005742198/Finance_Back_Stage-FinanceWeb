<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 核保通过后，放款 -->
<div class="bjui-pageContent" id="pro-doreleasemoney">
	<form id="mainForm" action="<%=request.getContextPath()%>/debt/proissue/settle/releaseaudit.do" data-reload-navtab="true" data-confirm-msg="确定审核通过？" data-toggle="validate" data-callback="afterSubmit">
		 <input type="hidden" name="id" value="${projectMoneyApply.id }">
		 <input type="hidden" name="relationId" value="${project.id }">
		 <input type="hidden" name="releaseHasFailure" value="0" id="releaseHasFailure">
		 <input type="hidden" id="pass" name="pass" value="0">
		 <table class="table table-condensed table-hover" width="100%">
		 	<tbody>
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
				<tr>
					<td>
						<label class="control-label x140">募集金额：</label> 
						<span><fmt:formatNumber value="${cfmright.cfmRightMoney }" pattern="0.00"/> 元</span>
					</td>
					<td>
						<label class="control-label x140">融资费用：</label> 
						<span><fmt:formatNumber value="${sumFee }" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x140">放款金额：</label> 
						<span><fmt:formatNumber value="${handleMoney }" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x140">通过交易所还款兑付：</label> 
						<span><c:choose><c:when test="${project.manageDuration==1 }">通过</c:when><c:otherwise>不通过</c:otherwise></c:choose></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">融资方：</label> 
						<span>${project.loanUserName }</span>
					</td>
					<td>
						<label class="control-label x140">收款账号：</label> 
						<span>${project.cardAccount }</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x140">收款银行：</label> 
						<span>${project.bankChannelName }${project.subBankName }</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x140">申请人：</label> 
						${projectMoneyApply.createOperatorName}
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x140">申请意见：</label> 
						${projectMoneyApply.applyRemark }
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x140">放款申请历史：</label> 
						<a href="<%=request.getContextPath()%>/debt/proissue/settle/applyhistory.do?relationId=${project.id}" data-toggle="dialog" data-width="800"  
   				data-height="600" data-id="applyhistory" data-mask="true">点击查看</a>
					</td>
				</tr>
				<!-- <tr>
					<td colspan="2">
						<label class="control-label x140">短信验证码：</label> 
						<input data-autoClose="true" id="validCode" name="validCode" type="text" data-rule="required" data-msg-required="请填写短信验证码"  data-timely="0" autocomplete="off">
						<a class="btn btn-default" id="getCode">点击获取验证码</a>
					</td>
				</tr> -->
				<tr>
					<td colspan="2">
						<label class="control-label x140">放款复核意见：</label> 
						<textarea cols="40" rows="4"  data-rule="required;length[~200, true]" name="auditRemark"></textarea>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
					<button type="submit" class="btn-blue" id="checkPassBtn">同意放款</button>
					<a href="javascript:;" class="btn btn-orange"  id="checkBackBtn">退回</a>
					</td>
				</tr>
		 </table>
	</form>
</div>
<script>
function afterSubmit(json){
	if(json.statusCode == 200){
		$(this).alertmsg("correct", json.message, {autoClose:false,okCall:function(){$(this).dialog("closeCurrent");$(this).navtab("refresh");}});
	}else if(json.statusCode == 100){
		$(this).alertmsg("confirm",json.message,
				{title:"确认是否继续放款",okName:"是",cancelName:"否",okCall:function(){
					$("#releaseHasFailure").val(1);
					$("#mainForm").bjuiajax('ajaxForm', {"confirmMsg":"",callback:"afterSubmit"});
				},
				cancelCall:function(){$(this).dialog("closeCurrent");$(this).navtab("refresh");}
		});
		$("#mainForm").validator('destroy');
	}else{
		$(this).alertmsg("error", json.message);
	}
}
$("#mainForm").on('click','#checkBackBtn',function(e){
	$("#mainForm").on("valid.form", function(e, form) {
		$("#pass").val(0);
	    $(form).data("confirmMsg", "确定退回？").bjuiajax('ajaxForm', $(form).data())
	});
	$(e.delegateTarget).trigger("validate");
}).on("click", "#checkPassBtn", function(){
	$("#mainForm").on("valid.form", function(e, form) {
		$("#pass").val(1);
	    $(form).data("confirmMsg", "确定同意放款？").bjuiajax('ajaxForm', $(form).data())
	});
})
var ti = 0;
function resend() {
	$.ajax({
		type : "post",
		url : "<%=request.getContextPath()%>/debt/proissue/settle/sendReleaseCaptcha.do",
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
