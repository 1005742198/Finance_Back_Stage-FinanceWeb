<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table width="100%">
<tr>
	<td colspan="3">
		<label>融资顾问：</label>
		<input type="text" name="memberName" value="<c:out value='${search.memberName}'/>" class="form-control" size="15" />
		<label class="control-label x110">产品类型：</label> 
		<select name="projectTypeId" id="select1" data-toggle="selectpicker" class="show-tick" style="display: none;">
			<option value="">-全部-</option>
			<c:forEach var="item" items="${systypeProjectList}">
			<option value="${item.id}" <c:if test="${search.projectTypeId==item.id}">selected</c:if>>${item.typeName}</option>
			</c:forEach>
		</select>
		<label >还款方式：</label> 
		<select name="repayTypeId" id="select2" data-toggle="selectpicker" class="show-tick" style="display: none;">
			<option value="">-全部-</option>
			<c:forEach var="item" items="${systypeRepayList}" varStatus="status">
				<option value="${item.id}"  <c:if test="${item.id==search.repayTypeId}">selected</c:if>>${item.repayTypeName}</option>
			</c:forEach>
		</select>
	</td>
</tr>
<tr>
	<td colspan="3">
		<label>还款日期：</label>
		<input type="text" name="planRepayDateBegin" value="${search.planRepayDateBegin}" class="form-control" size="15" data-toggle="datepicker"
			data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date"/>
		<label>-</label>
		<input type="text" name="planRepayDateEnd" value="${search.planRepayDateEnd}" class="form-control" size="15" data-toggle="datepicker"
			data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date"/>
	</td>
</tr>
</table>