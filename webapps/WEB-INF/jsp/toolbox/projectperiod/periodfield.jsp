<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="bjui-pageContent">
	<div class="bjui-pageTop">
    <form id="pagerForm" data-toggle="ajaxsearch"  action="<%=request.getContextPath()%>/toolbox/projectperiod/calculateperiod.do">
            <div class="pull-right">
                <div class="btn-group">
                       <a href="<%=request.getContextPath()%>/toolbox/projectperiod/getprojectlist.do?default=1"
                       		class="btn btn-blue" data-toggle="dialog" data-width="1200" data-icon="plus"
                       		data-height="600" data-id="dialog-mask" data-mask="true">选择项目 </a>
                </div>
            </div>
    <input type="hidden" name="type" id="type" value = "${search.type }">
    <input type="hidden" name="pageSize" value="${pageSize}">
          <table class="table table-condensed table-hover">
		 	<thead>
		 	</thead>
		 	<tbody>
		 		<tr>
					<td>
						<label class="control-label x110">募集金额：</label>
          				<input type="text" name="projectMoney" id="projectMoney"  class="digitUppercase" value="<fmt:formatNumber value="${search.projectMoney}" pattern="#"/>" class="form-control" size="11" />
          				<label id="upperAmount"></label>
					</td>
					<td>
						<label class="control-label x110">投资收益率：</label>
          				<input type="text" name="investProfit" id="investProfit"  value="<fmt:formatNumber value="${search.investProfit*100}" pattern="0.00"/>" class="form-control" size="13" />%
					</td>
					<td colspan="2">
						<label class="control-label x110">还款方式：</label>  <!-- data-rule="required" -->
						<select name="repayTypeId" id="repayTypeId" data-rule="required" data-toggle="selectpicker" class="show-tick" style="display: none;">
							<option value="">-选择还款方式-</option>
							<c:forEach var="item" items="${systypeRepayList}" varStatus="status">
								<option value="${item.id}"  <c:if test="${item.id == search.repayTypeId}">selected="selected"</c:if>>${item.repayTypeName}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x110">项目期限：</label> 
						<input type="text" name="projectLimit" id="projectLimit" value="${search.projectLimit}" class="form-control" size="10" id="projectLimit" data-autoClose="true">
						<select  name="projectLimitTypeId" id="projectLimitTypeId" data-toggle="selectpicker" class="show-tick">
							<c:forEach var="item" items="${projectLimitTypeList}">
							<option value="${item.typeId}" <c:if test="${item.typeId==search.projectLimitTypeId}">selected="selected"</c:if>>${item.typeName}</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<label class="control-label x110">项目起息日：</label><!-- 预计起息日:required; -->
			            <input type="text" value="<fmt:formatDate value="${search.valueDate}" pattern="yyyy-MM-dd"/>" size="13" name="valueDate" id="valueDate" data-toggle="datepicker" data-min-date="{%y}-%M-%d" data-max-date="{%y+2}-%M-{%d+1}" data-no-holidays="true" data-nobtn="true">
					</td>
					<td>
						<label class="control-label x110">项目到期日：</label><!-- 预计到期日:required; -->
				        <input type="text" value="<fmt:formatDate value="${search.expireDate}" pattern="yyyy-MM-dd"/>" size="13" name="expireDate" id="expireDate" data-toggle="datepicker" data-min-date="{%y}-%M-%d" data-max-date="{%y+2}-%M-{%d+1}" data-no-holidays="true" data-nobtn="true">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x110">兑付日：</label> 
						<span id="settleInvestDaySpan">
						<c:if test="${repayTypeId==1 }">产品到期日的所属工作日</c:if>
						<c:if test="${repayTypeId!=1 }">
						<c:choose>
						<c:when test="${repayTypeId==5 }">产品设立日起每季末月</c:when>
						<c:when test="${repayTypeId==6 }">产品设立日起每年度 <input data-autoClose="true" type="text" id="settleInvestMonth" name="settleInvestMonth" value="${search.settleInvestMonth}" maxlength="2" size="3"> 月 </c:when>
						<c:otherwise>产品设立日起每月</c:otherwise>
						</c:choose>
						<input data-autoClose="true" type="text" id="settleInvestDay" name="settleInvestDay" value="${search.settleInvestDay}" maxlength="2" size="3"> 日的所属工作日
						</c:if>
						</span>		
					</td>
					<td colspan="2">
						<label class="control-label x110">还款日：</label>  <!-- data-rule="required;integer[+]" -->
						早于兑付日 <input type="text" name="repayPeriodDay" id="repayPeriodDay" value="<c:out value='${search.repayPeriodDay}'/>" maxlength="2" size="3"> 个工作日
					</td>
				</tr>
				<tr style="text-align:center;">
					<td colspan="1"></td>
					<td colspan="2" style="text-align:center;"><button type="submit" id="notExistProjectSubmit" class="btn-blue">生成分期信息</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置</a></td>
					<td colspan="1"></td>
				</tr>
			</tbody>
		</table>
    </form>
    
    <c:if test="${not empty periodList }">
    	<table data-width="100%">
    		<tr style="text-align:center;">
				<td style="text-align:center;">
					<label class="control-label x110">总还款金额：</label>
		            <fmt:formatNumber type="number" maxFractionDigits="3" value="${totalMoney}" />
				</td>
				<td style="text-align:center;">
					<label class="control-label x110">总还款本金：</label>
		            <fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrincipal}" />
				</td>
				<td style="text-align:center;">
					<label class="control-label x110">总还款利息：</label>
		            <fmt:formatNumber type="number" maxFractionDigits="3" value="${totolInterest}" />
				</td>
			</tr>
    	</table>
    </c:if>
