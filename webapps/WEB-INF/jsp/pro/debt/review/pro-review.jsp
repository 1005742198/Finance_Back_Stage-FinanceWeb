<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 主管审核项目 -->
<div class="bjui-pageContent"  id="pro-review">
	<form id="form" action="<%=request.getContextPath()%>/debt/proissue/review/${action}.do" data-reload-navtab="true" data-toggle="validate" data-confirm-msg="确定审核通过？" data-callback="projectupateCallback">
		<input type="hidden" name="id" value="${id}">
		<input type="hidden" id="pass" name="pass" value="0">
		 <table class="table-condensed" width="100%">
				<tr>
					<td>
						<label class="control-label x150">结算渠道：</label> 
						<select id="payclearId" name="payclearId" data-toggle="selectpicker" >
                            <option value="0">-请选择渠道-</option>
                               <c:forEach items="${clearcenters}" var="clearcenter">
                               	  <option value="${clearcenter.paycenterId}" <c:if test="${project.payclearId==clearcenter.paycenterId }">selected</c:if>>${clearcenter.payCenterName }</option>
                               	</c:forEach>
                         </select>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x150">交易方式：</label> 
						<input value="1" <c:if test="${project.tradeType==1 || project.tradeType==3}">checked</c:if> type="checkbox" name="inside" id="inside" data-toggle="icheck" value="true" data-label="场内交易">
						<input value="1" <c:if test="${project.tradeType==2 || project.tradeType==3}">checked</c:if> type="checkbox" name="outside" id="outside" data-toggle="icheck" value="true" data-label="场外交易">
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x150">募集期投资资金结算方式：</label> 
						<input <c:if test="${project.settleTypeId==1}">checked</c:if> name="settleTypeId" type="radio" value="1" data-toggle="icheck" data-label="场内直接结算" data-rule="checked">
						<input <c:if test="${project.settleTypeId==3}">checked</c:if> name="settleTypeId" type="radio" value="3" data-toggle="icheck" data-label="场内间接结算" data-rule="checked">
						<input <c:if test="${project.settleTypeId==2}">checked</c:if> name="settleTypeId" type="radio" value="2" data-toggle="icheck" data-label="场外结算" data-rule="checked">
					</td>
				</tr>
				<!-- 
				<tr>
					<td>
						<label class="control-label x160">兑付期的还款资金结算方式：</label> 
						<input <c:if test="${project.investSettleTypeId==1}">checked</c:if> name="investSettleTypeId" type="radio" value="1" data-toggle="icheck" data-label="场内直接结算" data-rule="checked">
						<input <c:if test="${project.investSettleTypeId==3}">checked</c:if> name="investSettleTypeId" type="radio" value="3" data-toggle="icheck" data-label="场内间接结算" data-rule="checked">
						<input <c:if test="${project.investSettleTypeId==2}">checked</c:if> name="investSettleTypeId" type="radio" value="2" data-toggle="icheck" data-label="场外结算" data-rule="checked">
					</td>
				</tr> -->
				<tr>
					<td>
						<label class="control-label x150">通过交易所还款兑付：</label> 
						<input <c:if test="${project.manageDuration==1}">checked</c:if> <c:if test="${project.tradeType==2 }">disabled</c:if> id="manageDuration1" name="manageDuration" type="radio" value="1" data-toggle="icheck" data-label="是" data-rule="checked">
						<input <c:if test="${project.manageDuration==0}">checked</c:if> id="manageDuration0" name="manageDuration" type="radio" value="0" data-toggle="icheck" data-label="否" data-rule="checked">
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x150">审核意见：</label> 
						<textarea cols="50" rows="8" data-toggle="autoheight" data-rule="required;length[~200, true]" id="flowFeedOpinion" name="flowFeedOpinion"></textarea>
					</td>
				</tr>
				<tr>
					<td align="center">
					<button type="submit" class="btn-blue" id="checkPassBtn">审核通过</button>
	    			<a href="javascript:;" class="btn btn-orange"  id="checkBackBtn">退回</a>
					</td>
				</tr>
		 </table>
		 </form>
</div>
<script>
$('#form').validator({
	rules: {
        checkChannel:function(element){
        	if(element.value == 0){
        		return "请选择结算渠道"
        	}
        },
        checkTradeType:function(){
			if($("input[name='inside']").attr("checked") != "checked" && $("input[name='outside']").attr("checked") != "checked") {
				return "请选择交易方式";	
			}
		}
	},
	fields: {
		'inside':'validate(outside)',
		'outside':'checkTradeType',
		'payclearId':'checkChannel',
        'flowFeedOpinion': 'required;length[~200, true]',
        'settleTypeId':'checked',
        'manageDuration':'checked'
    }
}).on('click','#checkBackBtn',function(e){
	$("#payclearId").attr("novalidate", "true");
	$("#outside").attr("novalidate", "true");
	$("input[name='settleTypeId']").attr("novalidate", "true");
	$("input[name='manageDuration']").attr("novalidate", "true");
	$("#form").data("validator").hideMsg("#payclearId");
	$("#form").data("validator").hideMsg("#outside");
	$("#form").data("validator").hideMsg("input[name='settleTypeId']");
	$("#form").data("validator").hideMsg("input[name='manageDuration']");
	$("#form").on("valid.form", function(e, form) {
		$("#pass").val(0);
	    $(form).data("confirmMsg", "确定退回？").bjuiajax('ajaxForm', $(form).data())
	});
	$(e.delegateTarget).trigger("validate");
}).on("click", "#checkPassBtn", function(){
	$("#payclearId").removeAttr("novalidate");
	$("#outside").removeAttr("novalidate");
	$("input[name='settleTypeId']").removeAttr("novalidate");
	$("input[name='manageDuration']").removeAttr("novalidate");
	$("#form").on("valid.form", function(e, form) {
		$("#pass").val(1);
	    $(form).data("confirmMsg", "确定审核通过？").bjuiajax('ajaxForm', $(form).data())
	});
})
function projectupateCallback(json) {
	if(json.statusCode == 200) {
		$(this).alertmsg("correct", json.message);
		$(this).dialog("closeCurrent");
		$(this).navtab("refresh");
	}else {
		$(this).alertmsg("error", json.message);
	}
}
$("#outside").on("ifChecked", function(){
	if($("#inside").attr("checked") != "checked") {
		$("#manageDuration1").iCheck('disable');
		$("#manageDuration0").iCheck('check');
	}
}).on("ifUnchecked", function(){
	$("#manageDuration1").iCheck('enable');
})
$("#inside").on("ifChecked", function(){
	$("#manageDuration1").iCheck('enable');
}).on("ifUnchecked", function(){
	if($("#outside").attr("checked") == "checked") {
		$("#manageDuration1").iCheck('disable');
		$("#manageDuration0").iCheck('check');
	}
})
</script>
