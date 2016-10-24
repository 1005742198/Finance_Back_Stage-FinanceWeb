<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 消息录入列表 -->
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/message/manage/msglist.do">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <div class="bjui-searchBar">
            <label>消息标题：</label><input type="text" name="msgTitle" value="<c:out value='${search.msgTitle}'/>" class="form-control"  />
            <label>消息类型：</label>
            <select name="msgType" id="select2" data-toggle="selectpicker" class="show-tick" style="display: none;">
				<option value="0">-全部-</option>
				<c:forEach var="item" items="${msgTypeDesc }">
					<option value="${item.type }" <c:if test="${search.msgType==item.type }">selected</c:if>>${item}</option>
				</c:forEach>
			</select>
            <label>消息生效时间：</label>
            <input type="text" name="effectiveDateBegin" value="${search.effectiveDateBegin }" class="form-control" size="15" data-toggle="datepicker"
			data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date"/>
            <label>消息失效时间：</label>
            <input type="text" name="expireDateEnd" value="${search.expireDateEnd }" class="form-control" size="15" data-toggle="datepicker"
			data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date"/>
           <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-default" data-toggle="reloadsearch" data-icon="undo" data-clear-query="true">重置查询</a>&nbsp;
           	<c:if test="${powerlist.contains('/message/manage/to-addmsg.do') }">
            <div class="pull-right">
                <div class="btn-group">
                       <a href="<%=request.getContextPath()%>/message/manage/to-addmsg.do"
                       		class="btn btn-blue" data-toggle="dialog" data-width="1000" data-icon="plus"
                       		data-height="600" data-id="dialog-mask" data-mask="true">录入消息 </a>
                    	
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
    		<th align="center" width="10%">序号</th>
    		<th align="center" width="20%">消息标题</th>
    		<th align="center" width="26%">消息摘要</th>
    		<th align="center" width="10%">消息类型</th>
    		<th align="center" width="20%">消息时间信息</th>
    		<th align="center" width="14%">操作</th>
    	</tr>
    	</thead>
    	<tbody>
	    	<c:forEach var="obj" items="${list}">
		    	<tr>
		    		<td>
		    		<a href="<%=request.getContextPath()%>/message/manage/to-editinfo.do?id=${obj.id}" 
    				data-toggle="dialog" data-width="1000"  data-height="400" data-id="dialog-mask" 
    				data-mask="true" data-title="消息信息" >${obj.id }</a>
		    		</td>
		    		<td><a href="<%=request.getContextPath()%>/message/manage/to-editinfo.do?id=${obj.id}" 
    				data-toggle="dialog" data-width="1000"  data-height="400" data-id="dialog-mask" 
    				data-mask="true" data-title="消息信息" >${obj.msgTitle }</a></td>
		    		<td>${obj.msgSummary }</td>
		    		<td align="center">${obj.getMsgTypeDesc() }</td>
		    		<td>发送时间：<fmt:formatDate value="${obj.effectiveDate }" pattern="yyyy-MM-dd HH:mm:ss"/><br/>
		    			失效时间：<fmt:formatDate value="${obj.expireDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		    		<td>
			    		<c:if test="${powerlist.contains('/message/manage/editmsg.do') }">
		    				<a href="<%=request.getContextPath()%>/message/manage/to-editmsg.do?id=${obj.id}" 
		    					class="btn btn-blue" data-toggle="dialog" data-width="1000"  
		    					data-height="600" data-id="dialog-mask" data-mask="true">编辑</a>
	    				</c:if>
	    				<c:if test="${powerlist.contains('/message/manage/to-editinfo.do') }">
		    				<a href="<%=request.getContextPath()%>/message/manage/to-editinfo.do?id=${obj.id}" 
		    					class="btn btn-blue" data-toggle="dialog" data-width="1000"  
		    					data-height="600" data-id="dialog-mask" data-mask="true">浏览</a>
	    				</c:if>
	    				<c:if test="${powerlist.contains('/message/manage/delmsgsystem.do') }">
		    				<a href="<%=request.getContextPath()%>/message/manage/delmsgsystem.do?id=${obj.id}" 
		    					data-toggle="doajax" data-confirm-msg="确定要删除吗？">删除</a>
	    				</c:if>
	    				
		    		</td>
		    	</tr>
	    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
