<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$('#modifypwdForm').on("valid.form",function(e, form){
	$.ajax({
		url: '<%=request.getContextPath()%>/modifyPwd.do',
		type: 'post',
		data: {k:$("#k").val(),validCode:$("#validCode").val(),oldpassword:$.md5($("#oldpassword").val()),password:$.md5($("#password").val())},
		cache: 'false',
		dataType: 'json',
		success: function(data) {
			if(data.statusCode == 200) {
				$(this).bjuiajax('ajaxDone', data).dialog("closeCurrent")
			}else {
				$(this).bjuiajax('ajaxDone', data)
			}
		}
	});
})
var ti = 0;
function retrievePsw_send() {
	$.ajax({
		type : "post",
		url : "<%=request.getContextPath()%>/retrievePsw-send-login.do",
		data : {k:$("#k").val()},
		dataType : "json",
		timeout : 5000,
		cache : false,
		success : function(data, textStatus) {
			if(data.statusCode == 200){
				$("#modifypwdForm").validator("hideMsg", "#validCode");
				if (ti <= 0) {
			        ti = data.data * 60;
			        var self = $('#getCode');
			        self.addClass('btn-disable');
			        self.text(ti+"秒后可重新获取");
			        self.off("click");
			        var _inter = setInterval(function () {
			            if (ti <= 0) {
			                self.removeClass('btn-disable');
			                self.text('点击获取验证码');
			                self.on("click", retrievePsw_send);
			                window.clearInterval(_inter);
			            } else {
			                self.text(ti+"秒后可重新获取");
			                ti--;
			            }
			        }, 1000);
			    }
			}else{
				$("#modifypwdForm").validator("showMsg", data.data);
			}
		}
	});
}
$(document).ready(function(){
	　$("#getCode").on("click", retrievePsw_send);
});
</script>
<!-- 设置密码 -->
<div class="bjui-pageContent">
	<form id="modifypwdForm" action="<%=request.getContextPath() %>/modifyPwd.do" data-confirm-msg="确定要提交嘛？" >
	<input type="hidden" id="k" name="k" value="${k }">
		 <table class="table table-condensed table-hover" width="100%">
		 	<tbody>
		 		<tr>
					<td>
						<label class="control-label x110">短信验证码：</label> 
						<input data-autoClose="true" id="validCode" name="validCode" type="text" data-rule="required" data-msg-required="请填写短信验证码"  data-timely="0" autocomplete="off">
						<a class="btn btn-default" id="getCode">点击获取验证码</a>
					</td>
				</tr>
		 		<tr>
					<td>
						<label class="control-label x110">当前密码：</label>
						<input type="password" class="hide"/> 
						<input type="password" name="oldpassword" id="oldpassword" data-rule="当前密码:required;password"  data-timely="0" autocomplete="off" oncopy="return false" onpaste="return false">
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x110">新密码：</label> 
						<input type="password" name="password" id="password" data-rule="新密码:required;password;match[neq, oldpassword]"  data-timely="0" autocomplete="off" oncopy="return false" onpaste="return false">
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x110">确认密码：</label> 
						<input type="password" name="confirmpassword" data-rule="确认密码:required;match(password);password"  data-timely="0" autocomplete="off" oncopy="return false" onpaste="return false">
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
