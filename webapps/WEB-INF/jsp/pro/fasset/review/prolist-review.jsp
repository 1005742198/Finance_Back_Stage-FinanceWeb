<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 主管已审核，待平台审核的项目 -->
<div class="bjui-pageHeader" id="fasset-prolist-review-search">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>${ReviewControllerRoot}/list.do" method="post">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <div class="bjui-searchBar">
            <%@ include file="/WEB-INF/jsp/pro/fasset/search/search_itembase.jsp" %>
            <button type="button" class="showMoreSearch" data-toggle="moresearch" data-name="custom2">
            	<i class="fa fa-angle-double-down"></i></button>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
        <div class="bjui-moreSearch">
			<%@ include file="/WEB-INF/jsp/pro/fasset/search/search_itemext.jsp" %>
        </div>
    </form>
</div>

<div class="bjui-pageContent" id="fasset-prolist-review-list">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center" width="15%">项目信息</th>
    		<th align="center" width="15%">交易顾问</th>
    		<th align="center" width="15%">转让方信息</th>
    		<th align="center" width="17%">转让信息</th>
    		<th align="center" width="20%">时间相关</th>
    		<th align="center" width="8%">项目状态</th>
    		<th align="center" width="10%">执行审核</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="list" items="${list}">
    	<tr>
    		<td>编号:${list.projectCode}<br />
    			<span class="text-tit pull-left">名称：</span><a href="<%=request.getContextPath()%>/fasset/proissue/proinfo/view.do?id=${list.id}" 
    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" class="text-omit pull-left">${list.projectName}</a></td>
			<td><a href="<%=request.getContextPath()%>/user/view.do?id=${list.memberId}" 
			    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
			    				data-mask="true" >${list.memberName}</a>
			</td>
    		<td><span class="text-tit pull-left">转让方：</span><a href="<%=request.getContextPath()%>/user/view.do?id=${list.loanUserId}" 
    				data-toggle="dialog" data-width="800"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" class="text-omit pull-left">${list.loanUserName}</a></td>
    		<td>
    		挂牌金额：<fmt:formatNumber value="${list.projectMoney}" pattern="0.00"/>元<br />交易保证金：<fmt:formatNumber value="${list.guaranteeMoney }" pattern="0.00"/><c:if test="${list.guaranteeValueType ==1 }">元</c:if><c:if test="${list.guaranteeValueType ==2 }">%</c:if><br />
    		挂牌天数：${list.projectLimit}天<br />转让方式：${list.getTransferTypeDesc() }   
    		</td>
    		<td>项目提交：<fmt:formatDate value="${list.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/><br/>
    			主管审核：<fmt:formatDate value="${list.jgAuditTime}" pattern="yyyy-MM-dd HH:mm:ss"/><br/></td>
    		<td align="center"><c:forEach var="item" items="${projectStatusDesc}"><c:if test="${item.value==list.projectStatus}">${item}</c:if></c:forEach></td>
    		<td>
    			<c:if test="${powerlist.contains('/fasset/proissue/review/view.do')}">
    			<a href="<%=request.getContextPath()%>${ReviewControllerRoot}/view.do?id=${list.id}" 
	   				class="btn btn-default" data-toggle="dialog" data-width="800"  
	   				data-height="500" data-id="dialog-mask" data-mask="true">审核</a><br>
	   			</c:if>
    			<a href="<%=request.getContextPath()%>/fasset/proissue/proinfo/view.do?id=${list.id}" 
    				data-toggle="dialog" data-width="1000"  
    				data-height="600" data-id="dialog-mask" data-mask="true">项目详情</a>
    			<a href="<%=request.getContextPath()%>/fasset/proissue/proinfo/feedlist.do?projectId=${list.id}&belongType=2" 
    				data-toggle="dialog" data-width="1000"  
    				data-height="600" data-id="dialog-mask" data-mask="true">审核记录</a>
    		</td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
