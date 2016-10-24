<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
		function setRoleCallback(json){
			if(json.statusCode == 200){
				$(this).dialog("closeCurrent")
					   .navtab('refresh');
			}else{
				$(this).bjuiajax('ajaxDone', json)
			}
		}
		
</script>
<!-- 分配权限 -->
<div class="bjui-pageContent">
	<form action="${ctx}/memberoperator/updaterole.do?id=${memberOperator.id}" data-toggle="validate" data-confirm-msg="确定要提交嘛？" data-callback="setRoleCallback">
		 <table class="table table-condensed table-hover" width="100%">
		 	<tbody>
				<tr>
					<td>
						<label class="control-label x110">操作员登录名：</label> 
						<span>${memberOperator.loginName}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x110">分配角色：</label>
						<div class="form-control" style="width:400px; height:300px; margin:10px 0; overflow:auto;">
							<c:forEach items="${memberRoles}" var="memberRole">
								<input type="checkbox" name="roleIds" id="" data-toggle="icheck" <c:if test="${roleIds.contains(memberRole.id)}">checked</c:if> value="${memberRole.id}" data-label="${memberRole.roleName}"> <br />
							</c:forEach>
						</div>
					</td>
				</tr>
				
				<tr>
					<td align="center">
		    			<button class="btn btn-blue">保存</button>
		    			<button class="btn btn-close">关闭</button>
					</td>
				</tr>
		 </table>
	</form>
</div>
