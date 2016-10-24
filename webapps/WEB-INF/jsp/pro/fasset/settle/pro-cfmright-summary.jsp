<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 核保 确权概要-->
<div class="bjui-pageContent" id="pro-cfmrightinfo">
		 <table class="table table-condensed table-hover" width="100%">
		 	<thead>
		 		<tr><th colspan="2">项目转让情况</th></tr>
		 	</thead>
		 	<tbody>
				<tr>
					<td>
						<label class="control-label x130">项目编号：</label> 
						<span>${project.projectCode }</span>
					</td>
					<td>
						<label class="control-label x130">项目名称：</label> 
						<span>${project.projectName}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">挂牌金额：</label> 
						<span><fmt:formatNumber value="${project.projectMoney}" pattern="0.00"/> 元</span>
					</td>
					<td>
						<label class="control-label x140">成交价格：</label> 
						<span><fmt:formatNumber value="${cfmright.cfmRightMoney}" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">转让方：</label> 
						<span>${project.loanUserName }</span>
					</td>
					<td>
						<c:if test="${project.transferType ==2 }">
							<label class="control-label x140">成交方：</label> 
								<span>
								<c:if test="${empty dealUserName}">
										无
								</c:if>
								<c:if test="${not empty dealUserName}">
										${dealUserName }
								</c:if>
								</span>
							</c:if>
						<c:if test="${project.transferType ==1}">
							<label class="control-label x140">成交人数：</label> 
							<span>
								${cfmright.cfmRightUserNumbers} 人
							</span>
						</c:if>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">项目状态：</label> 
						<span>
							<c:forEach items="${projectStatus}" var="item">
    							<c:if test="${project.projectStatus == item.value }">${item}</c:if>
    						</c:forEach>
						</span>
					</td>
					<td>
						<c:if test="${showPayWk}">
							<label class="control-label x140">尾款支付情况：</label> 
							<span>
								等待支付尾款
							</span>
						</c:if>
					</td>
				</tr>
			 	<thead>
			 		<tr><th colspan="2">核保确权</th></tr>
			 	</thead>
			 	<tr>
					<td>
						<label class="control-label x130">核保时间：</label> 
						<span><fmt:formatDate value="${cfmright.cfmResultTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</td>
					<td>
						
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">核保结果：</label> 
						<span>${cfmright.getBizMoneyCfmRightStatus() }</span>
					</td>
					<td>
						<label class="control-label x130">成交状态：</label> 
						<span>${cfmright.getContractStatusDesc() }</span>
					</td>
				</tr>
				<!--确权总金额/人数，确权通过才需要显示 -->
				<tr>
					<td>
						<label class="control-label x130">放款结果：</label> 
						<span>${cfmright.getProReleaseStatus() }</span>
					</td>
					<td>
						<label class="control-label x130">应付转让方：</label> 
						<span><fmt:formatNumber value="${handleMoney}" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<!--核保不通过/出现超募,需要显示-->
				<tr>
					<td>
						<label class="control-label x130">需退款总金额：</label> 
						<span><fmt:formatNumber value="${cfmright.unRightMoney}" pattern="0.00"/> 元</span>
					</td>
					<td>
						<label class="control-label x130">退款结果：</label> 
						<span>${cfmright.getDrawbackStatusDesc() }</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x130">转让服务费总额：</label> 
						<span><fmt:formatNumber value="${cfmright.cfmRightMoney-handleMoney}" pattern="0.00"/> 元</span>
					</td>
					
				</tr>
				</tbody>
		 </table>
</div>