<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--金融资产转让线下支付凭证到款操作 -->
<div class="bjui-pageHeader"  id="bidlist-payoffline-cfm-header">
<table class="table table-condensed table-hover" width="100%">
        <tbody>
            <tr>
                <td>
                    <label class="control-label x120">投资者：</label>
                    <span>${orderApply.orderUserName}</span>
                </td>
                <td>
                    <label class="control-label x120">认购时间：</label>
                    <span><fmt:formatDate value="${orderApply.createTime}"/></span>
                </td>
                <td>
                    <label class="control-label x120">认购金额：</label>
                    <span><fmt:formatNumber value="${orderApply.orderMoney}" pattern="0.00" maxFractionDigits="2"/>元</span>
                </td>
            </tr>
            <tr>
                <td>
                    <label class="control-label x120">已支付金额：</label>
                    <span><fmt:formatNumber value="${orderApply.paidMoney}" pattern="0.00" maxFractionDigits="2"/>元</span>
                </td>
                <td colspan="2">
                    <label class="control-label x120">需支付金额：</label>
                    <c:choose>
                    	<c:when test="${orderApply.orderMoney - orderApply.paidMoney <= 0 }">
                    		<span>支付完成</span>
                    	</c:when>
                    	<c:otherwise>
                    		<span><fmt:formatNumber value="${orderApply.orderMoney - orderApply.paidMoney}" pattern="0.00" maxFractionDigits="2"/>元</span>
                    	</c:otherwise>
                    </c:choose>
                </td>
            </tr>
   	</tbody>
  </table>
