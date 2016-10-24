<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 投资者/个人、企业 -->
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/user/custom/search.do">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <div class="bjui-searchBar">
            <%@ include file="/WEB-INF/jsp/user/custom/search_itembase.jsp" %>
            <button type="button" class="showMoreSearch" data-toggle="moresearch" data-name="custom2">
            	<i class="fa fa-angle-double-down"></i></button>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
        <div class="bjui-moreSearch">
			<%@ include file="/WEB-INF/jsp/user/custom/search_itemext.jsp" %>
        </div>
    </form>
</div>
<div class="bjui-pageContent">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center" width="8%">客户账号</th>
    		<th align="center" width="14%">客户简称</th>
    		<th align="center" width="18%">所属会员</th>
    		<th align="center" width="20%">客户全称</th>
    		<th align="center" width="14%">注册日期</th>
    		<th align="center" width="10%">客户类型</th>
    		<th align="center" width="6%">账户状态</th>
    		<th align="center" width="13%">操作</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="obj" items="${list}">
    	<tr>
    		<td>${obj.userCode}</td>
    		<td>${obj.userName}</td>
    		<td>${obj.ownerUserName}</td>
    		<td>${obj.realName}</td>
    		<td align="center"><fmt:formatDate value="${obj.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    		<td align="center"><c:forEach var="item" items="${OrgType}"><c:if test="${item.type==obj.orgTypeId}">${item}</c:if></c:forEach></td>
    		<td align="center"><c:forEach var="item" items="${DelStatusDesc}"><c:if test="${item.value==obj.userStatus}"><c:choose><c:when test="${item.value==3 }"><c:if test="${obj.auditStatus==1 }">待提交</c:if><c:if test="${obj.auditStatus==2 }">待审核</c:if></c:when><c:otherwise>${item}</c:otherwise></c:choose></c:if></c:forEach></td>
    		<td align="center">
    		<!-- 
    		<c:if test="${obj.userStatus==1||obj.userStatus==5 }">
    		<a href="/user/custom/frozen.do?id=${obj.id}" data-toggle="doajax" data-confirm-msg="确定要冻结吗？">冻结</a>
    		</c:if>
    		<c:if test="${obj.userStatus==2 }">
    		<a href="/user/custom/frozen.do?id=${obj.id}" data-toggle="doajax" data-confirm-msg="确定要冻结吗？">解冻</a>
    		</c:if>
    		<a href="/user/custom/delete.do?id=${obj.id}" data-toggle="doajax" data-confirm-msg="确定要删除吗？">删除</a>
    		 -->
    		<a href="<%=request.getContextPath()%>/user/view.do?id=${obj.id}" 
    				data-toggle="dialog" data-width="1000"  
    				data-height="800" data-id="dialog-mask" data-mask="true">客户详情</a>
    		<c:if test="${obj.userStatus==5 && obj.registerSource==1}">
    		<br/><a href="<%=request.getContextPath()%>/user/sendstatus.do?userId=${obj.id}" 
    				data-toggle="dialog" data-width="1000"  
    				data-height="800" data-title="查看默认密码发送状态" data-id="dialog-mask" data-mask="true">重发默认密码</a>
    		</c:if>
    		</td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>