<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 融资顾问银行卡 -->
<script type="text/javascript">
function callback(json){
	if(json.statusCode == 200){
		$(this).alertmsg("correct", json.message);
		//$(this).dialog("refresh", "dialog-bank");
		$(this).bjuiajax('refreshLayout', {target:'#bankinfo',url:$("#bankinfo_link").attr('href')});
		$('#bankinfo').removeClass('bjui-layout')
	}else{
		$(this).alertmsg("error", json.message);
	}
}
function validlength(element){
	var value = element.value;
	if(value.length>=4 && value.length<=30){
		return true;
	}else{
		return "账户名称长度必须为4-30位";
	}
}
</script>
    <form action="<%=request.getContextPath()%>/user/bankcard/update.do" id="j_custom_form" class="pageForm" data-toggle="validate" method="post">
        <table data-callback="callback" id="bankcard" class="table table-bordered table-hover table-striped table-top" data-toggle="tabledit" data-initnum="0" data-action="<%=request.getContextPath()%>/user/bankcard/update.do" data-single-noindex="true">
            <thead>
                <tr data-idname="id">
                    <input type="hidden" name="userId" value="${user.id}">
                    <th width="15%" title="账户名称"><input type="text" id="accountName#index#" name="accountName" data-rule="required" value="${accountName }" readonly size="5"></th>
                    <th width="14%" title="开户行" class="tag-group">
						<!-- <select data-width="98%" data-autoClose="true" data-live-search="true" id="bankId#index#" name="bankId" data-toggle="selectpicker" data-rule="required" data-nextselect="#bankSerialId#index#" data-refurl="<%=request.getContextPath()%>/systype/bankserialno.do?bankId={bankId}&cityId={cityId}" data-param='{"bankId":"bankId#index#","cityId":"cityId#index#"}'>
	                     	<option value="">--请选择--</option>
	                    <c:forEach var="obj" items="${bankchannelList}"> 
	                    	<option value="${obj.id}">${obj.bankName}</option>
	                    </c:forEach>                   
                    	</select> -->
                    	<input type="hidden" name="bankId" id="bankId#index#" data-autoClose="true" data-rule="required">
                    	<input onblur="getbankid(this)" autocomplete="off" type="text" name="bankName" id="bankName#index#" data-autoClose="true" data-rule="required" data-toggle="tags" data-callback="tagBack" data-max="1" data-clear="true" data-tagname="bankId" data-tagid="bankId#index#" data-url="/user/bankcard/bankNameSearch.do" data-width="98%" placeholder="输入名称后从列表里选择">
                    </th>
                    <th width="18%" title="账户号码"><input data-autoClose="true" type="text" id="cardAccount#index#" name="cardAccount" data-rule="required;number;validlength" data-rule-validlength="validlength" value="" size="5"></th>
                    <th width="38%" title="开户行所在地" class="select-group">
                    <select data-autoClose="true" data-rule="required" id="provinceId#index#" name="provinceId" data-toggle="selectpicker" data-nextselect="#cityId#index#" data-refurl="<%=request.getContextPath()%>/systype/city.do?proId={value}">
                       <option value="">--省份--</option>
                       <c:forEach var="obj" items="${provinceList}"> 
           				<option value="${obj.proId}">${obj.proName}</option>
           				</c:forEach>
                    </select>
                    <select data-autoClose="true" data-rule="required" name="cityId" id="cityId#index#" data-toggle="selectpicker" data-nextselect="#bankSerialId#index#" data-refurl="<%=request.getContextPath()%>/systype/bankserialno.do?bankId={bankId}&cityId={cityId}" data-param='{"bankId":"bankId#index#","cityId":"cityId#index#"}'>
                    <option value="">--城市--</option>
                    </select>
                    	<select data-autoClose="true" data-live-search="true" data-rule="required" name="bankSerialId" id="bankSerialId#index#" data-emptytxt="--请选择--" data-toggle="selectpicker">
	                    <option value="">--请选择--</option>
	                    </select>
                    </th>
                    <th width="5%" title="默认收款账户" data-noedit="true"></th>
                    <th title="新增" data-addbtn="true" width="10%">
                        <a href="javascript:;" class="btn btn-blue" data-toggle="dosave">保存</a>
                        <a data-action="<%=request.getContextPath()%>/user/bankcard/del.do?userId=${user.id }&id=" href="javascript:;" class="btn btn-red row-del" >删</a>
                    </th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="obj" items="${list}" varStatus="status">
                <tr data-id="${obj.id}"><input type="hidden" name="userId" value="${user.id}">
                	<td>${obj.accountName}</td>
                    <td data-val="[${obj.bankId },'${obj.channelName}']"></td>
                    <td>${obj.cardAccount}</td>
                    <td data-val="[[${obj.provinceId},${obj.cityId},${obj.bankSerialId}],['${obj.provinceName}','${obj.cityName}','${obj.subBankName}']]"></td>
                    <td data-noedit="true"><c:if test="${obj.defaultCard==1}">是</c:if><c:if test="${obj.defaultCard==0}">否</c:if></td>
                    <td data-noedit="true">
                        <button data-click="loadCity(${obj.provinceId},${obj.cityId},${obj.bankId},${obj.bankSerialId},${status.index })" type="button" class="btn-blue" data-toggle="doedit">编辑</button>
                        <c:if test="${obj.defaultCard==0}"><a data-callback="callback" data-action="<%=request.getContextPath()%>/user/bankcard/del.do?userId=${user.id }&id=" href="<%=request.getContextPath()%>/user/bankcard/del.do?userId=${user.id }&id=${obj.id}" class="btn btn-red row-del" data-confirm-msg="确定要删除该行信息吗？">删</a></c:if>
                        <c:if test="${obj.defaultCard==0}"><a data-callback="callback" data-nodel="true" href="<%=request.getContextPath()%>/user/bankcard/updateDefault.do?userId=${obj.userId }&cardId=${obj.id}" class="btn btn-blue row-del" data-confirm-msg="确定要设为默认卡吗？">设为默认卡</a></c:if>
                    </td>
                </tr>
             </c:forEach>
            </tbody>
        </table>
    </form>
