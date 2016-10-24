<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--投资兑付明细
查询时，只有查具体用户时，可以查所有期
在没有其他查询条件下，不能列出所有期
-->
<script type="text/javascript">
function callback(json) {
	if(json.statusCode == 200) {
		$(this).alertmsg("correct", json.message);
		$(this).dialog("closeCurrent");
		$(this).navtab("refresh");
	}else {
		$(this).alertmsg("error", json.message);
	}
}
</script>
<div class="bjui-pageContent tableContent" id="pro-drawbacklist-list">
	<form action="<%=request.getContextPath()%>/incomeright/proclaims/payinvest/dopayfailed.do" data-toggle="validate" data-confirm-msg="确定要提交嘛？"  data-callback="callback">
	<input type="hidden" name="repayPlanId" value="${repayPlanId }">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center">兑付期数</th>
    		<th align="center">投资者</th>
    		<th align="center">收款银行卡(*)</th>
    		<th align="center">兑付应划款金额(元)</th>
    		<th align="center">实际划款金额(元)</th>
    		<th align="center">划款时间</th>
    		<th align="center">划款状态</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="list" items="${list}">
    	<tr>
    		<td>${list.periodNumber }</td>
    		<td>${list.realName }</td>
    		<td>[${list.channelName}]${list.getCardInfoShow() }</td>
    		<td><fmt:formatNumber value="${list.totalPay}" pattern="0.00"/></td>
    		<td><fmt:formatNumber value="${list.payMoney}" pattern="0.00"/></td>
    		<td><fmt:formatDate value="${list.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    		<td><c:if test="${list.payStatus==3}">处理中</c:if><c:if test="${list.payStatus==2}">处理成功</c:if><c:if test="${list.payStatus==4}">处理失败</c:if></td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
    <div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn btn-close">关闭</button></li>
        <c:if test="${list.size()>0 }">
        <li><button type="submit" class="btn btn-blue">兑付</button></li>
        </c:if>
    </ul>
	</div>
	</form>
</div>