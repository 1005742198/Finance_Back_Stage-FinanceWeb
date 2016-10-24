<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table width="100%">
<tr>
	<td colspan="3">
		<label>费用时间：</label><input type="text" name="createTimeBegin" value="${search.createTimeBegin }" data-toggle="datepicker" size="10"
			data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date">-
		<input type="text" name="createTimeEnd" value="${search.createTimeEnd }" data-toggle="datepicker" size="10"
			data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date">
	</td>
</tr>
</table>