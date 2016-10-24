<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
	function callback(json){
		if(json.statusCode == 200){
			$(this).alertmsg("correct", json.message);
			$(this).navtab("refresh");
		}else{
			$(this).alertmsg("error", json.message);
		}
	}
	function formcallback(json){
		if(json.statusCode == 200){
			$(this).alertmsg("correct", json.message);
		}else{
			$(this).bjuiajax('ajaxDone', json)
		}
	}
	function closeDialog(){
		$("#pro-review").hide();
	}
</script>
<div class="bjui-pageContent"  id="pro-review">
	<form id="form" action="<%=request.getContextPath() %>/protocol/save.do"  data-reload-navtab="true" data-confirm-msg="确定要提交嘛？" data-toggle="validate" data-callback="formcallback">
		<input type="hidden" name="id" value="${protocol.id}">
		<table class="table-condensed" width="100%">
		 		<%-- <tr>
					<td>
						<label class="x130">协议类型：</label> 
						${systypeProject.typeName}-${productTypeName }
					</td>
				</tr> --%>
				<tr>
					<td>
						<textarea data-toggle="kindeditor" style="width:100%;height:600px;" data-filter-mode="false" data-autoHeightMode="true" name="protocolText" maxlength="65535"  data-rule="required;">${protocol.agreementText}</textarea>
					</td>
				</tr>
				<tr>
					<td align="center">
	    			<button type="submit" class="btn-blue">保存</button>
	    			<!-- <button type="button"  onclick="close()"  class="btn btn-close">关闭</button> -->
	    			<c:if test="${protocolType==2}"><button type="button" class="btn-close" data-icon="close" onclick="closeDialog()" >关闭</button></c:if>
					</td>
				</tr>
		 </table>
	</form>
</div>