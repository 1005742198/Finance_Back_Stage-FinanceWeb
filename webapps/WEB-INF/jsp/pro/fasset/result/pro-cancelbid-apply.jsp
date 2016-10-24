<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 申请取消转让-->
<div class="bjui-pageContent" id="pro-cancel-bid">
	<form action="<%=request.getContextPath()%>${resultControllerRoot}/pro-cancelissue-apply.do" data-toggle="validate" data-confirm-msg="确定要申请吗？" data-callback="afterApply">
		 <table class="table table-condensed table-hover" width="100%">
		 	<tbody>
				<tr>
					<td>
					<input type="hidden" name="projectId"  value="${project.id }"/>
						<label class="control-label x140">项目编号：</label> 
						<span>${project.projectCode }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">项目名称：</label> 
						<span>${project.projectName }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">转让方：</label> 
						<span>${project.loanUserName }</span>
					</td>

				</tr>
				<tr>
					<td>
						<label class="control-label x140">挂牌金额：</label> 
						<span>${project.projectMoney} 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">报价人数：</label> 
						<span>${project.quotedCnt } 人</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">成交价：</label> 
						<span><fmt:formatNumber value="${price }" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">取消转让申请意见：</label> 
						<textarea cols="40" rows="4" data-toggle="autoheight" data-rule="required;length[~200, true]" name="applyRemark"></textarea>
					</td>
				</tr>
				<tr>
					<td align="center">
					<button type="submit" class="btn-blue" >提交申请</button>
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
