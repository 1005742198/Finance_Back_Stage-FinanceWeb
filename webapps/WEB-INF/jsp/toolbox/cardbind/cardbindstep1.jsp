<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
var ti = 0;
function sendBindSmsCode() {
	$.ajax({
		type : "post",
		url : "<%=request.getContextPath()%>/toolbox/cardbind/sendsmscode.do",
		data : {payCenterId:$("#payCenterId").val(),
			channelId:$("#channelId").val(),
			bankCardType:$("#bankCardType").val(),
			cardAccount:$("#cardAccount").val(),
			accountName:$("#accountName").val(),
			idType:$("#idType").val(),
			idNumber:$("#idNumber").val(),
			phone:$("#phone").val()
			  },
		dataType : "json",
		timeout : 5000,
		cache : false,
		success : function(data, textStatus) {
			if(data.statusCode == 200){
				$("#cardBindId").val(data.data.cardBindId);//设置cardbindId
				$("#mainForm").validator("hideMsg", "#validCode");
				if (ti <= 0) {
			        ti = data.data.repeatTime;
			        var self = $('#getCode');
			        self.addClass('btn-disable');
			        self.text(ti+"秒后可重新获取");
			        self.off("click");
			        var _inter = setInterval(function () {
			            if (ti <= 0) {
			                self.removeClass('btn-disable');
			                self.text('点击获取验证码');
			                self.on("click", sendBindSmsCode);
			                window.clearInterval(_inter);
			            } else {
			                self.text(ti+"秒后可重新获取");
			                ti--;
			            }
			        }, 1000);
			    }
			}else{
				$("#mainForm").validator("showMsg", data.message);
			}
		}
	});
}

function formcallback(json){
	if(json.statusCode == 200){
		$(this).alertmsg("ok", "绑定成功",{autoClose:false,okCall:function(){$(this).dialog("closeCurrent").navtab('refresh');}});
	}else{
		$(this).bjuiajax('ajaxDone', json)
	}
}

$(document).ready(function(){
	　$("#getCode").on("click", sendBindSmsCode);
});
</script>
<!-- 增加操作员 -->
<div class="bjui-pageContent">
	<form id="mainForm" action="<%=request.getContextPath()%>/toolbox/cardbind/cardbind.do" data-toggle="validate" data-callback="formcallback">
		 <input type="hidden" name="cardBindId" id="cardBindId"/>
		 <table class="table table-condensed table-hover" width="100%">
		 	<tbody>
				<tr>
					<td colspan="2">
						<label class="control-label x110">选择支付渠道：</label> 
						<select name="payCenterId" id="payCenterId" data-toggle="selectpicker" data-nextselect="#channelId" data-refurl="<%=request.getContextPath()%>/systype/bankchannel.do?payCenterId={value}">
							<option value="0">-请选择渠道-</option>
                        	<c:forEach var="item" items="${payCenters}">
                        	<option value="${item.paycenterId}">${item.payCenterName}</option>	
                        	</c:forEach>
                        </select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x110">选择银行：</label> 
						<select name="channelId" id="channelId" data-toggle="selectpicker" data-autoClose="true" data-live-search="true">
                             <option value="0">-请选择银行-</option>
                        </select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x110">银行卡类型：</label> 
						<select name="bankCardType"  id="bankCardType" data-toggle="selectpicker" >
                        	<option value="1">储蓄卡</option>
                        	<%-- <c:forEach var="item" items="${bankcardTypes}">
                        		<option value="${item.type}">${item}</option>	
                        	</c:forEach> --%>
                        </select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x110">银行卡号：</label> 
						<input type="text" name="cardAccount" id="cardAccount" class="form-control" data-rule="required">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x110">真实姓名：</label> 
						<input type="text" name="accountName" id="accountName" class="form-control" data-rule="required" >
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x110">证件类型：</label> 
						<select name="idType" id="idType" data-toggle="selectpicker">
							<option value="1">身份证</option>
                        	<%-- <c:forEach var="idType" items="${idTypeList}">
                        		<option value="${idType.typeId }">${idType.typeName }</option>	
                        	</c:forEach> --%>
                        </select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x110">证件号码：</label> 
						<input type="text" name="idNumber"  id="idNumber" class="form-control" data-rule="required">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x110">银行预留手机号：</label> 
						<input type="text" name="phone" id="phone" class="form-control" data-rule="required">
					</td>
				</tr>
				<tr>
				<td colspan="2">
						<label class="control-label x110">短信验证码：</label> 
						<input data-autoClose="true" id="validCode" name="smsCode" type="text" data-rule="required" data-msg-required="请填写短信验证码"  data-timely="0" autocomplete="off">
						<a class="btn btn-default" id="getCode">点击获取验证码</a>
				</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
		    			<button class="btn btn-blue">发起绑卡</button>
					</td>
				</tr>
			</tbody>
		 </table>
	</form>
	
</div>