</div>
<form id="payoffline_form" action="" data-toggle="validate" method="post" >
<div class="bjui-pageContent" id="bidlist-payoffline-cfm-list">
<input type="hidden" name="applyOrderType" id="applyOrderType" value="${applyOrderType}">
 <table data-toggle="tablefixed" data-width="100%" data-height="300">
    	<thead>
    	<tr>
    		<th align="center" width="16%">付款银行信息</th>
    		<th align="center" width="10%">付款金额</th>
    		<th align="center" width="13%">付款时间</th>
    		<th align="center" width="12%">付款用途</th>
    		<th align="center" width="11%">是否到款</th>
    		<th align="center" width="11%">到款金额</th>
    		<th align="center" width="16%">到款时间</th>
    		<th align="center" width="6%">支付状态</th>
    		<th align="center" width="6%">操作</th>
    	</tr>
    	</thead>
    	<tbody>
    	  <c:if test="${not empty list}">
    	  	<c:forEach items="${list}" var="obj" varStatus="status">
    		<tr>
    			<td>
    				付款银行：${obj.transferBankName}<br/>
    				付款账户：${obj.transferAccount}<br/>
    				银行流水号：${obj.paymentSeq}
    			</td>
    			<td><fmt:formatNumber value="${obj.transferMoney}"  pattern="0.00" maxFractionDigits="2"/>元</td>
    			<td>
    				<fmt:formatDate value="${obj.transferTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
    			</td>
    			<td>${obj.remark}</td>
    			<td>
    				<input type="hidden" name="payOfflineId.${status.index+1}" value="${obj.id}">
    				<c:choose>
    					<c:when test="${obj.transferStatus == 1}">
    						<input type="radio" name="transferStatus.${status.index+1}" value="3" data-toggle="icheck" data-label="未到账"  index="${status.index+1}" >
							<input type="radio" name="transferStatus.${status.index+1}" value="2" data-toggle="icheck" data-label="已到账"  index="${status.index+1}" checked>	
    					</c:when>
    					<c:otherwise>
    						<input type="radio" name="transferStatus.${status.index+1}" value="3" data-toggle="icheck" data-label="未到账" <c:if test="${obj.transferStatus == 3}">checked</c:if> disabled="disabled">
							<input type="radio" name="transferStatus.${status.index+1}" value="2" data-toggle="icheck" data-label="已到账" <c:if test="${obj.transferStatus == 2}">checked</c:if> disabled="disabled">
							<input type="hidden" name="transferStatus.${status.index+1}" value="<c:if test='${obj.transferStatus == 3}'>3</c:if><c:if test='${obj.transferStatus == 2}'>2</c:if>">
    					</c:otherwise>
    				</c:choose>
					
	    		</td>
	    		<!-- 确认金额 -->
    			<td>
    				<c:if test="${obj.transferStatus == 1}">
						<input type="text" name="confirmMoney.${status.index+1}" data-rule="required;checkMoney"  size="10" data-rule-checkMoney="checkMoney" class="digitUppercase"> 元
    				</c:if>
    				<c:if test="${obj.transferStatus == 2}">
    					<input type="text" name="confirmMoney.${status.index+1}" value="${obj.confirmMoney}" size="10"  readonly> 元
    				</c:if>
    				<c:if test="${obj.transferStatus == 3}">
    					--
    				</c:if>
				</td>
				<!-- 确认时间 -->
    			<td>
    				<c:if test="${obj.transferStatus == 1}">
						<input type="text" name="confirmTime.${status.index+1}" data-toggle="datepicker" data-pattern="yyyy-MM-dd HH:mm:ss" data-rule="required" >
    				</c:if>
    				<c:if test="${obj.transferStatus == 2}">
    					<input type="text" name="confirmTime.${status.index+1}" value="<fmt:formatDate value="${obj.confirmTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly>
    				</c:if>
    				<c:if test="${obj.transferStatus == 3}">
    					--
    				</c:if>
				</td>
				<!-- 支付状态 -->
				<td align="center">
    				<c:choose>
    					<c:when test="${obj.transferStatus == 3}">
    						--
    					</c:when>
    					<c:otherwise>
    						<c:forEach items="${payStatus}" var="item">
    							<c:if test="${obj.payStatus == item.status }">${item}</c:if>
    						</c:forEach>
    					</c:otherwise>
    				</c:choose>
    			</td>
    			<td align="center">
    				<c:if test="${obj.transferStatus == 1}">
    				<a href="javascript:;" class="btn btn-blue" onclick="updateOffline(this)" index="${status.index+1}">确认</a>
    				</c:if>
    				<c:if test="${obj.transferStatus != 1}">
    				<a href="javascript:;" class="btn btn-blue disabled">确认</a>
    				</c:if>
    			</td>
    		</tr>
    		</c:forEach>
    	  </c:if>
    		
    	</tbody>
    </table> 
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">关闭</button></li>
    </ul>
</div>
</form>
<script>
function checkMoney(element){
	var reg = /^(\d{0,12}(\.\d{1,2})?)$/;
	if(!reg.test(element.value)){
		return {"error": "请输入正确的数值"}; 
	}
}
$('.bjui-pageContent').on('ifClicked',':radio',function(e){
	var index = $(this).attr("index");
	var value = $(this).val();
	if(value == 2){
		//已到账
		//确认金额
		var e = $("input[name='confirmMoney."+index+"']");
		$(e).removeAttr("disabled");
		//确认时间
		var ee = $("input[name='confirmTime."+index+"']");
		$(ee).removeAttr("disabled");
	}else{
		//未到账
		//确认金额
		var e = $("input[name='confirmMoney."+index+"']");
		$(e).val("");
		$(e).attr("disabled","disabled");
		//确认时间
		var ee = $("input[name='confirmTime."+index+"']");
		$(ee).val("");
		$(ee).attr("disabled","disabled");
	}
});

/**
 * 更新线下支付凭证信息
 */
function updateOffline(obj){
	var index = $(obj).attr("index");
	var id = $("input[name='payOfflineId."+index+"']").val();//offlineId
	var transferStatus = $("input[name='transferStatus."+index+"']:checked").val();//线下支付状态
	var confirmMoney= $("input[name='confirmMoney."+index+"']").val();//确认金额
	var confirmTime = $("input[name='confirmTime."+index+"']").val();//确认时间
	var applyOrderType = $("#applyOrderType").val();//订单类型
	if(transferStatus == 2){
		//已到账
	$("input[name='confirmMoney."+index+"']").trigger("validate");
	if(confirmMoney == "")
		return;
	$("input[name='confirmTime."+index+"']").trigger("validate");
	if(confirmTime == "")
		return;
	}
	$.ajax({
		   type: "POST",
		   async: false,
		   url: "<%=request.getContextPath()%>/incomeright/settle/payoffline_pay.do",
		   data: {"payOfflineId":id,
				 "transferStatus":transferStatus,
				 "confirmMoney":confirmMoney,
				 "confirmTime":confirmTime,
				 "applyOrderType":applyOrderType
		   },
		   success: function(json){
			   if(json.statusCode == 200){
					$(this).alertmsg("correct", json.message, {autoClose:false,mask:true,okCall:function(){$(this).dialog("refresh");}});
				}else{
					$(this).alertmsg("error", json.message, {autoClose:false,mask:true,okCall:function(){$(this).dialog("refresh");}});
				}
		   }
	});
}
 
</script>
