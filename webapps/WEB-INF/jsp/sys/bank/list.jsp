<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 银行卡列表 -->
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath() %>/sys/bank/list.do" method="post">
        <div class="bjui-searchBar">
            <label>银行名称：</label><input type="text" name="bankName" value="<c:out value='${search.bankName}'/>" class="form-control" size="10" />
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
            <c:if test="${powerlist.contains('/sys/bank/toadd.do') }">
            <div class="pull-right">
                <div class="btn-group">
                       <a href="<%=request.getContextPath() %>/sys/bank/toadd.do"
                       		class="btn btn-blue" data-toggle="dialog" data-width="600" 
                       		data-height="500" data-id="dialog-mask" data-mask="true">新增银行 </a>
                    	
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
    		<th align="center">银行id</th>
    		<th align="center">银行名称</th>
    		<th align="center">银行简称</th>
    		<th align="center">银行全称</th>
    		<th align="center">银行代号</th>
    		<th align="center">银行客服电话</th>
    		<th align="center">创建时间</th>
    		<th align="center">操作</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:if test="${empty list}">
    		<td colspan="8" align="center">暂无数据</td>
    	</c:if>
    	<c:if test="${!empty list}">
    		<c:forEach var="bank" items="${list}" varStatus="statu">
    	<tr>
    		<td>${bank.id}</td>
    		<td>${bank.bankName}</td>
    		<td>${bank.bankSname}</td>
    		<td>${bank.bankFullname}</td>
    		<td>${bank.bankNo}</td>
    		<td>${bank.bankTel}</td>
    		<td><fmt:formatDate value="${bank.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    		<td>
    			<a href="<%=request.getContextPath() %>/sys/bank/toedit.do?id=${bank.id}" 
    				class="btn btn-blue" data-toggle="dialog" data-width="600"  
    				data-height="500" data-id="dialog-mask" data-mask="true">编辑</a>
    		</td>
    	</tr>
    	</c:forEach>
    	</c:if>
    	
    	
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
