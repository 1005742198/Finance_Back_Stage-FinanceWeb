<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 项目动态，包含了所有对项目的后台操作日志 -->
<div class="bjui-pageHeader">
    
</div>
<div class="bjui-pageContent">
    <table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
    	<thead>
    	<tr>
    		<th width="5%">序号</th>
            <th width="35%">名称</th>
            <th width="35%">含义</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="obj" items="${list}" varStatus="status"> 
                <tr>
                    <td data-noedit="true">${status.index+1}</td>
                    <td>${obj.getKey() }</td>
                    <td>
                    	${obj.getDescription()}
                    </td>
                </tr>
            </c:forEach>
    	</tbody>
    </table>
</div>

