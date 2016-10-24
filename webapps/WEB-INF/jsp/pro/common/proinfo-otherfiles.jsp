<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 其他附件信息 -->
    <table class="table table-bordered table-hover table-striped table-top" data-toggle="tablefixed">
    	<thead>
    	<tr>
    		<th width="20">序号</th>
    		<th width="80">附件明细</th>
    		<th width="80">附件</th>
    		<th width="40">是否对外披露</th>
    		<th width="80">最后上传时间</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="obj" items="${list}" varStatus="status">
    	<tr>
    		<td>${obj.id }</td>
    		<td>${obj.infoName }</td>
    		<td>    		<c:if test="${not empty obj.file1}">
            		<a target="_blank" href="${accessPath}p${obj.projectFileGuid},${obj.file1Link()}">${obj.file1Show()}</a>
            	</c:if>
            	<c:if test="${not empty obj.file2}">
            		|<a target="_blank" href="${accessPath}p${obj.projectFileGuid},${obj.file2Link()}">${obj.file2Show()}</a>
            	</c:if>
            	<c:if test="${not empty obj.file3}">
            		|<a target="_blank" href="${accessPath}p${obj.projectFileGuid},${obj.file3Link()}">${obj.file3Show()}</a>
            	</c:if>
            	<c:if test="${not empty obj.file4}">
            		|<a target="_blank" href="${accessPath}p${obj.projectFileGuid},${obj.file4Link()}">${obj.file4Show()}</a>
            	</c:if>
            	<c:if test="${not empty obj.file5}">
            		|<a target="_blank" href="${accessPath}p${obj.projectFileGuid},${obj.file5Link()}">${obj.file5Show()}</a>
            	</c:if></td>
             <td><c:if test="${obj.fileIsOpen == 1}">是</c:if><c:if test="${obj.fileIsOpen == 0}">否</c:if></td>
    		<td><fmt:formatDate value="${obj.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