</div>
	<c:if test="${not empty periodList }">
	    <table data-toggle="tablefixed" data-width="100%">
	    	<thead>
	    	<tr>
	    		<th align="center">期数</th>
	    		<th align="center">本期应还本金（元）</th>
	    		<th align="center">本期应还利息（元）</th>
	    		<th align="center">本期计息本金（元）</th>
	    		<th align="center">计息起始日</th>
	    		<th align="center">计息截止日</th>
	    		<th align="center">应还日期</th>
	    		<th align="center">应兑日期</th>
	    		<th align="center">计息方式</th>
	    	</tr>
	    	</thead>
	    	<tbody>
	    	<c:forEach var="obj" items="${periodList }">
		    	<tr>
		    		<td>${obj.periodNumber }</td>
		    		<td>${obj.principal }</td>
		    		<td>${obj.interest }</td>
		    		<td>${obj.interestPrincipal }</td>
		    		<td><fmt:formatDate value="${obj.interestStartDate}" pattern="yyyy-MM-dd"/></td>
		    		<td><fmt:formatDate value="${obj.interestEndDate}" pattern="yyyy-MM-dd"/></td>    		
		    		<td><fmt:formatDate value="${obj.planRepayDate}" pattern="yyyy-MM-dd"/></td>
		    		<td><fmt:formatDate value="${obj.payInvestDate}" pattern="yyyy-MM-dd"/></td>
		    		<td>${repayTypeDesc }</td>
		    		
		    	</tr>
	    	</c:forEach>
	    	</tbody>
	    </table>
	</c:if>
</div>
<c:if test="${not empty periodList }">
	<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
</c:if>
<script>
$.CurrentNavtab.addClass('bjui-layout');
$("#repayTypeId").on("change", function(e, data) {
	var html = "产品到期日的所属工作日";
	if($(this).val() != 1) {
		if($(this).val() == 5) {
			html = "产品设立日起每季末月";
		}else if($(this).val() == 6) {
			html = '产品设立日起每年度 <input type="text" class="form-control ok" style="width: 30px;" id="settleInvestMonth" name="settleInvestMonth" value="${obj.getSettleInvestMonthShow()}" maxlength="2" size="3"> 月';
		}else {
			html = "产品设立日起每月";
		}
		html += '<input type="text" class="form-control ok" style="width: 30px;" id="settleInvestDay" name="settleInvestDay" value="${obj.getSettleInvestDayShow()}" maxlength="2" size="3"> 日的所属工作日';
	}
	$("#settleInvestDaySpan").html(html);
});

