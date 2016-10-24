<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 其他附件 -->
<div class="bjui-pageContent tableContent">
        <table class="table table-bordered table-hover table-striped table-top" width="100%">
        	<thead>
        	<tr>
    		<th width="80">附件id</th>
    		<th width="80">附件名称</th>
    		<th width="80">附件说明</th>
    		<th>附件</th>
    		<th width="200">最后上传时间</th>
            </thead>
            <tbody>
               <c:forEach var="obj" items="${list}">
		    	<tr>
		    		<td>${obj.id }</td>
		    		<td>${obj.infoName}</td>
		    		<td>${obj.infoDesc}</td>
		    		<td>
						<c:if test="${not empty obj.file1}">
                    		<a target="_blank" href="${accessPath}u${obj.userFileGuid},${obj.file1Link()}">${obj.file1Show()}</a>
                    	</c:if>
                    	<c:if test="${not empty obj.file2}">
                    		|<a target="_blank" href="${accessPath}u${obj.userFileGuid},${obj.file2Link()}">${obj.file2Show()}</a>
                    	</c:if>
                    	<c:if test="${not empty obj.file3}">
                    		|<a target="_blank" href="${accessPath}u${obj.userFileGuid},${obj.file3Link()}">${obj.file3Show()}</a>
                    	</c:if>
                    	<c:if test="${not empty obj.file4}">
                    		|<a target="_blank" href="${accessPath}u${obj.userFileGuid},${obj.file4Link()}">${obj.file4Show()}</a>
                    	</c:if>
                    	<c:if test="${not empty obj.file5}">
                    		|<a target="_blank" href="${accessPath}u${obj.userFileGuid},${obj.file5Link()}">${obj.file5Show()}</a>
                    	</c:if>
					</td>
		    		<td><fmt:formatDate value="${obj.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		    	</tr>
			</c:forEach>
            </tbody>
        </table>
</div>
