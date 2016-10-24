<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 支付流水 -->
<div class="bjui-pageContent tableContent">
        <table data-toggle="tablefixed" class="table table-bordered table-hover table-striped table-top" data-height="300">
           <thead>
                <tr>
                    <th title="银行账号" width="150">银行账号</th>
                    <th title="支付流水" width="150">支付流水</th>
                    <th title="支付金额" width="150">支付金额(元)</th>
                    <th title="支付时间" width="150">支付时间</th>
                    <th title="支付到账时间" width="150">支付到账时间</th>
                    <th title="支付状态" width="150">支付状态</th>
                </tr>
            </thead>
            <tbody>
            	<c:if test="${not empty list }">
            		<c:forEach items="${list}" var="obj">
            			<tr>
            				<td>${obj.cardAccount}</td>
            				<td>${obj.paymentNo}</td>
            				<td>${obj.payMoney}</td>
            				<td><fmt:formatDate value="${obj.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            				<td><fmt:formatDate value="${obj.payResultTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            				<td>
            					<c:forEach items="${payStatus}" var="item">
            						<c:if test="${item.status == obj.payStatus}">
            							${item}
            						</c:if>
            					</c:forEach>
            				</td>
            			</tr>
            		</c:forEach>
            	</c:if>
            </tbody>
        </table>
</div>
