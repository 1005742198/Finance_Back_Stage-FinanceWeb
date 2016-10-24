<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--尾款确认 -->
<div class="bjui-pageContent" id="fasset-pro-doreleasemoney">
	<form action="<%=request.getContextPath()%>/release/releasemoney.do" data-toggle="validate" data-confirm-msg="确定要放款？" data-callback="afterSubmit">
		 <table class="table table-condensed table-hover" width="100%">
		 	<tbody>
				<tr>
					<td >
						<label class="control-label x140">项目编号：</label> 
						<input type="hidden" name="projectId" value="${project.id }">
						<span>${project.projectCode }</span>
					</td>
				</tr>
				<tr>
					<td >
						<label class="control-label x140">项目名称：</label> 
						<span>${project.projectName }</span>
					</td>
				</tr>
				<tr>
					<td >
						<label class="control-label x140">成交方：</label> 
						<span>XXX</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">收款账号：</label> 
						<input type="text" name="" data-rule="required" value="" size="20">
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">收款银行：</label> 
						<select name="" data-toggle="selectpicker" data-rule="required">
							<option value="0">-选择银行-</option>
						</select>
					</td>
				</tr>
				<tr>
					<td >
						<label class="control-label x140">到款金额：</label> 
						<input type="text" name="" data-rule="required" value="" size="20">元
					</td>
				</tr>
				<tr>
					<td align="center"  >
					<button type="submit" class="btn-blue" >确认到款</button>
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
	}else{
		$(this).alertmsg("error", json.message);
	}
}

</script>
