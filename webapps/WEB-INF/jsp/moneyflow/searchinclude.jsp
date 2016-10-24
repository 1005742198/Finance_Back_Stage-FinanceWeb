<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table width="100%">
<tr>
	<td>
		<label>支付状态：</label> 
		<select name="payStatus" id="select2" data-toggle="selectpicker" class="show-tick">
				<option value="">全部</option>
				<option value="2" <c:if test="${search.payStatus==2}">selected</c:if>>支付成功</option>
				<option value="5" <c:if test="${search.payStatus==5}">selected</c:if>>部分支付</option>
				<option value="1" <c:if test="${search.payStatus==1}">selected</c:if>>待支付</option>
		</select>
	</td>
	<td>
		<label class="control-label x130">结算渠道：</label> 
		<select id="payclearId" name="payclearId" data-toggle="selectpicker" >
           <option value="">-全部-</option>
           <c:if test="${!empty clearcenters}">
              <c:forEach items="${clearcenters}" var="clearcenter">
              	  <option value="${clearcenter.paycenterId}" <c:if test="${search.payclearId==clearcenter.paycenterId}">selected</c:if>>${clearcenter.payCenterName }</option>
              	</c:forEach>
            </c:if>
        </select>
	</td>
	<td>
		<label>资金支付时间：</label><input type="text" name="payCfmTimeBegin" value="${search.payCfmTimeBegin }" data-toggle="datepicker" size="10"
			data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date">-
		<input type="text" name="payCfmTimeEnd" value="${search.payCfmTimeEnd }" data-toggle="datepicker" size="10"
			data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date">
	</td>
</tr>
</table>