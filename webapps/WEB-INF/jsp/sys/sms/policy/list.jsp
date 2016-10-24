<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 消息录入列表 -->
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/syssmspolicy/list.do">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <div class="bjui-searchBar">
        <label>策略名称：</label><input type="text" name="policyNamePattern"  value="<c:out value='${search.policyNamePattern }'/>" class="form-control" size="10" />
				<label>短信类型：</label> <!--  -->
				<select name="smsTypePart" id="smsTypePart" data-toggle="selectpicker" class="show-tick" data-size="12" style="display: none;" data-maxwidth="150px" data-width="150px">
					<option value="">请选择短信类型</option>
					<c:forEach var="item" items="${smsTypeList}">
						<option value="${item.type}" <c:if test="${search.smsTypePart==item.type}">selected</c:if>>${item}</option>
					</c:forEach>
				</select>
				<label>短信通道：</label> 
				<select name="channelPart" id="channelPart" data-toggle="selectpicker" class="show-tick" data-maxwidth="500px"  data-width="150px" data-size="12" >
					<option value="">请选择短信通道</option>
					<c:forEach var="item" items="${smsChannelList}">
						<option value="${item.id}" <c:if test="${search.channelPart==item.id}">selected</c:if>>${item.channelName}</option>
					</c:forEach>
				</select>
        <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
            <div class="pull-right">
                <div class="btn-group">
                       <a href="<%=request.getContextPath()%>/syssmspolicy/new.do"
                       		class="btn btn-blue" data-toggle="dialog" data-width="1000" data-icon="plus"
                       		data-height="600" data-id="dialog-mask" data-mask="true">新增策略</a>
                    	
                </div>
            </div>
        </div>
    </form>
</div>

<div class="bjui-pageContent">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<!-- <th align="center" width="5%">编号</th> -->
    		<th align="center" width="15%">策略名称</th>
    		<th align="center" width="15%">短信类型</th>
    		<th align="center" width="15%">排除手机号段</th>
    		<th align="center" width="15%">策略链</th>
    		<th align="center" width="10%">创建时间</th>
    		<th align="center" width="10%">更新时间</th>
    		<th align="center" width="15%">操作</th>
    	</tr>
    	</thead>
    	<tbody>
	    	<c:forEach var="obj" items="${list}" varStatus="status">
		    	<tr>
		    		<%-- <td>${status.index + 1 }</td> --%>
		    		<td><a href="<%=request.getContextPath()%>/syssmspolicy/info.do?id=${obj.id}" 
    				data-toggle="dialog" data-width="1000"  data-height="400" data-id="dialog-mask" 
    				data-mask="true" data-title="策略链" >${obj.policyName }</a></td>
		    		<td>${obj.smsTypeDesc }</td>
		    		<td>${obj.excludePhoneSegment }</td>
		    		<td>${obj.smsSendPolicyDesc }</td>
		    		<td><fmt:formatDate value="${obj.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		    		<td><fmt:formatDate value="${obj.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		    		<td>
	    				<a href="<%=request.getContextPath()%>/syssmspolicy/edit.do?id=${obj.id}" 
	    					class="btn btn-blue" data-toggle="dialog" data-width="1000"  
	    					data-height="500" data-id="dialog-mask" data-mask="true">编辑</a>
	    				<a href="<%=request.getContextPath()%>/syssmspolicy/info.do?id=${obj.id}" 
	    					class="btn btn-blue" data-toggle="dialog" data-width="1000"  
	    					data-height="400" data-id="dialog-mask" data-mask="true">浏览</a>
	    				<a href="<%=request.getContextPath()%>/syssmspolicy/delete.do?id=${obj.id}" 
	    					data-toggle="doajax" data-confirm-msg="确定要删除吗？">删除</a>
	    				
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
			data:{"changeUseEnabled":useEnabled,"id":id},
			url: '<%=request.getContextPath()%>/syssmspolicy/update.do',
			success:function(data){
				$(this).navtab("refresh");
			}	
		});
	}
</script>
