<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
function customCallback(json) {
	if(json.statusCode == 200) {
		$(this).alertmsg("correct", json.message, {mask:true,autoClose:false,okCall:function(){$.CurrentDialog.dialog("closeCurrent");$(this).dialog({id:'dialog-mask-editPage',onClose:function(){$(this).navtab("refresh");},title:'编辑',width:1000,height:600,mask:true,url:'<%=request.getContextPath()%>/user/member/toEditPage.do?id='+json.id});}});
	}else {
		$(this).alertmsg("error", json.message);
	}
}
function validUserName(element){
	return $.post( "<%=request.getContextPath()%>/user/validusername.do",
		{"userName":element.value,"isUpdate":0,"userId":-1},
		function(data){
		}
	);
}
function validCompanyCodeName(element){
	if($("#companyOrgCode").val() == '')
		return;
	if($("#companyName").val() == '')
		return;
	return $.post( "<%=request.getContextPath()%>/user/validCompanyName.do",
		{"companyOrgCode":$("#companyOrgCode").val(),"companyName":$("#companyName").val()},
		function(data){
		}
	);
}
$("#companyName").on("blur", function(){
	if($("#companyName").val() == '')
		return;
	$.post("<%=request.getContextPath()%>/user/companySearchName.do","term="+$("#companyName").val(),function(data) {
		if(data[0] != undefined) {
			$("#companyOrgCode").val(data[0].value);
			$('#companyOrgCode').attr("readonly", "readonly");
			$('#companyName').attr("readonly", "readonly");
		}
	});
})
$("#companyOrgCode").on("blur", function(){
	if($("#companyOrgCode").val() == '')
		return;
	$.post("<%=request.getContextPath()%>/user/companySearchCode.do","term="+$("#companyOrgCode").val(),function(data) {
		if(data[0] != undefined) {
			$("#companyName").val(data[0].name);
			$('#companyOrgCode').attr("readonly", "readonly");
			$('#companyName').attr("readonly", "readonly");
		}
	});
})
$('#companyOrgCode').on('afterchange.bjui.lookup', function(e, data) {
	$('#companyOrgCode').attr("readonly", "readonly");
	$('#companyName').attr("readonly", "readonly");
})
function reset() {
	$.CurrentDialog.find("input[type='text']").val("");
	$('#companyOrgCode').removeAttr("readonly");
	$('#companyName').removeAttr("readonly");
}
</script>
<!-- 增加个人投资者 -->
<div class="bjui-pageContent">
    <form action="<%=request.getContextPath()%>/user/member/add.do" data-toggle="validate"
     data-reload-navtab="true" data-callback="customCallback" data-loadingmask="true">
		 <table class="table table-condensed table-hover">
                <tbody>
                	<tr>
                        <td colspan="2">
                            <label class="control-label x100">会员全称：</label>
                            <input maxlength="200" type="text" name="realName"  size="35"  data-rule="required;">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label class="control-label x100">会员简称：</label>
                            <input maxlength="60" type="text" name="userName"  size="20"  data-rule="required;validUserName" data-rule-validUserName="validUserName">
                        </td>
                    </tr>
                    <tr id="companyOrgCodeTR">
                        <td colspan="2">
                            <label class="control-label x100">组织机构代码：</label>
                            <!-- <input data-toggle="tags" data-width="210" data-url="<%=request.getContextPath()%>/user/companySearchCode.do" data-max="1" type="text" name="companyOrgCode" id="companyOrgCode" size="20"  data-rule="required;validCompanyName" data-rule-validCompanyName="validCompanyName">-->
                            <input data-toggle="lookup" data-title="机构选择" data-url="<%=request.getContextPath()%>/user/companySearch.do" data-width="600" data-height="400" type="text" name="companyOrgCode" value="${user.companyOrgCode }" id="companyOrgCode" size="20" data-rule="required;jgcode" data-rule-jgcode="[/^(\S{10}|\S{18})$/, '代码不正确']" data-rule-validCompanyName="validCompanyName" data-ok="">
                             <span class="">亦可输入社会信用代码</span>
                        </td>
                    </tr>
                    <tr id="companyOrgCodeTR">
                        <td colspan="2">
                            <label class="control-label x100">机构全称：</label>
                           <!-- <input data-toggle="tags" data-width="210" data-url="<%=request.getContextPath()%>/user/companySearchName.do" data-max="1" type="text" name="companyName" id="companyName" size="20"  data-rule="required;validCompanyName" data-rule-validCompanyName="validCompanyName">-->
                           <input maxlength="200" type="text" name="companyName" value="${user.companyName }" id="companyName" size="20" data-rule="required;" data-ok="">
                        </td>
                    </tr>
                </tbody>
            </table>
    </form>
</div>

<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">关闭</button></li>
        <li><button type="submit" class="btn-blue" data-icon="save">保存</button></li>
        <li><button type="button" class="btn-green" onclick="reset()">重填</button></li>
    </ul>
</div>
