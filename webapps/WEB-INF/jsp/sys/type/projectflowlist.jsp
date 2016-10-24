<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 工作流列表 -->
<div class="bjui-pageContent">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th width="5%">编号</th>
    		<th>工作流名称</th>
    		<th>工作流内容模板</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="list" items="${list}" varStatus="statu">
    	<tr>
    		<td>${list.id}</td>
    		<td>${list.flowName}</td>
    		<td>${list.flowTemplate}</td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
