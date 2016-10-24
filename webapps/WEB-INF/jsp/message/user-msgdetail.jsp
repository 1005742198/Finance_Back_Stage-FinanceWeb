<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<div class="bjui-pageContent">
	<h3 class="text-center">${msgSystem.msgTitle }</h3>
	<p class="clearfix"><span class="text-muted pull-right"><fmt:formatDate value="${msgSystem.msgTime }"/></span></p>
	<hr style="margin:0 0 10px;" />
	<p class="text-indent">${msgSystem.msgText }</p>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">关闭</button></li>
    </ul>
</div>