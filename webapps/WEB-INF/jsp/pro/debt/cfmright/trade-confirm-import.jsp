<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--确认导入文件 -->
<div class="bjui-pageContent">
	<form id="comfirmImport" action="<%=request.getContextPath()%>/debt/proissue/cfmright/confirmimport.do" data-toggle="validate" data-reload-navtab="true"  data-callback="confirmimportcallback">
		 <input type="hidden" name="tradeRecordId" value="${tradeRecordId}">
		 <table class="table table-condensed table-hover" width="100%">
		 	<tbody>
				<tr>
				 <td>
                    <label class="control-label x90 text-tit pull-left">挂牌项目名称：</label>
                    <span class="text-omit pull-left">${project.projectName}</span>
                 </td>
                 <td>
                    <label class="control-label x90">挂牌项目编号：</label>
                    <span>${project.projectCode}</span>
                 </td>
				</tr>
				<tr>
				 <td>
                    <label class="control-label x90">挂牌规模：</label>
                    <span>${project.projectMoney}</span>
                 </td>
                 <td>
                    <label class="control-label x90">募集时间：</label>
                    <span>
                    	<fmt:formatDate value="${project.buyTimeStart}" pattern="yyyy.MM.dd"/>-
                    	<fmt:formatDate value="${project.buyTimeEnd}" pattern="yyyy.MM.dd"/>
                    </span>
                 </td>
				</tr>
				<tr>
					<td colspan="2">
					本次导入的数据条数：<span class="red">${totalNum }</span>条；导入投资金额总计：<span class="red">${totalMoney }</span>元；涉及投资人数：<span class="red">${totalInvesters }</span>人
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" >
		    			<button type="submit" class="btn btn-blue">确认导入</button>
		    			<button type="button" class="btn-close">取消导入</button>
					</td>
				</tr>
		 </table>
	</form>
</div>
<script>

function confirmimportcallback(json) {
	if(json.statusCode == 200) {
		$(this).alertmsg("correct", "导入数据处理中，请稍后查看结果！", {autoClose:false,mask:true,okCall:function(){$(this).dialog("closeCurrent");$(this).dialog('refresh', 'traderecord_id');}});
	}else {
		$(this).alertmsg("error", json.message);
	}
}

</script>