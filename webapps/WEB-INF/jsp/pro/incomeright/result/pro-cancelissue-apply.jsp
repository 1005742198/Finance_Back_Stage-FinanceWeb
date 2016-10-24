<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 取消发行-->
<div class="bjui-pageContent" id="pro-cancelissue">
	<form action="<%=request.getContextPath()%>/incomeright/result/pro-cancelissue-apply.do" data-toggle="validate" data-confirm-msg="确定要申请吗？" data-callback="afterApply">
		 <table class="table table-condensed table-hover" width="100%">
		 	<tbody>
				<tr>
					<td>
					<input type="hidden" name="projectId"  value="${project.id }"/>
						<label class="control-label x140">产品编号：</label> 
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
						<label class="control-label x140">已募集资金总额：</label> 
						<span><fmt:formatNumber value="${summary[2] }" pattern="0.00"/></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">总计投资人数：</label> 
						<span><fmt:formatNumber value="${summary[1] }"/> 人</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">有效投资人数：</label> 
						<span><fmt:formatNumber value="${summary[3] }"/> 人</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">取消发行申请意见：</label> 
						<textarea cols="40" rows="4" data-toggle="autoheight" data-rule="required;length[~200, true]" name="applyRemark"></textarea>
					</td>
				</tr>
				<tr>
					<td align="center">
					<button type="submit" class="btn-blue" >申请</button>
	    			<button type="button" class="btn-close" data-icon="close">关闭</button>
					</td>
				</tr>
		 </table>
	</form>
</div>
<script>
	function afterApply(json){
		if(json.statusCode == 200){
			$(this).alertmsg("correct", json.message, {autoClose:false,okCall:function(){$(this).dialog("closeCurrent");$(this).navtab("refresh");}});
		}else{
			$(this).alertmsg("error", json.message);
		}
	}
</script>
