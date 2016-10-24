<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="bjui-pageContent">
    <div>是否已经支付成功?如遇到问题，请咨询客服</div>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close" onclick="closeDialog();" >关闭</button></li>
        <li><button type="button" class="btn-blue" data-icon="save" onclick="closeDialog();" >确定</button></li>
    </ul>
</div>
<script>
	function closeDialog(){
		$(this).dialog("closeCurrent").navtab("refresh");
	}
</script>