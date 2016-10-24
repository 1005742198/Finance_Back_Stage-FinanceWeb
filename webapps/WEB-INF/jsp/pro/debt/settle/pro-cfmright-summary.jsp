<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 核保 确权概要-->
<div class="bjui-pageContent" id="pro-cfmrightinfo">
		 <table class="table table-condensed table-hover table-auto">
		 	<thead>
		 		<tr><th colspan="2">项目融资情况</th></tr>
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
						<label class="control-label x130">融资方：</label> 
						<span>${project.loanUserName}</span>
					</td>
					<td>
						<label class="control-label x130">计划融资总额：</label> 
						<span><fmt:formatNumber value="${project.projectMoney}" pattern="0.00"/> 元</span>
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
						<label class="control-label x130">核保人：</label> 
						<span>${cfmright.cfmOperatorName}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">核保结果：</label> 
						<span>${cfmright.getBizMoneyCfmRightStatus() }</span>
					</td>
					<td>
						<label class="control-label x130">放款结果：</label> 
						<span>${cfmright.getProReleaseStatus() }</span>
					</td>
				</tr>
				<!--确权总金额/人数，确权通过才需要显示 -->
				<tr>
					<td>
						<label class="control-label x130">确权总金额：</label> 
						<span><fmt:formatNumber value="${cfmright.cfmRightMoney}" pattern="0.00"/> 元</span>
					</td>
					<td>
						<label class="control-label x130">应付融资方：</label> 
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
						<label class="control-label x130">融资费用总额：</label> 
						<span><fmt:formatNumber value="${cfmright.cfmRightMoney-handleMoney}" pattern="0.00"/> 元</span>
					</td>
					
				</tr>
				</tbody>
		 </table>
</div>