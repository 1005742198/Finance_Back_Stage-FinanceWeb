<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String host = request.getServerName();
if(host.indexOf(".com") > 0) {
	host = host.substring(0, host.indexOf(".com"));
	host = host.substring(host.lastIndexOf(".")+1);
}
%> 
<html>
	<head>
	<script type="text/javascript" src="//cf1.<%=host %>.com/base/jquery-1.7.2.min.js"></script><script>
	$(function(){
		if($("#requestThird").attr("action")!=""){
			$("#requestThird").submit();
		}
	});
</script>
	</head>
	<body>
		<form id="requestThird" action="${action}" method="post" >
			<input type="hidden" name="message" value="${message}">
			<input type="hidden" name="signature" value="${signature}">
		</form>
	</body>
</html>
	

