<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
function moneyUnitChange(obj) {
	var text = $(obj).find(":selected").text();
	$("#financialBusinessIncome_UnitShow").text(text);
	$("#financialTotalAsset_UnitShow").text(text);
	$("#financialNetProfit_UnitShow").text(text);
	$("#financialTotalProfit_UnitShow").text(text);
}
function amountInterval(element){
	var value = element.value;
	var reg = /^(-)?\d{1,13}(\.\d{1,2})?$/;
	if(reg.test(value)){
		return true;
	}else{
		return "输入的金额超出范围！";
	}
}
</script>
<!-- 修改个人投资者 -->
<div class="bjui-pageContent">
    <form action="<%=request.getContextPath()%>/user/member/updateFinance.do" data-toggle="validate" data-reload="false">
     <input type="hidden" value="${user.id}" name="id"/>
     <input type="hidden" name="compareField" value="0" />
		 <table class="table table-condensed table-hover">
                <tbody>
                    <tr>
                        <td colspan="2">
                            <label class="control-label x150">注册资本：</label>
                            <input type="text" name="financialGroupBusinessIncome" value="${user.financialGroupBusinessIncome }"  size="20" data-rule="match[gt, compareField]" data-msg-match="注册资本大于0" class="digitUppercase" maxlength="13">
                            <select name="moneyUnit" id="moneyUnit" data-val="${user.moneyUnit}" data-toggle="selectpicker" data-rule="required">
                                    <option value="1" <c:if test="${user.moneyUnit==1}">selected</c:if>>人民币</option>
                                    <option value="2" <c:if test="${user.moneyUnit==2}">selected</c:if>>港币</option>
                                    <option value="3" <c:if test="${user.moneyUnit==3}">selected</c:if>>美元</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label class="control-label x150">净资产：</label>
                            <input type="text" name="financialNetAsset" value="${user.financialNetAsset }"  size="20"  data-rule="number" class="digitUppercase">
                            <select onchange="javascipt:moneyUnitChange(this)" name="moneyUnitFinance" id="moneyUnitFinance" data-val="${user.moneyUnitFinance}" data-toggle="selectpicker" data-rule="required;amountInterval" data-rule-interval="amountInterval">
                                    <option value="1" <c:if test="${user.moneyUnitFinance==1}">selected</c:if>>人民币</option>
                                    <option value="2" <c:if test="${user.moneyUnitFinance==2}">selected</c:if>>港币</option>
                                    <option value="3" <c:if test="${user.moneyUnitFinance==3}">selected</c:if>>美元</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                       <td colspan="2">
                            <label class="control-label x150">营业收入：</label>
                            <input type="text" name="financialBusinessIncome" value="${user.financialBusinessIncome }"  size="20" data-rule="number;amountInterval" class="digitUppercase"  data-rule-interval="amountInterval">
                            <span id="financialBusinessIncome_UnitShow"><c:if test="${user.moneyUnitFinance==1}">人民币</c:if><c:if test="${user.moneyUnitFinance==2}">港币</c:if><c:if test="${user.moneyUnitFinance==3}">美元</c:if></span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label class="control-label x150">资产总额：</label>
                            <input type="text" name="financialTotalAsset"  size="20" value="${user.financialTotalAsset }"  data-rule="number;interval" class="digitUppercase"  data-rule-interval="amountInterval">
                            <span id="financialTotalAsset_UnitShow"><c:if test="${user.moneyUnitFinance==1}">人民币</c:if><c:if test="${user.moneyUnitFinance==2}">港币</c:if><c:if test="${user.moneyUnitFinance==3}">美元</c:if></span>
                        </td>
                    </tr>
                     <tr>
                        <td colspan="2">
                            <label class="control-label x150">净利润：</label>
                            <input type="text" name="financialNetProfit"  size="20" value="${user.financialNetProfit }"  data-rule-interval="number" class="digitUppercase" data-rule-interval="amountInterval">
                            <span id="financialNetProfit_UnitShow"><c:if test="${user.moneyUnitFinance==1}">人民币</c:if><c:if test="${user.moneyUnitFinance==2}">港币</c:if><c:if test="${user.moneyUnitFinance==3}">美元</c:if></span>
                        </td>
                    </tr>
                     <tr>
                        <td colspan="2">
                            <label class="control-label x150">利润总额：</label>
                            <input type="text" name="financialTotalProfit"  size="20" value="${user.financialTotalProfit }"  data-rule="number;interval"  class="digitUppercase" data-rule-interval="amountInterval">
                            <span id="financialTotalProfit_UnitShow"><c:if test="${user.moneyUnitFinance==1}">人民币</c:if><c:if test="${user.moneyUnitFinance==2}">港币</c:if><c:if test="${user.moneyUnitFinance==3}">美元</c:if></span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center;">
                        	<button type="submit" class="btn-blue" data-icon="save">保存</button>
                            <button type="button" class="btn-close" data-icon="close">关闭</button>
					    </td>
                    </tr>                 
                </tbody>
            </table>
    </form>
</div>
