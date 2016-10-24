<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="bjui-pageContent tableContent">
	<form id="modifypwdForm" action="<%=request.getContextPath() %>/smstest/send.do" data-toggle="validate" data-confirm-msg="确定要提交嘛？" data-callback="updatePasswordCallback">
		 <table class="table table-bordered table-hover table-striped table-top" width="100%">
		 	<tbody>
		 		<tr>
					<td>
						<label class="control-label x110">接收手机号：</label> 
						<input name="phone" type="text" data-rule="required" autocomplete="off">
					</td>
				</tr>
		 		<tr>
					<td>
						<label class="control-label x110">选择通道：</label>
						<select name="channel" data-rule="required;">
                            <option value="">请选择</option>
                            <option value="1">建谷.短信宝</option>
                            <option value="2">容联.云通讯</option>
                        </select>
					</td>
				</tr>
				<tr>
					<td align="center">
		    			<button class="btn btn-blue">发送</button>
					</td>
				</tr>
		 </table>
	</form>
</div>
