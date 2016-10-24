<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.other-table th{background-color:#fff!important;text-align:center;}
	.other-table td{text-align:center;}
	.other-table .wrap_bjui_btn_box{width:100%;}
</style>
<!-- 录入项目 -->
<div class="bjui-pageContent">
		 <table class="table table-condensed table-hover" width="100%">
		 	<thead>
		 	</thead>
		 	<tbody>
		 		<tr>
		 			<td>
						<label class="control-label x110">业务类型：</label> 
						<span>直接融资项目</span>
					</td>
					<td>
						<label class="control-label x110">项目类型：</label> 
						<span><c:forEach var="item" items="${systypeProjectList}" varStatus="status">
								<c:if test="${item.id==obj.projectTypeId}">${item.typeName}</c:if>
							</c:forEach></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x110">备案代码：</label> 
						<span>${obj.recordCode}</span>
					</td>
					<td>
						<label class="control-label x110">融资方：</label> 
						<span>${loanUser.userName}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x110">备案名称：</label> 
						<span>${obj.recordFullName}</span>
					</td>
					<td>
						<label class="control-label x110">备案简称：</label> 
						<span>${obj.recordName}</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x110">融资用途：</label> 
						<span>${obj.projectUsing}</span>
					</td>
				</tr>
			</tbody>
			<thead>
		 		<tr><th colspan="2">备案信息</th></tr>
		 	</thead>
		 	<tbody>
				<tr>
					<td>
						<label class="control-label x110">拟募集规模：</label> 
						<span><fmt:formatNumber value="${obj.projectMoney}"/>元</span>
					</td>
					<td>
						<label class="control-label x110">拟定期限：</label> 
						<span>${obj.projectLimit}<c:forEach var="item" items="${projectLimitTypeList}">
							<c:if test="${item.typeId==obj.projectLimitTypeId}">${item.typeName}</c:if>
							</c:forEach></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x110">拟定年化收益率：</label> 
						<span><fmt:formatNumber value="${obj.investProfit*100}" pattern="0.00"/>%</span>
					</td>
					<td>
						<label class="control-label x110">还款方式：</label> 
						<span><c:forEach var="item" items="${systypeRepayList}" varStatus="status">
								<c:if test="${item.id==obj.repayTypeId}">${item.repayTypeName}</c:if>
							</c:forEach></span>
					</td>
				</tr>
			</tbody>
			<thead>
		 		<tr><th colspan="2">增信情况</th></tr>
		 	</thead>
		 	<tbody>
				<tr>
					<td colspan="2">
                        <label for="" class="control-label x85">是否有担保：</label>
 						<span><c:choose><c:when test="${obj.isGuarantee==1}">有担保</c:when><c:otherwise>无担保</c:otherwise></c:choose></span>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label for="" class="control-label x85">是否有质押：</label>
 						<span><c:choose><c:when test="${obj.isPledge==1}">有质押</c:when><c:otherwise>无质押</c:otherwise></c:choose></span>
						<label for="" class="control-label x85">是否有保险：</label>
 						<span><c:choose><c:when test="${obj.isInsurance==1}">有保险</c:when><c:otherwise>无保险</c:otherwise></c:choose></span>
 						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x110">增信说明：</label> 
						<span>${obj.creditNote}</span>
					</td>
				</tr>
			</tbody>
			<thead>
		 		<tr><th colspan="2">项目说明</th></tr>
		 	</thead>
		 	<tr>
				<td colspan="2">
					<label class="control-label x110">募集说明书：</label> 
					<span><c:choose><c:when test="${empty prospectus}">无</c:when><c:otherwise><a target="_blank" href="${accessPath}p${prospectus.projectFileGuid},${prospectus.file1Link()}">${prospectus.file1Show()}</a></c:otherwise></c:choose></span>
				</td>
				<%-- <td>
					<label class="control-label x110">风险揭示书：</label> 
					<span><c:choose><c:when test="${empty riskDisclosure}">无</c:when><c:otherwise><a target="_blank" href="${accessPath}p${riskDisclosure.projectFileGuid},${riskDisclosure.file1Link()}">${riskDisclosure.file1Show()}</a></c:otherwise></c:choose></span>
				</td> --%>
			</tr>
			<tr>
				<td colspan="2">
				<label class="control-label x110">项目详情：</label> 
				<textarea data-toggle="kindeditor" data-items="[]" data-readonly-mode="true" style="width:100%" name="projectInfo" disabled><c:out value='${content.projectInfo}'/></textarea></td>
			</tr>
		 </table>
</div>