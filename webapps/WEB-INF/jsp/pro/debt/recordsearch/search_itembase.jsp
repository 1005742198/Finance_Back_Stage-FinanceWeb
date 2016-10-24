<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<label>融资方：</label>
<input type="text" name="loanUserName" value="<c:out value='${search.loanUserName}'/>" class="form-control" size="15" />
<label>备案代码：</label>
<input type="text" name="recordCode" value="<c:out value='${search.recordCode}'/>" class="form-control" size="10" data-rule="integer"/>
<label>备案简称：</label>
<input type="text" name="recordName" value="<c:out value='${search.recordName}'/>" class="form-control" size="15" />
