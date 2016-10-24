<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 消息录入列表 -->
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/syssmschannel/list.do">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <div class="bjui-searchBar">
        <label>通道名称：</label><input type="text" name="channelNamePattern"  value="<c:out value='${search.channelNamePattern }'/>" class="form-control" size="10" />
        <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
            <div class="pull-right">
                <div class="btn-group">
                       <a href="<%=request.getContextPath()%>/syssmschannel/new.do"
                       		class="btn btn-blue" data-toggle="dialog" data-width="900" data-icon="plus"
                       		data-height="600" data-id="dialog-mask" data-mask="true">新增通道</a>
                    	
                </div>
            </div>
        </div>
    </form>
</div>

<div class="bjui-pageContent">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<!-- <th align="center" width="10%">编号</th> -->
    		<th align="center" width="20%">通道名称</th>
    		<th align="center" width="26%">通道URL</th>
    		<th align="center" width="10%">创建时间</th>
    		<th align="center" width="10%">更新时间</th>
    		<th align="center" width="26%">操作</th>
    	</tr>
    	</thead>
    	<tbody>
	    	<c:forEach var="obj" items="${list}" varStatus="status">
		    	<tr>
		    		<%-- <td>${status.index + 1 }</td> --%>
		    		<td><a href="<%=request.getContextPath()%>/syssmschannel/info.do?id=${obj.id}" 
    				data-toggle="dialog" data-width="1000"  data-height="400" data-id="dialog-mask" 
    				data-mask="true" data-title="消息信息" >${obj.channelName }</a></td>
		    		<td>${obj.channelUrl }</td>
		    		<td><fmt:formatDate value="${obj.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		    		<td><fmt:formatDate value="${obj.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		    		<td>
	    				<a href="<%=request.getContextPath()%>/syssmschannel/edit.do?id=${obj.id}" 
	    					class="btn btn-blue" data-toggle="dialog" data-width="900"  
	    					data-height="600" data-id="dialog-mask" data-mask="true">编辑</a>
	    				<a href="<%=request.getContextPath()%>/syssmschannel/info.do?id=${obj.id}" 
	    					class="btn btn-blue" data-toggle="dialog" data-width="700"  
	    					data-height="600" data-id="dialog-mask" data-mask="true">浏览</a>
	    				<a href="<%=request.getContextPath()%>/syssmschannel/delete.do?id=${obj.id}" 
	    					data-toggle="doajax" data-confirm-msg="确定要删除吗？">删除</a>
	    				 <c:choose>
	    				 	<c:when test="${obj.useEnabled==0}">
	    				 		<button class="btn btn-blue" onclick="changeUseEnabled(1 , ${obj.id})">启用</button>
	    					</c:when>
	    					<c:otherwise>
	    						<button class="btn btn-red" onclick="changeUseEnabled(0 , ${obj.id})">禁用</button>
	    					</c:otherwise>
	    				</c:choose>
	    				
		    		</td>
		    	</tr>
	    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
<script>
	function changeUseEnabled(useEnabled , id) {
		$.ajax({
			type:"POST",
			async: true,
			cache: 'false',
			dataType: 'json',
			data:{"useEnabled":useEnabled,"id":id},
			url: '<%=request.getContextPath()%>/syssmschannel/update.do',
			success:function(data){
				if(data.statusCode == 200)
					$(this).navtab("refresh");
				else
					$(this).alertmsg('error', data.message)
			}	
		});
	}
</script>
