<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 其他附件 -->
<div class="bjui-pageContent tableContent">
        <table class="table table-bordered table-hover table-striped table-top" width="100%">
        	<thead>
        	<tr>
    		<th>缓存名称</th>
    		<th>缓存KEY或前缀</th>
    		<th>缓存后缀(多个,分隔)</th>
    		<th>操作</th>
            </thead>
            <tbody>
		    	<tr>
		    		<td>行业类型</td>
                    <td>SystypeIndustry_</td>
                    <td><input id="SystypeIndustry_input"></td>
                    <td><a data-key="SystypeIndustry_" href=""
    				data-toggle="doajax" data-confirm-msg="确定要删除吗？">删除</a></td>
		    	</tr>
		    	<tr>
		    		<td>公司类型</td>
                    <td>SystypeCompany_</td>
                    <td><input id="SystypeCompany_input"></td>
                    <td><a data-key="SystypeCompany_" href=""
    				data-toggle="doajax" data-confirm-msg="确定要删除吗？">删除</a></td>
		    	</tr>
		    	<tr>
		    		<td>省份</td>
                    <td>SysareaProvince_</td>
                    <td><input id="SysareaProvince_input"></td>
                    <td><a data-key="SysareaProvince_" href=""
    				data-toggle="doajax" data-confirm-msg="确定要删除吗？">删除</a></td>
		    	</tr>
		    	<tr>
		    		<td>城市</td>
                    <td>SysareaCity_</td>
                    <td><input id="SysareaCity_input"></td>
                    <td><a data-key="SysareaCity_" href=""
    				data-toggle="doajax" data-confirm-msg="确定要删除吗？">删除</a></td>
		    	</tr>
		    	<tr>
		    		<td>区县</td>
                    <td>SysareaDistrict_</td>
                    <td><input id="SysareaDistrict_input"></td>
                    <td><a data-key="SysareaDistrict_" href=""
    				data-toggle="doajax" data-confirm-msg="确定要删除吗？">删除</a></td>
		    	</tr>
		    	<tr>
		    		<td>操作者权限</td>
                    <td>MemberOperator_Menus_</td>
                    <td><input id="MemberOperator_Menus_input"></td>
                    <td><a data-key="MemberOperator_Menus_" href=""
    				data-toggle="doajax" data-confirm-msg="确定要删除吗？">删除</a></td>
		    	</tr>
		    	<tr>
		    		<td>交易所信息</td>
                    <td>FeExchange_</td>
                    <td><input id="FeExchange_input"></td>
                    <td><a data-key="FeExchange_" href=""
    				data-toggle="doajax" data-confirm-msg="确定要删除吗？">删除</a></td>
		    	</tr>
		    	<tr>
		    		<td>系统参数表</td>
                    <td>sysParam_</td>
                    <td><input id="sysParam_input"></td>
                    <td><a data-key="sysParam_" href=""
    				data-toggle="doajax" data-confirm-msg="确定要删除吗？">删除</a></td>
		    	</tr>
		    	<tr>
		    		<td>系统异常表</td>
                    <td>SysException</td>
                    <td><input id="SysExceptioninput" type="hidden"></td>
                    <td><a data-key="SysException" href=""
    				data-toggle="doajax" data-confirm-msg="确定要删除吗？">删除</a></td>
		    	</tr>
            </tbody>
        </table>
</div>
<script type="text/javascript">
$.CurrentNavtab.find('a').on("click", function(){
	var key = $(this).attr("data-key");
	var url = "<%=request.getContextPath()%>/cached/delete.do?key="+key+"&values="+$("#"+key+"input").val();
	$(this).attr("href", url);
})
</script>
