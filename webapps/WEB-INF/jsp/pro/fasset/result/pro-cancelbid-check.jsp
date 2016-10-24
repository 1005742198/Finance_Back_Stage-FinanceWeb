<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 取消发行-->
<div class="bjui-pageContent" id="pro-cancelissue">
	<form id="cancleform" action="<%=request.getContextPath()%>${resultControllerRoot}/do-pro-cancelissue.do" data-toggle="validate" data-confirm-msg="确定要提交吗？" data-callback="afterCancle">
		 <input type="hidden" name="id"  value="${apply.id }"/>
		 <table class="table table-condensed table-hover">
		 	<tbody>
				<tr>
					<td>
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
						<span><fmt:formatNumber value="${project.projectMoney}" pattern="0.00"/> 元</span>
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
						<span><fmt:formatNumber value="${price}" pattern="0.00"/>元</span>
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
						<label class="control-label x140">取消原因：</label> 
						<input type="radio" name="contractStatus" data-toggle="icheck" value="3" data-label="正常解除" data-rule="checked">
						<input type="radio" name="contractStatus" data-toggle="icheck" value="4" data-label="受让方违约解除" data-rule="checked">
						<input type="radio" name="contractStatus" data-toggle="icheck" value="5" data-label="转让方违约解除" data-rule="checked">
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">取消转让审核意见：</label> 
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
		$("#cancleform").attr("action","<%=request.getContextPath()%>${resultControllerRoot}/do-pro-nocancelissue.do");
		$("#cancleform").submit();
	}
</script>
