<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 修改个人投资者 -->
<div class="bjui-pageContent">
		 <table class="table table-condensed table-hover table-auto">
                <tbody>
                	<tr>
                        <td>
                            <label class="control-label x140"><c:if test="${user.userIdentity==2 }">客户</c:if><c:if test="${user.userIdentity==1}">会员</c:if>简称：</label>
                            <span>${user.userName}</span>
                        </td>
                        <td>
                            <label class="control-label x140"><c:if test="${user.userIdentity==2 }">客户</c:if><c:if test="${user.userIdentity==1}">会员</c:if>编号：</label>
                            <span>${user.userCode }</span>
                        </td>
                    </tr>
                	<tr>
                		<td colspan="2">
                            <label class="control-label x140"><c:choose><c:when test="${user.companyOrgCode.length()==10 }">组织机构代码</c:when><c:otherwise>社会信用代码</c:otherwise></c:choose>：</label>
                            <span>${user.companyOrgCode }</span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label class="control-label x140">机构全称：</label>
                            <span>${user.companyName }</span>
                        </td>
                    </tr>
                    <c:if test="${user.orgTypeId==3 }">
                   	<tr>
                		<td colspan="2">
                            <label class="control-label x140"><c:choose><c:when test="${user.companyOrgCode.length()==10 }">所属法人组织机构代码</c:when><c:otherwise>所属法人社会信用代码</c:otherwise></c:choose>：</label>
                            <span>${userPub.companyOrgCode }</span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label class="control-label x140">所属法人机构全称：</label>
                            <span>${userPub.companyName }</span>
                        </td>
                    </tr>
                    </c:if>
                    <tr>
                        <td>
                            <label class="control-label x140">机构法人：</label>
                            <span>${user.companyRepresentative }</span>
                        </td>
                        <td>
                            <label class="control-label x140">营业执照号码：</label>
                            <span>${user.companyBusinessLicense }</span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label class="control-label x140">注册地：</label>
                            <span>${user.proName}${user.cityName}${user.disName}${user.companyRegAddress }</span>
                        </td>
                    </tr>
                    <tr>
                    	<td>
                            <label class="control-label x140">机构类型：</label>
                            <span>${user.companyTypeName }</span>
                        </td>
                        <td>
                            <label class="control-label x140">所属行业：</label>
                            <span>${user.industryName }</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label x140">机构邮编：</label>
                            <span>${user.postalCode }
                        </td>
                        <td>
                            <label class="control-label x140">机构传真：</label>
                            <span>${user.faxPhone }</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label x140">机构电话：</label>
                            <span>${user.telePhone }</span>
                        </td>
                        <td>
                            <label class="control-label x140">机构网址：</label>
                            <span>${user.webUrl }</span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label class="control-label x140">主营业务：</label>
                            <span>${user.mainBuisness }</span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label class="control-label x140">企业描述：</label>
                            <span>${user.mainDesc }</span>
                        </td>
                    </tr>      
                </tbody>
            </table>
</div>
