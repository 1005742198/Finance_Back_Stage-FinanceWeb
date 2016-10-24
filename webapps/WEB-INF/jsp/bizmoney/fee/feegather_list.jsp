<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
	function feeGather(json){
		$(this).alertmsg("info", json.message,{autoClose:false,okCall:function(){$(this).navtab("refresh");}});
	}
</script>
<!--费用归集列表 -->
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/bizmoney/fee/feegather_list.do" method="post">
        <div class="bjui-searchBar">
        <label>归集日期：</label>
	        	<input type="text" name="gatherDate" value="${search.gatherDate }" class="form-control" size="15" data-toggle="datepicker"
				data-pattern="yyyy-MM-dd"  data-nobtn="true" data-rule="date"/>
          <label>归集状态：</label>
          	<select name="gatherStatus" data-toggle="selectpicker" class="show-tick" style="display: none;" size="10">
				<option value="">-全部-</option>
				<c:forEach var="item" items="${gatherStatusDesc}" >
					<option value="${item.status}" <c:if test="${search.gatherStatus==item.status }">selected</c:if>>${item}</option>
				</c:forEach> 
			</select>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        	<div class="pull-right">
                <div class="btn-group">
                       <a href="<%=request.getContextPath()%>/bizmoney/fee/feegather.do" data-confirm-msg="确定发起费用归集吗？"
                       		class="btn btn-blue" data-toggle="doajax" data-callback="feeGather">发起费用归集</a>
                </div>
            </div>
         </div>
    </form>
</div>
<div class="bjui-pageContent">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center" width="15%">归集编号</th>
    		<th align="center" width="15%">归集日期</th>
    		<th align="center" width="20%">计划归集金额</th>
    		<th align="center" width="20%">实际归集金额</th>
    		<th align="center" width="15%">归集状态</th>
    		<th align="center" width="15%">操作</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="obj" items="${list }">
	    	<tr>
	    		<td>${obj.id }</td>
	    		<td align="center"><fmt:formatDate value="${obj.gatherDate }" pattern="yyyy-MM-dd"/></td>
	    		<td><fmt:formatNumber value="${obj.gatherPlanMoney }" pattern="0.00"/></td>    		
	    		<td><fmt:formatNumber value="${obj.gatherRealMoney }" pattern="0.00"/></td>
	    		<td align="center">
	    			<c:forEach items="${gatherStatusDesc}" var="status">
	    				<c:if test="${status.status == obj.gatherStatus }">
	    					${status}
	    				</c:if>
	    			</c:forEach>
	    		</td>
	    		<td align="center">
	  				<a href="<%=request.getContextPath()%>/bizmoney/fee/feedetail_list.do?id=${obj.id}" 
	  				data-toggle="dialog" data-width="1000"  
	  				data-height="600" data-id="dialog-mask" data-mask="true">费用明细</a>
	    		</td>   
	    	</tr>
    	</c:forEach>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
