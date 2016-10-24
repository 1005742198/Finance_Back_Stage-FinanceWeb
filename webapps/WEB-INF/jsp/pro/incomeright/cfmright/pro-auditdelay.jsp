<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 审核延长申购时间 -->
<div class="bjui-pageContent" id="pro-auditdelay">
	<form id="form" action="<%=request.getContextPath()%>/incomeright/cfmright/delayAudit.do" data-toggle="validate" data-confirm-msg="确定要提交嘛？" data-callback="projectupateCallback">
		<input type="hidden" name="projectId" value="${obj.id}">
		<input type="hidden" name="id" value="${applyextend.id}">
		<input type="hidden" name="extendStatus" value="${applyextend.applyStatus}" id="extendStatus">
		 <table class="table table-condensed table-hover" width="100%">
		 	<tbody>
				<tr>
					<td>
						<label class="control-label x130">产品编号：</label> 
						<span>${obj.projectCode }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">产品名称：</label> 
						<span>${obj.projectName}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">产品起息日：</label> 
						<span><fmt:formatDate value="${obj.valueDate}" pattern="yyyy-MM-dd"/></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">原定认购结束时间：</label> 
						<span><fmt:formatDate value="${obj.buyTimeEnd}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">申请延长认购时间至：</label> 
						<span><fmt:formatDate value="${applyextend.specialEndTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">申请人：</label> 
						<span>${applyextend.createOperatorName}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">申请时间：</label> 
						<span><fmt:formatDate value="${applyextend.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">延长原因：</label> 
						<span>${applyextend.applyRemark}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">审核基础条件：</label> 
						<span class="red">
						1、延长日必须小于起息日。2、延长之后的审核时间必须大于当前时间
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">审核意见：</label> 
						<textarea cols="40" rows="4" data-toggle="autoheight" data-rule="required;length[~200, true]" id="auditRemark" name="auditRemark"></textarea>
					</td>
				</tr>
				<tr>
					<td align="center">
	    			<a href="javascript:;" id="checkBackBtn" class="btn btn-orange">审核不通过</a>
	    			<button type="submit" class="btn-blue" id="checkPassBtn">审核通过</button>
	    			<button type="button" class="btn-close" data-icon="close">关闭</button>
					</td>
				</tr>
		 </table>
	</form>
</div>
<script>
$('#form').validator({
	fields: {
        'auditRemark': 'required;length[~200, true]'
    }
}).on('click','#checkBackBtn',function(e){
	$("#form").on("valid.form", function(e, form) {
		$("#extendStatus").val(3);
	    $(form).data("confirmMsg", "确定审核不通过？").bjuiajax('ajaxForm', $(form).data())
	});
	$(e.delegateTarget).trigger("validate");
})
$("#checkPassBtn").on("click", function(){
	$("#form").on("valid.form", function(e, form) {
		$("#extendStatus").val(2);
	    $(form).data("confirmMsg", "确定审核通过？").bjuiajax('ajaxForm', $(form).data())
	});
})
function projectupateCallback(json) {
	if(json.statusCode == 200) {
		$(this).alertmsg("correct", json.message);
		$(this).dialog("closeCurrent");
		$(this).navtab("refresh");
	}else {
		$(this).alertmsg("error", json.message);
	}
}
</script>