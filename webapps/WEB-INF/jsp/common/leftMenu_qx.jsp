<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	function ZtreeClick(event, treeId, treeNode) {
		if(treeNode.url == undefined || treeNode.url == "") {
			var treeObj = $.fn.zTree.getZTreeObj(treeId);
			treeObj.expandNode(treeNode, !treeNode.open, true, true);
			return;
		}
		var url = '<%=request.getContextPath()%>'+treeNode.url;
		var options={
				id:treeNode.id+"",
				url:url,
				title:treeNode.name,
				fresh:true
		};
		$(this).navtab(options);
		event.preventDefault();
	}
</script>
<div id="bjui-leftside">
    <div id="bjui-sidebar-s">
        <div class="collapse"></div>
    </div>
    <div id="bjui-sidebar">
        <div class="toggleCollapse"><h2><i class="fa fa-bars"></i> 导航栏 <i class="fa fa-bars"></i></h2><a href="javascript:;" class="lock"><i class="fa fa-lock"></i></a></div>
        <div class="panel-group panel-main" data-toggle="accordion" id="bjui-accordionmenu" data-heightbox="#bjui-sidebar" data-offsety="26">

			<c:forEach var="obj" items="${list }" varStatus="status">
				 <div class="panel panel-default">
	                <div class="panel-heading panelContent">
	                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#bjui-accordionmenu" href="#bjui-collapse${status.index }" class="active"><i class="fa fa-caret-square-o-down"></i>&nbsp;${obj.name }</a></h4>
	                </div>
	                <div id="bjui-collapse${status.index }" class="panel-collapse panelContent collapse <c:if test='${status.index==0 }'>in</c:if>">
	                	<div class="panel-body" >
		                	<ul id="leftMenu_ztree${status.index }" class="ztree" data-toggle="ztree" 
							data-options='{
								nodes:${obj.getChildJson() },
								expandAll : true,
								checkEnable:false,
								onClick: "ZtreeClick"
							}'
							>
						
			                </ul>
			             </div>
	                </div>
	                <div class="panelFooter"><div class="panelFooterContent"></div></div>
                </div>
			</c:forEach>     
        </div>
    </div>
</div>
