<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!-- 消息/公告列表 -->
<script type="text/javascript">
$(function(){
	$("#unReadCount").html("");
	$("#unReadCount").hide();
});
</script>
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/message/getusermsgs.do" method="post">
       <input type="hidden" name="pageSize" value="${pageSize}">
        <div class="bjui-searchBar">
        	<label>消息标题：</label><input type="text" name="msgTitle" value="<c:out value='${search.msgTitle }'/>" class="form-control" size="20"/>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent">
    <table data-toggle="tablefixed" data-width="100%" >
    	<thead>
    	<tr>
    		<th align="center">序号</th>
    		<th align="center">消息标题</th>
    		<th align="center">消息摘要</th>
    		<th align="center">消息状态</th>
    		<th align="center">消息时间</th>
    		<th align="center">操作</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="obj" items="${list }">
	    	<tr>
	    	<td>${obj.id }</td>
	    	<td>${obj.msgTitle }</td>
	    	<td>${obj.msgSummary }</td>
	    	<td>${obj.getMsgReadedStatus() }</td>
	    	<td><fmt:formatDate value="${obj.msgTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	    	<td>
	    		<a href="<%=request.getContextPath()%>/message/usermsgdetail.do?msgId=${obj.id}" 
	    				data-toggle="dialog" data-width="1000"  
	    			data-height="400" data-id="dialog-mask" data-mask="true" data-on-close="function(){$(this).navtab('refresh');}">查看</a>
	    		<a href="<%=request.getContextPath()%>/message/delusemsg.do?msgId=${obj.id}" 
	    				data-toggle="doajax" data-confirm-msg="确定要删除吗？" >删除</a>
	    	</td>
	    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
