<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 修改个人投资者 -->
<div class="bjui-pageContent">
		 <table class="table table-condensed table-hover">
                <tbody>
                    <tr>
                        <td colspan="2">
                            <label class="control-label x100">注册资本：</label>
                            ${user.financialGroupBusinessIncome }<c:if test="${user.moneyUnit==1}">元</c:if><c:if test="${user.moneyUnit==2}">港币</c:if><c:if test="${user.moneyUnit==3}">美元</c:if>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label class="control-label x100">净资产：</label>
                            ${user.financialNetAsset }<c:if test="${user.moneyUnitFinance==1}">元</c:if><c:if test="${user.moneyUnitFinance==2}">港币</c:if><c:if test="${user.moneyUnitFinance==3}">美元</c:if>
                        </td>
                    </tr>
                    <tr>
                       <td colspan="2">
                            <label class="control-label x100">营业收入：</label>
                            ${user.financialBusinessIncome }<c:if test="${user.moneyUnitFinance==1}">元</c:if><c:if test="${user.moneyUnitFinance==2}">港币</c:if><c:if test="${user.moneyUnitFinance==3}">美元</c:if>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label class="control-label x100">资产总额：</label>
                            ${user.financialTotalAsset }<c:if test="${user.moneyUnitFinance==1}">元</c:if><c:if test="${user.moneyUnitFinance==2}">港币</c:if><c:if test="${user.moneyUnitFinance==3}">美元</c:if>
                        </td>
                    </tr>
                     <tr>
                        <td colspan="2">
                            <label class="control-label x100">净利润：</label>
                            ${user.financialNetProfit }<c:if test="${user.moneyUnitFinance==1}">元</c:if><c:if test="${user.moneyUnitFinance==2}">港币</c:if><c:if test="${user.moneyUnitFinance==3}">美元</c:if>
                        </td>
                    </tr>
                     <tr>
                        <td colspan="2">
                            <label class="control-label x100">利润总额：</label>
                            ${user.financialTotalProfit }<c:if test="${user.moneyUnitFinance==1}">元</c:if><c:if test="${user.moneyUnitFinance==2}">港币</c:if><c:if test="${user.moneyUnitFinance==3}">美元</c:if>
                        </td>
                    </tr>
                </tbody>
            </table>
</div>
