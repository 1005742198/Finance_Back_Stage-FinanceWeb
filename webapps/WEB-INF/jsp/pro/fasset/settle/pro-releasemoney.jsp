<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--成交放款 -->
<div class="bjui-pageContent" id="fasset-pro-doreleasemoney">
	<form id="mainForm" action="<%=request.getContextPath()%>/fasset/proissue/settle/releasemoney.do" data-toggle="validate" data-confirm-msg="确定要放款？" data-callback="afterRelease">
		 <input type="hidden" name="projectId" value="${project.id }">
		 <input type="hidden" name="releaseHasFailure" value="0" id="releaseHasFailure">
		 <table class="table table-condensed table-hover" width="100%">
		 	<tbody>
		 	<tr>
					<td>
						<label class="control-label x140">项目编号：</label> 
						<span>${project.projectCode }</span>
					</td>
					<td>
						<label class="control-label x140">项目名称：</label> 
						<span>${project.projectName}</span>
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
						<label class="control-label x140">挂牌金额：</label> 
						<span><fmt:formatNumber value="${project.projectMoney}" pattern="0.00"/> 元</span>
					</td>
					<td>
						<label class="control-label x140">成交价格：</label> 
						<span><fmt:formatNumber value="${cfmright.cfmRightMoney}" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x140">转让方应得金额：</label> 
						<span><fmt:formatNumber value="${handleMoney}" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">投资顾问费用：</label> 
						<span><fmt:formatNumber value="${investFee}" pattern="0.00"/> 元</span>
					</td>
					<td>
						<label class="control-label x140">平台费用：</label> 
						<span><fmt:formatNumber value="${ptFee}" pattern="0.00"/> 元</span>
					</td>
				</tr>
				
				<tr>
					<td>
						<label class="control-label x140">交易顾问费用：</label> 
						<span><fmt:formatNumber value="${advioserFee}" pattern="0.00"/> 元</span>
					</td>
					<td>
						<label class="control-label x140">费用总额：</label> 
						<span><fmt:formatNumber value="${sumFee}" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">收款账号：</label> 
						<span>${project.cardAccount }</span>
					</td>
					<td>
						<label class="control-label x140">收款银行：</label> 
						<span>${project.bankChannelName }</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x140">收款银行开户行：</label> 
						<span>${project.subBankName }</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x140">放款状态：</label> 
						<span>${project.getReleaseStatusDesc() }</span>
					</td>
				</tr>
				<c:if test="${project.releaseStatus !=0 && project.releaseStatus != 1  }">
					<tr>
					<td colspan="2">
						<label class="control-label x140">放款时间：</label> 
						<span><fmt:formatDate value="${project.releaseMoneyTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</td>
				</tr>
				</c:if>
				<c:if test="${project.releaseStatus != 0  && isCanRelease }">
				<tr>
					<td colspan="2">
						<label class="control-label x140">审核意见：</label> 
						<c:choose>
							<c:when test="${project.releaseStatus == 1 || project.releaseStatus == 4 }">
								<textarea cols="40" rows="4"  data-rule="required;length[~200, true]" name="releaseRemarke">${release.releaseRemarke}</textarea>
							</c:when>
							<c:otherwise>
								<textarea cols="40" rows="4"  readonly="readonly">${release.releaseRemarke}</textarea>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				</c:if>
				<c:if test="${!isCanRelease}">
					<tr>
					<td  colspan="2">
					<span style="color:red;">注：项目不可放款的原因：成交方没有支付尾款。</span>
					</td>
				</tr>
				</c:if>
				<tr>
					<td align="center"  colspan="2">
					<!-- 
					放款中、放款成功，“确认放款”按钮隐藏，“审核意见”显示文字
					 -->
					 <c:if test="${project.releaseStatus == 1 && isCanRelease}">
					 	<button type="submit" class="btn-blue" >确认放款</button>
					 </c:if>
	    			<button type="button" class="btn-close" data-icon="close">关闭</button>
					</td>
				</tr>
		 </table>
	</form>
</div>
<script>
function afterRelease(json){
	if(json.statusCode == 200){
		$(this).alertmsg("correct", json.message, {autoClose:false,okCall:function(){$(this).dialog('refresh');}});
	}else if(json.statusCode == 100){
		$(this).alertmsg("confirm",json.message,
				{title:"确认是否继续放款",okName:"是",cancelName:"否",okCall:function(){
					$("#releaseHasFailure").val(1);
					$("#mainForm").bjuiajax('ajaxForm', {"confirmMsg":"",callback:"afterSubmit"});
				},
				cancelCall:function(){$(this).dialog("closeCurrent");$(this).navtab("refresh");}
		});
		$("#mainForm").validator('destroy');
	}else{
		$(this).alertmsg("error", json.message);
	}
}

</script>