<script>
function getbankid(obj) {
	var index = $(obj).attr("id").replace("bankName","");
	if(!$("#bankId"+index).val() && $(obj).val()) {
		$.ajax({
			url: '<%=request.getContextPath()%>/systype/bankName.do?term='+$(obj).val(),
			type: 'get',
			cache: 'false',
			dataType: 'json',
			success: function(data) {
				if(data && data.bankId) {
					$("#bankId"+index).val(data.bankId);
					var cityId = $("#cityId"+index).val();
					if(cityId) {
						$.ajax({
							url: '<%=request.getContextPath()%>/systype/bankserialno.do?bankId='+data.bankId+'&cityId='+cityId,
							type: 'get',
							cache: 'false',
							dataType: 'json',
							success: function(data) {
								var array = [];
								for(var i=0; i<data.length; i++) {
									array.push('<option value="'+data[i].value+'">'+data[i].label+'</option>');
								}
								$("#bankSerialId"+index).html(array.join("")).selectpicker('refresh');
							}
						});
					}
				}
			}
		});
		
	}
}
function tagBack(value, id) {
	var index = id.replace("bankName","");
	var cityId = $("#cityId"+index).val();
	if(cityId) {
		$.ajax({
			url: '<%=request.getContextPath()%>/systype/bankserialno.do?bankId='+value+'&cityId='+cityId,
			type: 'get',
			cache: 'false',
			dataType: 'json',
			success: function(data) {
				var array = [];
				for(var i=0; i<data.length; i++) {
					array.push('<option value="'+data[i].value+'">'+data[i].label+'</option>');
				}
				$("#bankSerialId"+index).html(array.join("")).selectpicker('refresh');
			}
		});
	}
}
function loadCity(proId,cityId,bankId,serialId,index) {
	$.ajax({
		url: '<%=request.getContextPath()%>/systype/city.do?proId='+proId,
		type: 'get',
		cache: 'false',
		dataType: 'json',
		success: function(data) {
			var array = [];
			for(var i=0; i<data.length; i++) {
				var selected = "";
				if(cityId == data[i].value) {
					selected = "selected";
				}
				array.push('<option value="'+data[i].value+'" '+selected+'>'+data[i].label+'</option>');
			}
			$("#cityId"+index).html(array.join("")).selectpicker('refresh');
		}
	});
	$.ajax({
		url: '<%=request.getContextPath()%>/systype/bankserialno.do?bankId='+bankId+'&cityId='+cityId,
		type: 'get',
		cache: 'false',
		dataType: 'json',
		success: function(data) {
			var array = [];
			for(var i=0; i<data.length; i++) {
				var selected = "";
				if(serialId == data[i].value) {
					selected = "selected";
				}
				array.push('<option value="'+data[i].value+'" '+selected+'>'+data[i].label+'</option>');
			}
			$("#bankSerialId"+index).html(array.join("")).selectpicker('refresh');
		}
	});
}
</script>
