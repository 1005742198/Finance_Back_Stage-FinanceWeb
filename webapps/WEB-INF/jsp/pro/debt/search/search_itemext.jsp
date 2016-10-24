<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table width="100%">
<tr>
	<td colspan="3">
		<label>融资顾问：</label>
		<input type="text" name="memberName" value="<c:out value='${search.memberName}'/>" class="form-control" size="15" />
		<label>融资方：</label>
		<input type="text" name="loanUserName" value="<c:out value='${search.loanUserName}'/>" class="form-control" size="15" />
	</td>
</tr>
<tr>
	<td colspan="3">
		<label >还款方式：</label> 
		<select name="repayTypeId" id="select2" data-toggle="selectpicker" class="show-tick" style="display: none;">
			<option value="">-全部-</option>
			<c:forEach var="item" items="${systypeRepayList}" varStatus="status">
				<option value="${item.id}"  <c:if test="${item.id==search.repayTypeId}">selected</c:if>>${item.repayTypeName}</option>
			</c:forEach>
		</select>
		<label >担保：</label> 
		<select name="isGuarantee" id="select2" data-toggle="selectpicker" class="show-tick" style="display: none;">
			<option value="">-全部-</option>
			<option value="1" <c:if test="${1==search.isGuarantee}">selected</c:if>>有担保</option>
			<option value="0" <c:if test="${0==search.isGuarantee}">selected</c:if>>无担保</option>
		</select>
		<label >质押：</label> 
		<select name="isPledge" id="select2" data-toggle="selectpicker" class="show-tick" style="display: none;">
			<option value="">-全部-</option>
			<option value="1" <c:if test="${1==search.isPledge}">selected</c:if>>有质押</option>
			<option value="0" <c:if test="${0==search.isPledge}">selected</c:if>>无质押</option>
		</select>
	</td>
</tr>
<tr>
	<td colspan="3">
		<label>融资金额：</label>
		<input type="text" name="projectMoneyBegin" value="${search.projectMoneyBegin }" class="form-control" size="13" data-rule="起始值:number"/>元
		<label>-</label>
		<input type="text" name="projectMoneyEnd" value="${search.projectMoneyEnd }" class="form-control" size="13" data-rule="number;match[gte, projectMoneyBegin]"/>元
		<label>&nbsp;起投金额：</label>
		<input type="text" name="investAmountMinBegin" value="${search.investAmountMinBegin }" class="form-control" size="13" data-rule="起始值:number"/>元
		<label>-</label>
		<input type="text" name="investAmountMinEnd" value="${search.investAmountMinEnd }" class="form-control" size="13" data-rule="number;match[gte, investAmountMinBegin]"/>元
	</td>
</tr>
<tr>
	<td colspan="3">
		<label>起息日：</label>
		<input type="text" name="valueDateBegin" value="${search.valueDateBegin }" class="form-control" size="15" data-toggle="datepicker"
			data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date"/>
		<label>-</label>
		<input type="text" name="valueDateEnd" value="${search.valueDateEnd }" class="form-control" size="15" data-toggle="datepicker"
			data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date"/>
		<label>&nbsp;到期日：</label>
		<input type="text" name="expireDateBegin" value="${search.expireDateBegin }" class="form-control" size="15" data-toggle="datepicker"
			data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date"/>
		<label>-</label>
		<input type="text" name="expireDateEnd" value="${search.expireDateEnd }" class="form-control" size="15" data-toggle="datepicker"
			data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date"/>
	</td>
</tr>
<tr>
	<td colspan="3">
		<label>录入日期：</label>
		<input type="text" name="createTimeBegin" value="${search.createTimeBegin }" class="form-control" size="15" data-toggle="datepicker"
			data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date"/>
		<label>-</label>
		<input type="text" name="createTimeEnd" value="${search.createTimeEnd }" class="form-control" size="15" data-toggle="datepicker"
			data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date"/>
		<label>&nbsp;审核日期：</label>
		<input type="text" name="ptAuditTimeBegin" value="${search.ptAuditTimeBegin }" class="form-control" size="15" data-toggle="datepicker"
			data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date"/>
		<label>-</label>
		<input type="text" name="ptAuditTimeEnd" value="${search.ptAuditTimeEnd }" class="form-control" size="15" data-toggle="datepicker"
			data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date"/>
	</td>
</tr>
<tr>
	<td colspan="3">
		<label>认购日期：</label>
		<input type="text" name="buyTimeStartBegin" value="${search.buyTimeStartBegin }" class="form-control" size="15" data-toggle="datepicker"
			data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date"/>
		<label>-</label>
		<input type="text" name="buyTimeStartEnd" value="${search.buyTimeStartEnd }" class="form-control" size="15" data-toggle="datepicker"
			data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date"/>
		<label>&nbsp;核保日期：</label>
		<input type="text" name="cfmRightTimeBegin" value="${search.cfmRightTimeBegin }" class="form-control" size="15" data-toggle="datepicker"
			data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date"/>
		<label>-</label>
		<input type="text" name="cfmRightTimeEnd" value="${search.cfmRightTimeEnd }" class="form-control" size="15" data-toggle="datepicker"
			data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date"/>
	</td>
</tr>
</table>