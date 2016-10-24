<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
function resendCallback(json) {
	if(json.statusCode == 200) {
		$(this).alertmsg("correct", json.message);
		$(this).dialog("refresh");
	}else {
		$(this).alertmsg("error", json.message);
	}
}
</script>
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/user/sendstatus.do?userId=${search.userId}">
    	<input type="hidden" name="pageSize" value="${pageSize}">
    </form>
    <div style="text-align:center">
    <c:if test="${canResend }">
    <a href="/user/resend.do?userId=${search.userId}" data-toggle="doajax" data-callback="resendCallback" class="btn btn-red">重新发送</a>
    </c:if>
    </div>
</div>
<div class="bjui-pageContent">
    <table data-toggle="tablefixed" data-width="100%">
        <thead>
            <tr>
                <th>手机号</th>
                <th>发送通道</th>
                <th>发送时间</th>
                <th>发送状态</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="list" items="${list}" varStatus="status">
            <tr>
                <td>${list.mobileNo}</td>
                <td><c:choose><c:when test='${list.smsChannel=="Sys_Sms_URL_Jiangu"}'>建谷</c:when><c:otherwise>未知</c:otherwise></c:choose></td>
                <td><fmt:formatDate value="${list.realSendTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><c:choose><c:when test="${list.sendStatus==1}">成功</c:when><c:otherwise>失败</c:otherwise></c:choose></td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
