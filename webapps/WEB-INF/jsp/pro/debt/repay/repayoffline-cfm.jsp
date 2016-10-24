<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--线下还款操作 -->
<div class="bjui-pageHeader"  id="repayoffline-cfm-header">
<table class="table table-condensed table-hover" width="100%">
        <tbody>
            <tr>
                <td>
                    <label class="control-label x90">项目编号：</label>
                    <span>${project.projectCode}</span>
                </td>
                <td>
                    <label class="control-label x90 text-tit pull-left">项目名称：</label>
                    <span class="text-omit pull-left">${project.projectName}</span>
                 </td>
                <td>
                    <label class="control-label x90">还款期数：</label>
                    <span>${obj.periodNumber}</span>
                </td>
                <td>
                    <label class="control-label x90">应还日期：</label>
                    <span><fmt:formatDate value="${obj.planRepayDate}" pattern="yyyy-MM-dd"/></span>
                </td>
                <td>
					<label class="control-label x90">本期应还总额：</label> 
					<span><fmt:formatNumber value="${obj.principal+obj.interest+obj.overInterest}" pattern="0.00"/>元</span>
                </td>
            </tr>
            <tr>
                <td>
                    <label class="control-label x90">本期未还本金：</label>
                    <span><fmt:formatNumber value="${obj.principal-obj.paidPrincipal}" pattern="0.00" maxFractionDigits="2"/>元</span>
                </td>
                <td>
                    <label class="control-label x90">本期未还利息：</label>
                    <span><fmt:formatNumber value="${obj.interest-obj.paidInterest}" pattern="0.00" maxFractionDigits="2"/>元</span>
               </td>
                <td>
               		<label class="control-label x90">逾期罚息金额：</label> 
					<span><fmt:formatNumber value="${obj.overInterest-obj.paidOverInterest}" pattern="0.00"/>元</span>
				</td>
                <td>
					<label class="control-label x90">逾期天数：</label> 
					<span>${obj.overDay}天</span>
				</td>
                <td>
					<label class="control-label x90">本期未还总额：</label> 
					<span><fmt:formatNumber value="${obj.principal-obj.paidPrincipal+obj.interest-obj.paidInterest+obj.overInterest-obj.paidOverInterest}" pattern="0.00"/>元</span>
                </td>
            </tr>
   	</tbody>
  </table>
</div>
<div class="bjui-pageContent" style="height:300px;">
<form class="pageForm" data-toggle="validate" method="post">
<table id="payofflineTable" data-reload-navtab="true" class="table table-bordered table-hover table-striped table-top"  data-toggle="tabledit"
data-initnum="0" data-action="<%=request.getContextPath()%>/bizorderpayoffline/addpayoffline.do" data-single-noindex="true" data-callback="afterAdd">
     <thead>
          <tr data-idname="id">
          <input type="hidden" name="applyOrderId" value="${obj.id}"/>
       	<input type="hidden" name="projectId" value="${obj.projectId}"/>
       	<input type="hidden" name="exchangeId" value="${exchangeId}"/>
       	<input type="hidden" name="memeberId" value="${memeberId}"/>
       	<input type="hidden" name="applyOrderType" value="${applyOrderType}"/>
             <th title="付款银行" width="14%" data-noedit="true">
				<input  type="text" id="transferBankName[#index#]" name="transferBankName_#index#" data-suffix="_#index#" data-rule="required;checkBankName" size="30" data-rule-checkBankName="checkBankName" >
            </th>
            <th title="银行交易流水号" width="14%"><input type="text" id="paymentSeq[#index#]" name="paymentSeq" data-rule="required;checkPaymentSeq"  size="32" data-rule-checkPaymentSeq="checkPaymentSeq"></th>
            <th title="付款账户" width="14%"><input type="text" id="transferAccount[#index#]" name="transferAccount" data-rule="required;checkAccount" size="20" data-rule-checkAccount="checkAccount"></th>
            <th title="到账金额" width="13%"><input type="text" id="transferMoney[#index#]" name="transferMoney" data-rule="required;checkMoney" size="20" data-rule-checkMoney="checkMoney" class="digitUppercase"></th>
             <th title="付款用途" width="12%"><input type="text" id="remark[#index#]" name="remark"></th>
            <th title="到账时间" width="15%"><input type="text" id="transferTime[#index#]" name="transferTime" data-toggle="datepicker" data-pattern="yyyy-MM-dd HH:mm:ss" data-rule="required;datetime" ></th>
            <th  title="支付状态" width="6%">待支付</th>
            <c:if test="${obj.repayStatus == 4}">
	            <th title="" data-addbtn="false" width="12%" data-nohandle="true">
	            </th>
            </c:if>
            <c:if test="${obj.repayStatus != 4}">
	            <th title="新增" data-addbtn="true" width="12%" data-nohandle="true">
	                <a href="javascript:;" class="btn btn-blue" data-toggle="dosave">保存</a>
	                <a href="javascript:;" class="btn btn-red row-del" >删除</a>
	            </th>
            </c:if>
        </tr>
    </thead>
    <tbody>
    	<c:if test="${not empty list }">
    		<c:forEach items="${list}" var="item">
    			<tr data-id="${item.id}">
    				<td>${item.transferBankName}</td>
    				<td>${item.paymentSeq}</td>
    				<td>${item.transferAccount}</td>
    				<td>${item.transferMoney}</td>
    				<td>${item.remark}</td>
    				<td><fmt:formatDate value="${item.transferTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    				<td>${item.getPayStatusDesc()}</td>
    				<td data-noedit="true">
    					<c:if test="${item.payStatus != 2}">
    							<a href="javascript:;" class="btn btn-blue" data-toggle="doedit">编辑</a>
    							<a href="<%=request.getContextPath()%>/debt/proclaims/repay/repayoffline_pay.do?offlineId=${item.id}" class="btn btn-red row-del" data-nodel="true" data-confirm-msg="确认提交吗？" data-callback="callback">确认</a>
    					</c:if>
    				</td>
    			</tr>
    		</c:forEach>
    	</c:if>
    </tbody>
</table>
</form>
</div>
<script type="text/javascript">
function callback(json){
	if(json.statusCode == 200){
		$(this).alertmsg("correct", json.message);
		$(this).dialog("refresh");
	}else if(json.statusCode == 602){
		$(this).alertmsg("warn", json.message);
	}else{
		$(this).alertmsg("error", json.message);
	}
	
}
function afterAdd(){
	$(this).dialog("refresh");
}

function checkBankName(element){
	if(element.value.length > 15){
		return {"error": "请填写15位长度以内的银行名称"}; 
	}
}
function checkPaymentSeq(element){
	if(element.value.length > 32){
		return {"error": "请填写32位长度以内的支付流水"}; 
	}
}
function checkAccount(element){
	var reg = /^(\d+)$/;
	if(!reg.test(element.value) || element.value.length > 50){
		return {"error": "请正确填写银行账号"}; 
	}
}
function checkMoney(element){
	var reg = /^(\d{0,12}(\.\d{1,2})?)$/;
	if(!reg.test(element.value) || element.value <= 0){
		return {"error": "请输入正确的数值"}; 
	}
}
</script>
