<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 主管审核项目 -->
<div class="bjui-pageContent"  id="fasset-pro-review">
	<form id="form" action="<%=request.getContextPath()%>${ReviewControllerRoot}/check.do" data-reload-navtab="true" data-toggle="validate" data-confirm-msg="确定审核通过？" data-callback="projectupateCallback">
		<input type="hidden" name="id" value="${id}">
		<input type="hidden" id="pass" name="pass" value="0">
		 <table class="table table-condensed table-hover">
				<tr>
					<td>
						<label class="control-label x130">项目编号：</label> 
						<input type="hidden" value="${project.id }" name="projectId"> 
						<span>${project.projectCode }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">项目名称：</label> 
						<span>${project.projectName}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">转让方：</label>  
						<span>${project.loanUserName }</span>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">挂牌金额：</label> 
						<span>${project.projectMoney} 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">结算渠道：</label> 
						<select id="payclearId" name="payclearId" data-toggle="selectpicker" >
                            <option value="0">-请选择渠道-</option>
                            <c:if test="${!empty clearcenters}">
                               <c:forEach items="${clearcenters}" var="clearcenter">
                               	  <option value="${clearcenter.paycenterId}">${clearcenter.payCenterName }</option>
                               	</c:forEach>
                             </c:if>
                         </select>
					</td>
				</tr>
				<tr>
					<td id="tradeType">
						<label class="control-label x130">交易方式：</label> 
						<c:choose>
							<c:when test="${project.transferType==1 }">
								<input value="1" <c:if test="${project.tradeType==1 || project.tradeType==3}">checked</c:if> type="checkbox" name="inside" id="inside" data-toggle="icheck" value="true" data-label="场内交易">
								<input value="1" <c:if test="${project.tradeType==2 || project.tradeType==3}">checked</c:if> type="checkbox" name="outside" id="outside" data-toggle="icheck" value="true" data-label="场外交易">							
							</c:when>
							<c:otherwise>
								<input type="hidden" name="inside" value="1" />
								<input value="1" checked type="checkbox" id="inside" data-toggle="icheck" value="true" data-label="场内交易" disabled>
								<input value="1" type="checkbox" id="outside" data-toggle="icheck" value="true" data-label="场外交易" disabled>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x110">审核意见：</label> 
						<textarea cols="50" rows="8" data-toggle="autoheight" data-rule="required;length[~200, true]" id="flowFeedOpinion" name="flowFeedOpinion"></textarea>
					</td>
				</tr>
				<tr>
					<td align="center">
					<button type="submit" class="btn-blue" id="checkPassBtn">审核通过</button>
	    			<a href="javascript:;" id="checkBackBtn" class="btn btn-orange">退回</a>
					</td>
				</tr>
		 </table>
		 </form>
</div>
<script>
$("#outside").on("ifChecked", function(){
	$('#inside').iCheck('uncheck');
});
$("#inside").on("ifChecked", function(){
	$('#outside').iCheck('uncheck');
});
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
		'outside':'checkTradeType',
		'payclearId':'checkChannel',
        'flowFeedOpinion': 'required;length[~200, true]'
    }
}).on('click','#checkBackBtn',function(e){
	$("#payclearId").attr("novalidate", "true");
	$("#outside").attr("novalidate", "true");
	$("#form").data("validator").hideMsg("#payclearId");
	$("#form").on("valid.form", function(e, form) {
		$("#pass").val(0);
	    $(form).data("confirmMsg", "确定审核退回？").bjuiajax('ajaxForm', $(form).data())
	});
	$(e.delegateTarget).trigger("validate");
}).on("click", "#checkPassBtn", function(){
	$("#payclearId").removeAttr("novalidate");
	$("#outside").removeAttr("novalidate");
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
</script>
