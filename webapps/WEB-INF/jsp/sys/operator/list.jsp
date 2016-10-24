<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
	//删除callback
	function deleteCallback(json){
		if(json.statusCode == 200){
			$(this).navtab('refresh')
				   .alertmsg('ok','删除成功',{"alertTimeout":1000});
		}else{
			$(this).bjuiajax('ajaxDone', json)
		}
	} 
	//更新状态callback
	function updateStatuCallback(json){
		if(json.statusCode == 200){
			$(this).bjuiajax('ajaxDone', json)
				   .navtab('refresh');
		}else{
			$(this).bjuiajax('ajaxDone', json)
		}
	}
</script>
<!-- 操作人列表 -->
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${ctx}/memberoperator/list.do" method="post">
        <input type="hidden" name="pageSize" value="${model.pageSize}">
        <input type="hidden" name="pageCurrent" value="${model.pageCurrent}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}">
        <div class="bjui-searchBar">
            <label>操作员登录名：</label><input type="text" name="loginName" value="<c:out value='${operatorParam.loginName}'/>" class="form-control" size="10" />
            <label>操作员姓名：</label><input type="text" name="realName" value="<c:out value='${operatorParam.realName}'/>" class="form-control" size="10" />
            <label>手机号码：</label><input type="text" name="phone" value="<c:out value='${operatorParam.phone}'/>" class="form-control" size="10" />
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
            <c:if test="${powerlist.contains('/memberoperator/add.do') }">
            <div class="pull-right">
                <div class="btn-group">
                       <a href="${ctx}/memberoperator/add.do"
                       		class="btn btn-blue" data-toggle="dialog" data-width="600" 
                       		data-height="500" data-id="dialog-mask" data-mask="true">新增操作员 </a>
                    	
                </div>
            </div>
            </c:if>
        </div>
    </form>
</div>

<div class="bjui-pageContent">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center">编号</th>
    		<th align="center">操作员登录名</th>
    		<th align="center">操作员姓名</th>
    		<th align="center">手机号码</th>
    		<th align="center">操作员类型</th>
    		<th align="center">职务/职业</th>
    		<th align="center">所属部门</th>
    		<th align="center">状态</th>
    		<th align="center">更新时间</th>
    		<th align="center">操作</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:if test="${empty operatorlist}">
    		<td colspan="10" align="center">暂无数据</td>
    	</c:if>
    	<c:if test="${!empty operatorlist}">
    		<c:forEach var="operator" items="${operatorlist}" varStatus="statu">
    	<tr>
    		<td>${operator.id}</td>
    		<td>${operator.loginName}</td>
    		<td>${operator.realName}</td>
    		<td>${operator.phone}</td>
    		<td>
    			<c:if test="${operator.operatorType == 1 }">
    				业务人员
    			</c:if>
    			<c:if test="${operator.operatorType == 2 }">
    				系统管理员
    			</c:if>
    		</td>
    		<td>${operator.duty}</td>
    		<td>${operator.department}</td>
    		<td>
    			<c:if test="${operator.operatorStatus == 0 }">
    				冻结
    			</c:if>
    			<c:if test="${operator.operatorStatus == 1 }">
    				正常
    			</c:if>
    			<c:if test="${operator.operatorStatus == 2 }">
    				待激活
    			</c:if>
    		</td>
    		<td><fmt:formatDate value="${operator.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    		<td>
    			<c:if test="${operator.vipOperator==0}">
    			<c:if test="${powerlist.contains('/memberoperator/edit.do') }">
    			<a href="${ctx}/memberoperator/edit.do?id=${operator.id}" 
    				class="btn btn-blue" data-toggle="dialog" data-width="600"  
    				data-height="500" data-id="dialog-mask" data-mask="true">编辑</a>
   				</c:if>
   				<c:if test="${powerlist.contains('/memberoperator/setrole.do') }">
   					<a href="${ctx}/memberoperator/setrole.do?id=${operator.id}" 
   				class="btn btn-blue" data-toggle="dialog" data-width="600"   
   				data-height="450" data-id="dialog-mask" data-mask="true">设置角色</a>
   				</c:if>
				<c:if test="${operator.operatorStatus == 2 && powerlist.contains('/memberoperator/delete.do') }">
				<a href="${ctx}/memberoperator/delete.do?id=${operator.id}" 
				data-toggle="doajax" data-confirm-msg="确定要删除吗？" data-callback="deleteCallback">删除</a>
				</c:if>
    			<c:if test="${powerlist.contains('/memberoperator/updateopestatu.do') }">
    			<c:if test="${operator.operatorStatus == 0}">
    				<a href="${ctx}/memberoperator/updateopestatu.do?id=${operator.id}&operatorStatus=${operator.operatorStatus}" 
    				data-toggle="doajax" data-confirm-msg="确定要解冻？" data-callback="updateStatuCallback">
    					解冻
    				</a>
    			</c:if>
    			<c:if test="${operator.operatorStatus == 1}">
    				<a href="${ctx}/memberoperator/updateopestatu.do?id=${operator.id}&operatorStatus=${operator.operatorStatus}"  
    				data-toggle="doajax" data-confirm-msg="确定要冻结？" data-callback="updateStatuCallback">
    					冻结
    				</a>
    			</c:if>
    			</c:if>
    			</c:if>
    		</td>
    	</tr>
    	</c:forEach>
    	</c:if>
    	
    	
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
