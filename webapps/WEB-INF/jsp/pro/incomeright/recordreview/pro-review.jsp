<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 主管审核项目 -->
<div class="bjui-pageContent"  id="pro-review">
	<form id="form" action="<%=request.getContextPath()%>/incomeright/recordreview/${action}.do" data-reload-navtab="true" data-toggle="validate" data-confirm-msg="确定审核通过？" data-callback="projectupateCallback">
		<input type="hidden" name="id" value="${project.id}">
		<input type="hidden" id="pass" name="pass" value="0">
		 <table class="table-condensed" width="100%">
				<tr>
					<td>
						<label class="control-label x130">审核意见：</label> 
						<textarea cols="50" rows="8" data-toggle="autoheight" data-rule="required;length[~200, true]" id="flowFeedOpinion" name="flowFeedOpinion"></textarea>
					</td>
				</tr>
				<tr>
					<td align="center">
					<button type="submit" class="btn-blue" id="checkPassBtn">审核通过</button>
	    			<a href="javascript:;" class="btn btn-orange"  id="checkBackBtn">退回</a>
					</td>
				</tr>
		 </table>
		 </form>
</div>
<script>
$('#form').validator({
	fields: {
        'flowFeedOpinion': 'required;length[~200, true]'
    }
}).on('click','#checkBackBtn',function(e){
	$("#form").on("valid.form", function(e, form) {
		$("#pass").val(0);
	    $(form).data("confirmMsg", "确定退回？").bjuiajax('ajaxForm', $(form).data())
	});
	$(e.delegateTarget).trigger("validate");
}).on("click", '#checkPassBtn', function(){
	$("#form").on("valid.form", function(e, form) {
		$("#pass").val(1);
	    $(form).data("confirmMsg", "确定通过？").bjuiajax('ajaxForm', $(form).data())
	});
})
function projectupateCallback(json) {
	if(json.statusCode == 200) {
		$(this).alertmsg("correct", json.message);
		$(this).dialog("closeCurrent");
		$(this).navtab("refresh");
	}else {
		$(this).alertmsg("error", json.message);
	}
}
</script>