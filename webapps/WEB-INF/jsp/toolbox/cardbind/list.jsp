<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
function afterunbind(json){
	$(this).alertmsg("info", "请稍后查询结果!",{autoClose:false,okCall:function(){$(this).navtab("refresh");}});
}
function afterinquery(json){
	$(this).alertmsg("info", "请稍后查询结果!",{autoClose:false,okCall:function(){$(this).navtab("refresh");}});
}

</script>
<!--银行卡解绑卡记录 -->
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/toolbox/cardbind/list.do" method="post">
        <div class="bjui-searchBar">
          <label>支付渠道：</label>
          	<select name="payCenterId" data-toggle="selectpicker" class="show-tick" style="display: none;" size="10">
				<option value="">-全部-</option>
				<c:forEach var="item" items="${payCenters}" >
					<option value="${item.paycenterId}" <c:if test="${search.payCenterId==item.paycenterId }">selected</c:if>>${item.payCenterName}</option>
				</c:forEach> 
			</select>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
         	<div class="pull-right">
                <div class="btn-group">
                       <a href="<%=request.getContextPath()%>/toolbox/cardbind/cardbindstep1.do" class="btn btn-blue"
	  				data-toggle="dialog" data-width="1000"  
	  				data-height="600" data-id="dialog-mask" data-mask="true">绑卡</a>
                </div>
            </div>
         </div>
    </form>
</div>
<div class="bjui-pageContent">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center">编号</th>
    		<!-- <th align="center">支付渠道</th> -->
    		<th align="center">绑定流水号</th>
    		<th align="center">解绑流水号</th>
    		<th align="center">渠道名称</th>
    		<th align="center">账户名称</th>
    		<th align="center">银行账号</th>
    		<th align="center">证件号码</th>
    		<th align="center">手机号</th>
    		<th align="center">绑定状态</th>
    		<th align="center">创建时间</th>
    		<th align="center">操作</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="obj" items="${list }">
	    	<tr>
	    		<td>${obj.id }</td>
	    		<%-- <td>
	    			<c:forEach var="item" items="${payCenters}" >
	    				<c:if test="${obj.payCenterId==item.paycenterId }">${item.payCenterName}</c:if>
					</c:forEach>
	    		</td> --%>
	    		<td>${obj.txSnBinding }</td>
	    		<td>${obj.txSnUnBinding }</td>
	    		<td>${obj.channelName }</td>
	    		<td>${obj.accountName }</td>    		
	    		<td>${obj.cardAccount}</td>
	    		<td>${obj.idNumber}</td>
	    		<td>${obj.phone}</td>
	    		<td>${obj.showBindStatusDesc() }</td>
	    		<td><fmt:formatDate value="${obj.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	    		<td>
	    			<c:if test="${obj.bindStatus == 4 }">
	    				<a href="<%=request.getContextPath()%>/toolbox/cardbind/docardunbind.do?cardBindId=${obj.id}" data-confirm-msg="确定解除绑定？"
                       		class="btn btn-blue" data-toggle="doajax" data-callback="afterunbind">解绑</a>
	    			</c:if>
	  				<c:if test="${obj.bindStatus == 2 ||  obj.bindStatus == 5}">
	    				<a href="<%=request.getContextPath()%>/toolbox/cardbind/querybindresult.do?cardBindId=${obj.id}"
                       		class="btn btn-blue" data-toggle="doajax" data-callback="afterinquery">查询绑定结果</a>
	    			</c:if>
	    		</td>  
	    	</tr>
    	</c:forEach>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
