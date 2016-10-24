<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<label>发行人：</label>
<input type="text" name="loanUserName" value="<c:out value='${search.loanUserName}'/>" class="form-control" size="15" />
<label>挂牌代码：</label>
<input type="text" name="projectCode" value="<c:out value='${search.projectCode}'/>" class="form-control" size="10" data-rule="integer"/>
<label>挂牌简称：</label>
<input type="text" name="projectName" value="<c:out value='${search.projectName}'/>" class="form-control" size="15" />
