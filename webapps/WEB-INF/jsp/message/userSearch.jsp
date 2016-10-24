<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/message/manage/getucuser.do">
    	<input type="hidden" name="msgOrgType" value="${search.msgOrgType}">
    	<input type="hidden" name="userIds" id="userIds" value="${search.userIds}">
    	<input type="hidden" name="pageSize" value="${pageSize}">
    	<input type="hidden" name="ids" id="lookupbackValue" value='${ids }'>
	    <div class="bjui-searchBar">
	    	<label>简称：</label><input type="text" value="<c:out value='${search.userName}'/>" name="userName" size="10" class="form-control"/>&nbsp;
	    	<button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>&nbsp;
	        <div class="pull-right">
	        	<button type="button" class="btn-red" data-toggle="lookupback" data-args="{userName:'全部', users:'0'}">选择全部</button>
	            <button type="button" class="btn-blue" data-toggle="lookupback" data-lookupid="ids" data-warn="请至少选择一位接收人" data-icon="check-square-o">选择选中</button>
	        </div>
	    </div>
    </form>
</div>
<div class="bjui-pageContent" id="userdiv">
    <table data-toggle="tablefixed" data-width="100%">
    	<c:if test="${search.msgOrgType==1}">
        <thead>
            <tr>
            	<th width="20%" align="center">客户账号</th>
                <th width="35%" align="center">客户简称</th>
                <th width="20%" align="center">所属会员</th>
                <th width="28"><!-- <input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck">--></th> 
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="obj" items="${list}" varStatus="status">
            <tr>
                <td>${obj.userCode}</td>
	    		<td>${obj.userName}</td>
	    		<td>${obj.ownerUserName}</td>
                <td><input type="checkbox" <c:if test="${userSet.contains(obj.id) }">checked</c:if> name="ids" data-toggle="icheck" value="{userName:'${obj.userName}', users:'${obj.id}'}"></td>
            </tr>
            </c:forEach>
        </tbody>
        </c:if>
        <c:if test="${search.msgOrgType==2}">
        <thead>
            <tr>
            	<th width="20%" align="center">会员账号</th>
                <th width="35%" align="center">会员简称</th>
                <th width="28"><!-- <input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"> --></th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="obj" items="${list}" varStatus="status">
            <tr>
                <td>${obj.userCode}</td>
    			<td>${obj.userName}</td>
                <td><input type="checkbox" <c:if test="${userSet.contains(obj.id) }">checked</c:if> name="ids" data-toggle="icheck" value="{userName:'${obj.userName}', users:'${obj.id}'}"></td>
            </tr>
            </c:forEach>
        </tbody>
        </c:if>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
<script>
$("#userdiv").on("ifChecked", ":checkbox", function(event){
	var userIds = $("#userIds").val();
	var _args = new Function('return '+ $(this).val())();
	$("#userIds").val(userIds + (userIds ? ',' : '') + _args.users);
});
$("#userdiv").on("ifUnchecked", ":checkbox", function(event){
	var userIds = $("#userIds").val();
	var _args = new Function('return '+ $(this).val())();
	if(userIds == _args.users)
		userIds = "";
	else
		userIds = userIds.replace(_args.users+",", "").replace(","+_args.users, "");
	$("#userIds").val(userIds);
});
</script>