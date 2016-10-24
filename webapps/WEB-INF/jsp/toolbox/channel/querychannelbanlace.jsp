<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.sub_memu_box > div {padding-left:405px;}
.left_menu {float:right; width:400px; margin-left:-405px; margin-right:5px; overflow:auto; border:1px solid #c3ced5;}
.right_menu {float:right; width:100%; overflow:auto;border:1px solid #c3ced5;}
.bs-example { padding:10px;}
#MenuIcon { display:inline-block; width:50px;}
.btn_box { padding:10px;} 
</style>
<div class="bjui-pageContent">
	<div class="sub_memu_box">
			<div class="clearfix">
				<div id="ztree-detail" class="right_menu">
					<c:if test="${isShow == 1 }">
					<table data-toggle="tablefixed" data-width="100%">
				   	<thead>
				   	</thead>
					<tbody>
		    		<tr>
		    			<td>
		    			<label class="control-label x110">当前渠道：</label>
		          		<span>
		          			<c:forEach items="${clearCenters}" var="clearcenter">
		                         <c:if test="${paycenterId==clearcenter.paycenterId }">${clearcenter.payCenterName }</c:if>
		                    </c:forEach>
		          		</span>
		          		</td>
		    		</tr>
		    		
		    		<tr>
		    			<td>
		    			<label class="control-label x110">账户名：</label>
		          		<span>${accoutName }</span>
		          		</td>
		    		</tr>
		    		<tr>
		    			<td>
		    			<label class="control-label x110">银行账号：</label>
		          		<span>${cardAccount }</span>
		          		</td>
		    		</tr>
		    		<tr>
		    			<td>
		    			<label class="control-label x110">账户余额：</label>
		          		<span><fmt:formatNumber value="${balanceMoney }" pattern="0.00"/> 元</span>
		          		</td>
		    		</tr>
		    	  </tbody>
				   </table>
				   </c:if>
				</div>
				<div class="left_menu">
					<form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/toolbox/channel/querybanlance.do" method="post">
    					<input type="hidden" name="paycenterId" id="paycenterId" />
    					<table class="table table-condensed table-hover" width="100%">
					 	<thead>
					 	</thead>
					 	<tbody>
					 		<c:forEach items="${clearCenters}" var="clearcenter">
					 			<tr>
								<td>
									<label class="control-label x110">结算渠道：  </label>
									<span>${clearcenter.payCenterName}</span>
								</td>
								<td>
									<button type="submit" class="btn-blue" data="${clearcenter.paycenterId}">查询账户余额</button>
								</td>
							</tr>
					 		</c:forEach>
						</tbody>
					</table>
    				</form>
				</div>
			</div>
		</div>
    
</div>
<script>
//菜单布局
function resizeH(){
	var menuH=$(window).height()-140;
	$('.left_menu,.right_menu').height(menuH);
}
resizeH();
$(window).resize(resizeH);
$.CurrentNavtab.addClass('bjui-layout');
$(':submit').click(function(){
	$("#paycenterId").val($(this).attr("data"));
});
</script>

