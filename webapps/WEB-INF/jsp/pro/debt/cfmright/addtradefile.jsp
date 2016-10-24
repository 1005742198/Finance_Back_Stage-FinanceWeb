<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 新增导入文件-->
<div class="bjui-pageContent">
	<form id="addtradefile" action="<%=request.getContextPath()%>/debt/proissue/cfmright/uploadtradefile.do" enctype="multipart/form-data" method="post" data-toggle="validate" data-reload-navtab="true" data-confirm-msg="确定要保存吗？" data-callback="addtradefilecallback">
		 <input type="hidden" name="projectId" value="${project.id}">
		 <table class="table table-condensed table-hover" width="100%">
		 	<tbody>
				<tr>
				 <td>
                    <label class="control-label x120 text-tit pull-left">挂牌项目名称：</label>
                    <span class="text-omit pull-left">${project.projectName}</span>
                 </td>
                 <td>
                    <label class="control-label x90">挂牌项目编号：</label>
                    <span>${project.projectCode}</span>
                 </td>
				</tr>
				<tr>
				 <td>
                    <label class="control-label x120">挂牌规模：</label>
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
						<label class="control-label x120">投资顾问：</label> 
						<input type="hidden" name="loanUserId" id="loanUserId">
						<input type="hidden" name="loaderUserCode" id="loaderUserCode">
						<input readonly type="text" name="loader" id="loader" size="15"
							data-toggle="lookup" data-title="投资顾问选择" data-url="<%=request.getContextPath()%>/user/lookupload.do?userTypeId=3" data-width="600" data-height="300">
					</td>
				</tr>
				<tr>
					<td colspan="2" class="form-group">
						<label class="control-label x120 col-xs-1" style="padding:5px 5px 0;">上传交易记录文件：</label> 
						<div class="col-xs-10" style="padding:0">
							<input id="lefile" type="file" name="tradefile" style="display:none">
							<input id="photoCover" class="form-control input-large" type="text">
							<button type="button" class="btn btn-default" onclick="$('input[id=lefile]').click();">浏览</button>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" >
		    			<button type="submit" class="btn btn-blue">保存并继续</button>
		    			<button type="button" class="btn-close">关闭</button>
					</td>
				</tr>
		 </table>
	</form>
</div>
<script>
$('input[id=lefile]').change(function() {
   $('#photoCover').val($(this).val());
});
$("#loader").on("afterchange.bjui.lookup", function(e, data){
	$("#loader").blur();
})
function addtradefilecallback(json) {
	if(json.statusCode == 200) {
		$(this).alertmsg("correct", "文件上传成功", {autoClose:false,mask:true,okCall:function(){$(this).dialog("closeCurrent");$(this).dialog({id:'dialog-comfirm-import',title:'确认导入文件',width:700,height:250,mask:true,url:'<%=request.getContextPath()%>/debt/proissue/cfmright/tocomfirmimport.do?totalInvesters='+json.totalInvesters+'&projectId='+json.projectId+'&tradeRecordId='+json.tradeRecordId+'&totalNum='+json.totalNum+'&totalMoney='+json.totalMoney});}});
	}else {
		$(this).alertmsg("error", json.message);
	}
}

</script>