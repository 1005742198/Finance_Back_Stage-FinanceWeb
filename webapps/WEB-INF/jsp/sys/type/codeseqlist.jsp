<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 序列号编码规则列表 -->
<div class="bjui-pageContent">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th>编号</th>
    		<th>编码序列名称</th>
    		<th>编码前缀</th>
    		<th>编码总长度</th>
    		<th>编码含义描述</th>
    		<th>日期</th>
    		<th>当前值</th>
    		<th>增量值</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="list" items="${list}" varStatus="statu">
    	<tr>
    		<td>${list.id}</td>
    		<td>${list.codeSeqName}</td>
    		<td>${list.codePrefix}</td>
    		<td>${list.codeLength}</td>
    		<td>${list.remark}</td>
    		<td>${list.codeSeqDate}</td>
    		<td>${list.currentVal}</td>
    		<td>${list.incrementVal}</td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