function genExpireDate() {
	var add = $("#projectLimit").val();
	var valueDate = $('#valueDate').val();
	if(add && valueDate) {
		valueDate = valueDate.parseDate("yyyy-MM-dd");
		var limitType = $("#projectLimitTypeId").val();
		var yyyy = valueDate.getFullYear();
		var mm = valueDate.getMonth();
		if(limitType==1) {
			valueDate.setDate(valueDate.getDate()+parseInt(add));
		}else if(limitType==2) {
			valueDate.setMonth(valueDate.getMonth()+parseInt(add));
			if((valueDate.getFullYear()*12+valueDate.getMonth()) > yyyy*12+mm+parseInt(add))
				valueDate = new Date(valueDate.getFullYear(),valueDate.getMonth(),0);
		}else if(limitType==3) {
			valueDate.setFullYear(valueDate.getFullYear()+parseInt(add));
			if((valueDate.getFullYear()*12+valueDate.getMonth()) > (yyyy+parseInt(add))*12+mm)
				valueDate = new Date(valueDate.getFullYear(),valueDate.getMonth(),0);
		}
		$("#expireDate").val(valueDate.formatDate("yyyy-MM-dd"));
	}
}
$("#valueDate").on("blur", function(e, data){
	genExpireDate();
});
$('#projectLimit').on("blur", function() {
	genExpireDate();
});
$('#projectLimitTypeId').on("change", function() {
	genExpireDate();
});
$("#expireDate").on("input propertychange afterchange.bjui.datepicker", function(e, data){
	var valueDate = $('#valueDate').val();
	var expireDate = $('#expireDate').val();
	if(valueDate && expireDate) {
		$("#projectLimitTypeId").val(1).selectpicker('refresh');
		valueDate = valueDate.parseDate("yyyy-MM-dd");
		expireDate = expireDate.parseDate("yyyy-MM-dd");
		if((expireDate-valueDate)<0) {
			$("#projectLimit").val(0);
		}else {
			$("#projectLimit").val((expireDate-valueDate)/86400000);
		}
	}
});

/*  $(':submit').click(function(){
	var _this=$(this);
	if(_this.attr("id")=="existProjectSubmit") {
		$("#type").val(1);
	}else{
		$("#type").val(2);
	}
}); */

 $('#pagerForm').validator({
		rules: {
			settleInvestHasVal : function(element) {
				if($("#repayTypeId").val() == 6) {
					if($("#settleInvestMonth").val() != '' && $("#settleInvestDay").val() == '')
						return "日期不能为空";
					else if($("#settleInvestMonth").val() == '' && $("#settleInvestDay").val() != '')
						return "月份不能为空";
				} 
				return true;
			},
			validtwodecimal:function(element){
		    	var reg = /^\d{1,2}(\.\d{1,2})?$/;
		    	if(reg.test(element.value)){
		    		return true;
		    	}else{
		    		return "小于100且最多只支持2位小数";
		    	}
		    },
		    projectLimit:function(element) {
		    	var reg = /^[1-9]\d*$/;
		    	if(!reg.test(element.value)){
		    		return "请填写正整数";
		    	}
		    	var selectVal = $("#projectLimitTypeId").val();
		    	if(selectVal == 1) {
		    		if(element.value > 7300) {
		    			return "请填写小于7300的正整数";
		    		}
		    	}else if(selectVal == 2) {
		    		if(element.value > 240) {
		    			return "请填写小于240的正整数";
		    		}
		    	}else if(selectVal == 3) {
		    		if(element.value > 20) {
		    			return "请填写小于20的正整数";
		    		}
		    	}
		    	return true;
		    }
		},
		fields: {
			'projectMoney':'募集金额:required;integer[+];match[lte, canQuoteMoneyForJudege]',
			'investProfit':'预期收益率:required;validtwodecimal',
	        'projectLimit': 'projectLimit',
	        'valueDate':'项目起息日:required;date;match[gte, todayForJudge, date];validate(publishTime);validate(buyTimeEnd)',
	        'expireDate':'项目到期日:required;date;match[gte, valueDate, date];',
			'repayTypeId':'还款方式:required;',
	        'projectLimit': '项目期限:required;projectLimit'
	        /* 'settleInvestDay':'range[1~28];settleInvestHasVal;validate(settleInvestMonth);settleInvestHasVal',
	        'settleInvestMonth':'range[1~12];settleInvestHasVal;validate(settleInvestDay);settleInvestHasVal',
	        'repayPeriodDay':'required;integer[+]' */
	    } 
	}).on('click','#existProjectSubmit',function(e){
		$("#type").val(1);
		$("#projectMoney").attr("novalidate", "true");
		$("#investProfit").attr("novalidate", "true");
		$("#projectLimit").attr("novalidate", "true");
		$("#valueDate").attr("novalidate", "true");
		$("#expireDate").attr("novalidate", "true");
		$("#projectLimit").attr("novalidate", "true");
		$("#repayTypeId").attr("novalidate", "true");
		/* $("#settleInvestDay").attr("novalidate", "true");
		$("#settleInvestMonth").attr("novalidate", "true");
		$("#repayPeriodDay").attr("novalidate", "true"); */
	}).on("click", "#notExistProjectSubmit", function(){
		$("#type").val(2);
	})
</script>

