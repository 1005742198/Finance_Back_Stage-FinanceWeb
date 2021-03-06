<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	//更新密码callback
	function updatePasswordCallback(json){
		if(json.statusCode == 200){
			$(this).bjuiajax('ajaxDone', json)
				   .dialog("closeCurrent")
				   .navtab('refresh');
		}else{
			$(this).bjuiajax('ajaxDone', json)
		}
	}
</script>
<!-- 设置密码 -->
<div class="bjui-pageContent">
	<form action="<%=request.getContextPath() %>/user/member/updatepassword.do" data-toggle="validate" data-confirm-msg="确定要提交嘛？" data-callback="updatePasswordCallback">
		 <table class="table table-condensed table-hover" width="100%">
		 	<tbody>
				<tr>
					<td>
						<input type="hidden" name="id" value="${user.id }"/>
						<label class="control-label x110">用户登录名：</label> 
						<span>${user.userName}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x110">登录密码：</label> 
						<input type="text" name="secrectCode" data-rule="密码:required" autocomplete="off" oncopy="return false" onpaste="return false" onfocus="this.type='password'">
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x110">确认密码：</label> 
						<input type="text" name="confirmpassword" data-rule="确认密码:required;match(password)" autocomplete="off" oncopy="return false" onpaste="return false" onfocus="this.type='password'">
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