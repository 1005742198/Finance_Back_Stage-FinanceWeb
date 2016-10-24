<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 用户类型 -->
<div class="bjui-pageContent">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th width="5%">序号</th>
    		<th>用户身份类型</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="list" items="${list}" varStatus="statu">
    	<tr>
    		<td>${statu.index +1}</td>
    		<td>${list.userTypeName}</td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
