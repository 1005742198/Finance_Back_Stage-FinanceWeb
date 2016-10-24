<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 项目类型 -->
<script type="text/javascript">
//修改回调
function afterEdit(json){
	if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
		$(this).alertmsg('ok',json.message)
		$("#pagerForm").submit();
	}else
		$(this).alertmsg('error',json.message);
	
	
}
//删除回调
function afterDel(json){
	if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) 
		$(this).alertmsg('ok',json.message);
	else
		$(this).alertmsg('error',json.message);
	
	$("#pagerForm").submit();
}
</script>
<div class="bjui-pageHeader">
    <form id="pagerForm" action="<%=request.getContextPath()%>/protocol/list.do" data-toggle="ajaxsearch"  method="post">
        <input type ="hidden" name ="protocolType" value="2"/>
        <div class="bjui-searchBar">
            <label>所属产品类型：</label>&nbsp;
            <select name="typeId"  data-toggle="selectpicker" class="show-tick" style="display: none;">
			    <option value="">全部</option>
				<c:forEach var="item" items="${systypeProductList}">
					<option value="${item.id}" <c:if test="${typeId==item.id}">selected</c:if>>${item.typeName}</option>
				</c:forEach>       
            </select>
            <label>项目类型名称：</label>
            <input type="text" name="subTypeName" value="<c:out value='${subTypeName}'/>" size="15"/>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>&nbsp;
            <a class="btn btn-default" href="javascript:;"   data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>&nbsp;
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <form action="" id="j_custom_form" class="pageForm" data-toggle="validate" method="post" >
        <table id="tabledit1"  class="table table-bordered table-hover table-striped table-top" data-toggle="tabledit" data-initnum="0" data-action="<%=request.getContextPath() %>/systype/editprojecttype.do" data-single-noindex="true" data-callback="afterEdit">
            <thead>
                <tr>
                    <th width="5%" title="序号"  data-noedit="true"><input type="text" name="id"  size="2" readonly	/></th>
                    <th width="35%" title="所属产品类型"><input type="text" name="typeName" data-rule="required" value="" size="5"></th>
                    <th width="35%" title="项目类型名称">
                    <th width="35%" title="操作">
                    </th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="obj" items="${list}" varStatus="status"> 
            	<input type="hidden" value ="${obj.id }" name ="id"/>
                <tr>
                    <td data-noedit="true">${obj.agreementSubType }</td>
                    <td>${obj.typeName }</td>
                    <td>
                    	${obj.subTypeName}
                    </td>
                    <td data-noedit="true" data-notread="true">
                        <a data-nodel="true" href="<%=request.getContextPath() %>/protocol/view.do?id=${obj.id }" data-width="1000" data-height="800" data-mask="true" data-toggle="dialog" class="btn btn-blue">协议管理</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </form>
</div>
