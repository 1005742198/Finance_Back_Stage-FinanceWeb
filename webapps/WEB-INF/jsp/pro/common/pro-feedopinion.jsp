<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="bjui-pageContent">
    <table class="table table-condensed table-hover" width="100%">
    	<tbody>
    	<c:forEach var="obj" items="${list}">
    	<tr>
    		<td width="80">操作人：</td>
    		<td>${obj.createOperatorName}</td>
    	</tr>
    	<tr>
    		<td>审核结果：</td>
    		<td>${obj.flowName}</td>
    	</tr>
    	<tr>
    		<td>审核意见：</td>
    		<td>${obj.flowFeedOpinion}</td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
