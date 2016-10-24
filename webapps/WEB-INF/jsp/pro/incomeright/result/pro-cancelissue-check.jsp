<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 取消发行-->
<div class="bjui-pageContent" id="pro-cancelissue">
	<form id="cancleform" action="<%=request.getContextPath()%>/incomeright/result/do-pro-cancelissue.do" data-toggle="validate" data-confirm-msg="确定要提交吗？" data-callback="afterCancle">
		 <table class="table table-condensed table-hover">
		 	<tbody>
				<tr>
					<td>
					<input type="hidden" name="id"  value="${apply.id }"/>
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
						<label class="control-label x140">募集资金总额：</label> 
						<span><fmt:formatNumber value="${summary[0] }" pattern="0.00"/></span>
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
						<label class="control-label x140">申请人：</label> 
						<span>${apply.createOperatorName }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">申请取消意见：</label> 
						<span>${apply.applyRemark }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">取消发行审核意见：</label> 
						<textarea cols="40" rows="4" data-toggle="autoheight" data-rule="required;length[~200, true]" name="auditRemark"></textarea>
					</td>
				</tr>
				<tr>
					<td align="center">
					<a href="javascript:nocancelissue();"  class="btn btn-orange">审核不通过</a>
					<button type="submit" class="btn-blue" >审核通过</button>
	    			<button type="button" class="btn-close" data-icon="close">关闭</button>
					</td>
				</tr>
		 </table>
	</form>
</div>
<script>
	function afterCancle(json){
		if(json.statusCode == 200){
			$(this).alertmsg("correct", json.message, {autoClose:false,okCall:function(){$(this).dialog("closeCurrent");$(this).navtab("refresh");}});
		}else{
			$(this).alertmsg("error", json.message);
		}
	}
	//审核不通过
	function nocancelissue(){
		$("#cancleform").attr("action","<%=request.getContextPath()%>/incomeright/result/do-pro-nocancelissue.do");
		$("#cancleform").submit();
	}
</script>
