<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">

		function validLoginName(element){
			if($("#loginNameval").val() == element.value)
				return true;
			return $.post( "<%=request.getContextPath() %>/memberoperator/validloginname.do",
					{"loginName":element.value},
					function(data){
					}
				);
		}
		
		function validPhone(element){
			if($("#phoneval").val() == element.value)
				return true;
			return $.post( "<%=request.getContextPath() %>/memberoperator/validphone.do",
					{"phone":element.value,"memberId":${memberId }},
					function(data){
					}
				);
		}
		
		function validIdNumber(element){
			if($("#idTypeval").val() == $("#idType").val() && $("#idNumberval").val() == element.value)
				return true;
			return $.post( "<%=request.getContextPath() %>/memberoperator/valididnumber.do",
					{"idNumber":element.value,
					 "idType" : $("#idType").val(),"memberId":${memberId }
					},
					function(data){
					}
				);
		}
		
		function validEmail(element){
			if($("#emailval").val() == element.value)
				return true;
			return $.post( "<%=request.getContextPath() %>/memberoperator/validemail.do",
					{"email":element.value,"memberId":${memberId }},
					function(data){}
				);
		}
		
		function checkIdNumber(element){
			if($("#idNumber").val() != ""){
				$("#idNumber").trigger("validate");
			}
		}
		
		function editcallback(json){
			if(json.statusCode == 200){
				$(this).bjuiajax('refreshLayout', {target:'#operator',url:$("#operator_link").attr('href')});
			}else{
				$(this).bjuiajax('ajaxDone', json);
			}
			
		}
		
</script>
<!-- 维护管理员，只支持一个-->
<div class="bjui-pageContent">
	<form action="<%=request.getContextPath() %>/memberoperator/advisor-rz/edit-advisor-admin.do" data-toggle="validate" data-callback="editcallback" data-loadingmask="false">
		 <table class="table table-condensed table-hover" width="100%">
			 	<thead>
			 		<tr><th colspan="2">设置/重设管理员(一个顾问暂时只能开通一个管理员)</th></tr>
			 	</thead>
				<tr>
					<td colspan="2">
						<label class="control-label x130">管理员登录名：</label> 
						<c:if test="${operator.loginName != null }">
						<input type="text" name="loginName" value="<c:out value='${operator.loginName }'/>" data-rule="required;validLoginName" data-rule-validLoginName="validLoginName" >
						<input type="hidden" name="id" value="${operator.id }" ></c:if>
						<c:if test="${operator.loginName == null }">
						<input type="text" name="loginName" value=""  data-rule="required;validLoginName" data-rule-validLoginName="validLoginName" ></c:if>
						<input type="hidden" name="memberId" value="${memberId }"  data-rule="required" >
						<input type="hidden" id="loginNameval" value="${operator.loginName}">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x130">是否开设业务权限：</label> 
						<input type="checkbox" name="all" value="1" data-toggle="icheck" data-label="" <c:if test="${operator.operatorType==3}">checked</c:if>>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x130">手机号：</label> 
						<input type="hidden" id="phoneval" value="${operator.phone}">
						<input type="text" name="phone" value="${operator.phone }" data-rule="required;mobile;validPhone" data-rule-validPhone="validPhone" >
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x130">真实姓名：</label> 
						<input type="text" name="realName" value="<c:out value='${operator.realName }'/>" data-rule="required">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x130">证件类型：</label> 
						<input type="hidden" id="idTypeval" value="<c:out value='${operator.idType}'/>">
						<select name="idType" id="idType" data-val="${operator.idType}" data-toggle="selectpicker" data-rule="checkIdNumber" data-rule-checkIdNumber="checkIdNumber">
                        	<c:forEach var="idType" items="${idTypeList}">
                        	<option value="${idType.typeId }" <c:if test="${idType.typeId==operator.idType}">selected="selected"</c:if>>${idType.typeName }</option>	
                        	</c:forEach>
                        </select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x130">证件号码：</label> 
						<input type="hidden" id="idNumberval" value="<c:out value='${operator.idNumber}'/>">
						<input type="text" id="idNumber" name="idNumber" value="<c:out value='${operator.idNumber }'/>"  data-rule="required;validIdNumber" data-rule-validIdNumber="validIdNumber">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x130">email：</label> 
						<input type="hidden" id="emailval" value="<c:out value='${operator.email}'/>">
						<input type="text" name="email" value="<c:out value='${operator.email }'/>"  data-rule="required;email;validEmail" data-rule-validEmail="validEmail">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x130">职务：</label> 
						<input type="text" name="duty"  value="<c:out value='${operator.duty }'/>">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x130">所属部门：</label> 
						<input type="text" name="department"  value="<c:out value='${operator.department }'/>">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x130">备注说明：</label> 
						<textarea cols="30" rows="4" data-toggle="autoheight" name="remark" ><c:out value='${operator.remark }'/></textarea>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
		    			<button class="btn btn-blue">保存</button>
		    			<button type="button" class="btn-close">关闭</button>
					</td>
				</tr>
		 </table>
	</form>
</div>
