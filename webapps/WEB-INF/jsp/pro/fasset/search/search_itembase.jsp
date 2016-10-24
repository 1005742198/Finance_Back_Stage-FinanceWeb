<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<label>项目编码：</label>
<input type="text" name="projectCode" value="<c:out value='${search.projectCode}'/>" class="form-control" size="10" data-rule="integer"/>
<label>项目名称：</label>
<input type="text" name="projectName" value="<c:out value='${search.projectName}'/>" class="form-control" size="15" />
<label>项目状态：</label> 
<select name="projectStatus" id="select2" data-toggle="selectpicker" class="show-tick" style="display: none;">
	<option value="">全部</option>
	<c:forEach var="item" items="${projectStatusDesc}">
	<option value="${item.value}" <c:if test="${search.projectStatus==item.value}">selected</c:if>>${item}</option>
	</c:forEach>
</select>