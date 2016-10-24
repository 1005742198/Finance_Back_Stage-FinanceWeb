<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 其他附件 -->
<div class="bjui-pageContent tableContent">
        <table class="table table-bordered table-hover table-striped table-top" width="100%">
        	<thead>
        	<tr>
    		<th width="80">账户名称</th>
    		<th width="80">开户行</th>
    		<th width="200">账户号码</th>
    		<th width="120">开户行所在地</th>
    		<th width="100">分支行</th>
    		<th width="80">默认收款账户</th>
            </thead>
            <tbody>
               <c:forEach var="obj" items="${list}">
		    	<tr>
		    		<td>${obj.accountName}</td>
                    <td>${obj.channelName}</td>
                    <td>${obj.cardAccount}</td>
                    <td>${obj.provinceName}${obj.cityName}</td>
                    <td>${obj.subBankName}</td>
                    <td><c:if test="${obj.defaultCard==1}">是</c:if><c:if test="${obj.defaultCard==0}">否</c:if></td>
		    	</tr>
			</c:forEach>
            </tbody>
        </table>
</div>
