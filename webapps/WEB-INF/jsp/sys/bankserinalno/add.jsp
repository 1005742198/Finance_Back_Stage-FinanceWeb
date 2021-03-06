<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
		
function formcallback(json){
	if(json.statusCode == 200){
		$(this).alertmsg("correct", json.message, {autoClose:false,mask:true,okCall:function(){$(this).dialog("closeCurrent").navtab('refresh');}});
	}else{
		$(this).bjuiajax('ajaxDone', json)
	}
}
		
</script>
<!-- 增加联行号 -->
<div class="bjui-pageContent">
	<form id="mainForm" action="<%=request.getContextPath()%>/sys/bankserinalno/save.do" data-toggle="validate" data-confirm-msg="确定要提交嘛？" data-callback="formcallback">
		 <table class="table table-condensed table-hover" width="100%">
		 	<tbody>
				<tr>
					<td colspan="3">
						<label class="control-label x110">银行：</label> 
						 <select data-autoClose="true" data-live-search="true" name="bankId" data-toggle="selectpicker" data-width="100px" data-rule="required">
              				<option value="">--请选择--</option>
				             <c:forEach var="obj" items="${bankList}"> 
				             	<option value="${obj.id}">${obj.bankName}</option>
				             </c:forEach>                   
            		 	 </select>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<label class="control-label x110">所属省份/城市：</label> 
						<select data-autoClose="true"  name="provinceId" data-nextselect="#cityId1" data-toggle="selectpicker" data-refurl="<%=request.getContextPath()%>/systype/city.do?proId={value}">
                			<option value="">--省份--</option>
			                <c:forEach var="obj" items="${provinceList}"> 
			    				<option value="${obj.proId}">${obj.proName}</option>
			    			</c:forEach>
              			</select>
		              <select data-autoClose="true"  name="cityId" id="cityId1" data-toggle="selectpicker">
               			<option value="">--城市--</option>
             		  </select>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<label class="control-label x110">分(支)行名称：</label> 
						<input type="text" name="subBankName" class="form-control" data-rule="required">
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<label class="control-label x110">分(支)行联行号：</label> 
						<input type="text" name="subBankNo" class="form-control" data-rule="required">
					</td>
				</tr>
				<tr>
					<td align="center" colspan="3">
		    			<button class="btn btn-blue">保存</button>
		    			<button class="btn btn-close">关闭</button>
					</td>
				</tr>
			</tbody>
		 </table>
	</form>
	
</div>
