<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table width="100%">
<tr>
	<td colspan="3">
		<label>交易顾问：</label>
		<input type="text" name="memberName" value="<c:out value='${search.memberName}'/>" class="form-control" size="15" />
		<label>转让方：</label>
		<input type="text" name="loanUserName" value="<c:out value='${search.loanUserName}'/>" class="form-control" size="15" />
	</td>
</tr>
<tr>
	<td colspan="3">
		<label>&nbsp;挂牌天数：</label>
		<input type="text" name="projectLimitBegin" value="${search.projectLimitBegin }" class="form-control" size="5" data-rule="起始值:integer[+]"/>天
		<label>-</label>
		<input type="text" name="projectLimitEnd" value="${search.projectLimitEnd }" class="form-control" size="5" data-rule="integer[+];match[gte, projectLimitBegin]"/>天
	</td>
</tr>
<tr>
	<td colspan="3">
		<label>挂牌金额：</label>
		<input type="text" name="projectMoneyBegin" value="${search.projectMoneyBegin }" class="form-control" size="13" data-rule="起始值:number"/>元
		<label>-</label>
		<input type="text" name="projectMoneyEnd" value="${search.projectMoneyEnd }" class="form-control" size="13" data-rule="number;match[gte, projectMoneyBegin]"/>元
		<label>&nbsp;转让底价：</label>
		<input type="text" name="investAmountMinBegin" value="${search.investAmountMinBegin }" class="form-control" size="13" data-rule="起始值:number"/>元
		<label>-</label>
		<input type="text" name="investAmountMinEnd" value="${search.investAmountMinEnd }" class="form-control" size="13" data-rule="number;match[gte, investAmountMinBegin]"/>元
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
		<label>转让日期：</label>
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