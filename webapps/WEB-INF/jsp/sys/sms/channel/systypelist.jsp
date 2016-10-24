<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- <style>
.bootstrap-select.btn-group.show-tick .dropdown-menu li a span.text{line-height:16px;}
.bootstrap-select.btn-group .dropdown-menu li a{white-space:normal;}
ul.selectpicker>li{height:auto;}
</style> -->
<!-- 消息录入列表 -->
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/syssmschannel/smstypelist.do">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="channelName" id="channelName">
        <input type="hidden" name="smsTypeName" id="smsTypeName">
        <div class="bjui-searchBar">
				<label>短信通道：</label> 
				<!--  -->
				<select name="channelId" id="channelId" data-toggle="selectpicker" class="show-tick" data-maxwidth="500px"  data-width="150px" data-size="12" >
					<option value="">请选择短信通道</option>
					<c:forEach var="item" items="${smsChannelList}">
						<option value="${item.id}" <c:if test="${search.channelId==item.id}">selected</c:if>>${item.channelName}</option>
					</c:forEach>
				</select>
				
				<label>短信类型：</label> <!--  -->
				<select name="smsTypeId" id="smsTypeId" data-toggle="selectpicker" class="show-tick" data-size="12" style="display: none;" data-maxwidth="150px" data-width="150px">
					<option value="">请选择短信类型</option>
					<c:forEach var="item" items="${smsTypeList}">
						<option value="${item.type}" <c:if test="${search.smsTypeId==item.type}">selected</c:if>>${item}</option>
					</c:forEach>
				</select>
	            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
	            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
	        </div>
    </form>
</div>

<div class="bjui-pageContent">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center" width="25%">通道名称</th>
    		<th align="center" width="25%">短信类型</th>
    		<th align="center" width="50%">策略名称</th>
    	</tr>
    	</thead>
    	<tbody>
	    	<c:forEach var="obj" items="${list}">
		    	<tr>
		    		<td><a href="<%=request.getContextPath()%>/syssmschannel/info.do?id=${obj.channelId}" 
    				data-toggle="dialog" data-width="1000"  data-height="400" data-id="dialog-mask" 
    				data-mask="true" data-title="消息信息" >${obj.channelName }</a></td>
		    		<td>${obj.smsTypeName }</td>
		    		<td>${obj.policyName }</td>
		    	</tr>
	    	</c:forEach>
    	</tbody>
    </table>
</div>
<script>
	$(':submit').click(function(){
		$("#channelName").val($("#channelId").find("option:selected").text());
		$("#smsTypeName").val($("#smsTypeId").find("option:selected").text());
		if($("#channelId").val() == "" && $("#smsTypeId").val() == "") {
			$(this).alertmsg("error", "请先选择短信通道或短信类型");
			return false;
		}
	});
</script>