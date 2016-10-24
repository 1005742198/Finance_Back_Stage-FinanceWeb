<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 
融资方还款列表
 -->
<div class="bjui-pageHeader" id="repay-paylist-search">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/moneyflow/repaylist.do" method="post">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <div class="bjui-searchBar">
            <label>项目编号：</label><input type="text" name="projectCode" value="<c:out value='${search.projectCode}'/>" class="form-control" size="10" data-rule="integer"/>
           	<label>项目名称：</label><input type="text" name="projectName" value="<c:out value='${search.projectName}'/>" class="form-control" size="20" />
            <label>融资方：</label><input type="text" name="loanUserName" value="<c:out value='${search.loanUserName}'/>" class="form-control" size="10" />
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent" id="repay-paylist-search">
        <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center" width="26%">项目信息</th>
    		<th align="center" width="22%">融资方信息</th>
    		<th align="center" width="6%">还款期数</th>
    		<th align="center" width="16%">还款金额(元)</th>
    		<th align="center" width="12%">还款状态</th>
    		<th align="center" width="18%">还款时间</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="list" items="${list}">
    	<tr>
		<td>项目编号：${list.projectCode }<br />
    		<span class="text-tit pull-left">项目名称：</span><a href="<%=request.getContextPath()%>/moneyflow/getprojectinfo.do?id=${list.projectId}" 
    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" class="text-omit pull-left">${list.projectName }</a>
    		</td>
    		<td>
				<span class="text-tit pull-left">融资方：</span><a href="<%=request.getContextPath()%>/user/view.do?id=${list.loanUserId}" 
    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" class="text-omit pull-left">${list.loanUserName }</a>
    		</td>
    		<td align="center">${list.periodNumber }</td>
    		<td><fmt:formatNumber value="${list.payAmount }" pattern="0.00"/></td>
    		<td align="center"><c:if test="${list.payStatus==3}">处理中</c:if><c:if test="${list.payStatus==2}">处理成功</c:if><c:if test="${list.payStatus==4}">处理失败</c:if></td>
    		<td align="center"><fmt:formatDate value="${list.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
