<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="bjui-pageContent">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/toolbox/expectprofit/calculate.do" method="post">
        <table class="table table-condensed table-hover" width="100%">
		 	<thead>
		 	</thead>
		 	<tbody>
		 		<tr>
					<td style="text-align:center;">
						<label class="control-label x110">项目编码：</label>
          				<input type="text" name="projectCode" id="projectCode" value="${search.projectCode }" class="form-control" size="15" />
					</td>
					<td style="text-align:center;">
						<label class="control-label x110">投资金额：</label>
          				<input type="text" name="orderMoney" id="orderMoney"  class="digitUppercase" value="${search.orderMoney }" class="form-control" size="15" />
          				<label id="upperAmount"></label>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;">
						<button type="submit" class="btn-blue" >计算预期收益</button>
					</td>
				</tr>
			</tbody>
		</table>
    </form>
    <c:if test="${not empty obj }">
    <table data-toggle="tablefixed">
		 	<thead>
		 		<tr>
		    		<th align="center" width="20%">金额</th>
		    		<th align="center" width="20%">项目期限</th>
		    		<th align="center" width="20%">还款方式</th>
		    		<th align="center" width="20%">预期收益率</th>
		    		<th align="center" width="20%">预期收益</th>
		    	</tr>
		 	</thead>
		 	<tbody>
		 		<tr>
					<td align="center" width="20%"><fmt:formatNumber type="number" maxFractionDigits="3" value="${search.orderMoney}" />元</td>
					<td align="center" width="20%">${obj.projectLimit }&nbsp;<c:forEach var="item" items="${projectLimitTypeList}"><c:if test="${item.typeId==obj.projectLimitTypeId}">${item.typeName}</c:if></c:forEach></td>
					<td align="center" width="20%">${obj.repayTypeName}</td>
					<td align="center" width="20%"><fmt:formatNumber type="number" maxFractionDigits="3" value="${obj.investProfit*100 }" />%</td>
					<td align="center" width="20%"><fmt:formatNumber type="number" maxFractionDigits="3" value="${obj.expectProfit }" />元</td>
				</tr>
			</tbody>
		</table>
	</c:if>
</div>
<script>
$.CurrentNavtab.addClass('bjui-layout');
$("#projectCode").on("change", function(){
	$("#orderMoney").val("");
});
</script>
