<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
		
function formcallback(json){
	if(json.statusCode == 200){
		$(this).alertmsg("correct", json.message, {autoClose:false,mask:true,okCall:function(){$(this).dialog("closeCurrent").navtab('refresh');}});
	}else{
		$(this).bjuiajax('ajaxDone', json)
	}
}
		
</script>
<!-- 编辑银行卡 -->
<div class="bjui-pageContent">
	<form id="mainForm" action="<%=request.getContextPath()%>/sys/bank/update.do" data-toggle="validate" data-confirm-msg="确定要提交嘛？" data-callback="formcallback">
		 <input type="hidden" name="id" value="${sysbank.id}">
		 <table class="table table-condensed table-hover" width="100%">
		 	<tbody>
				<tr>
					<td colspan="2">
						<label class="control-label x110">银行名称：</label> 
						<input type="text" name="bankName" value="${sysbank.bankName}" class="form-control" data-rule="required">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x110">银行简称：</label> 
						<input type="text" name="bankSname" value="${sysbank.bankSname}" class="form-control" data-rule="required" >
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x110">银行全称：</label> 
						<input type="text" name="bankFullname" value="${sysbank.bankFullname}" class="form-control" data-rule="required">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x110">银行代号：</label> 
						<input type="text" name="bankNo" value="${sysbank.bankNo}" class="form-control" >
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x110">银行客户电话：</label> 
						<input type="text" name="bankTel" value="${sysbank.bankTel}" class="form-control">
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
		    			<button class="btn btn-blue">保存</button>
		    			<c:if test="${typeId==item.id}">selected</c:if>
		    			<button class="btn btn-close">关闭</button>
					</td>
				</tr>
			</tbody>
		 </table>
	</form>
	
</div>
