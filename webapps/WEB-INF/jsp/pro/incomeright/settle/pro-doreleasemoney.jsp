<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 核保通过后，放款 -->
<div class="bjui-pageContent" id="pro-doreleasemoney">
	<form id="mainForm" action="<%=request.getContextPath()%>/incomeright/settle/releasemoney.do" data-toggle="validate" data-confirm-msg="确定要放款？" data-callback="afterSubmit">
		 <input type="hidden" name="releaseHasFailure" value="0" id="releaseHasFailure">
		 <table class="table table-condensed table-hover" width="100%">
		 	<tbody>
				<tr>
					<td>
						<label class="control-label x140">产品编号：</label> 
						<input type="hidden" name="projectId" value="${project.id }">
						<span>${project.projectCode }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">产品名称：</label> 
						<span>${project.projectName }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">募集金额：</label> 
						<span><fmt:formatNumber value="${cfmright.cfmRightMoney }" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">融资费用：</label> 
						<span><fmt:formatNumber value="${sumFee }" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">放款金额：</label> 
						<span><fmt:formatNumber value="${handleMoney }" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">发行人：</label> 
						<span>${project.loanUserName }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">收款账号：</label> 
						<span>${project.cardAccount }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">收款银行：</label> 
						<span>${project.bankChannelName }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">收款银行开户行：</label> 
						<span>${project.subBankName }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">通过交易所还款兑付：</label> 
						<span><c:choose><c:when test="${project.manageDuration==1 }">通过</c:when><c:otherwise>不通过</c:otherwise></c:choose></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">审核意见：</label> 
						<textarea cols="40" rows="4" data-rule="required;length[~200, true]" name="releaseRemarke"></textarea>
					</td>
				</tr>
				<tr>
					<td align="center">
					<button type="submit" class="btn-blue" >确认放款</button>
	    			<button type="button" class="btn-close" data-icon="close">关闭</button>
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

</script>
