<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 其他附件 -->
<script type="text/javascript">
function uploadSuccess(file, data, $upload) {
	var json = $.parseJSON(data)
    if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
    	var arr = json.fileName.split(":");
    	var showFileName,linkFileName;
    	if(arr.length == 1) {
    		showFileName = linkFileName = json.fileName;
    	}else {
    		showFileName = arr[0];
    		linkFileName = arr[1];
    	}
    	var html = '|<a href="'+(json.accessPath+linkFileName) +'" target="_blank">'+showFileName+'</a>';
    	var obj = $upload.next();
    	if ($.hasFlash.v >= 9){
    		obj =  $('#'+$upload.attr('id')).parent().next();	
		}
    	var oldFiles = obj.val();
    	oldFiles = oldFiles.length == 0 ? (json.fileName) : oldFiles + "|" + (json.fileName);
    	obj.val(oldFiles).next().append(html);
    }
}
function afterEdit(json){
	if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
		$(this).alertmsg('ok',json.message)
		$(this).bjuiajax('refreshLayout', {target:'#files',url:$("#files_link").attr('href')});
	}else
		$(this).alertmsg('error',json.message);
}
</script>
<div class="bjui-pageContent tableContent">
    <form action="" id="j_custom_form" class="pageForm" data-toggle="validate" method="post">
        <table id="userfiles" class="table table-bordered table-hover table-striped table-top"  data-toggle="tabledit" data-initnum="0" data-action="<%=request.getContextPath()%>/userfiles/edit.do" data-single-noindex="true" data-callback="afterEdit">
        	<thead>
                <tr data-idname="id">
                    <th title="附件id"  data-noedit="true"><input type="hidden" name="userId" value="${userId}"></th>
                    <th title="附件名称"><input type="text" id="infoName[#index#]" name="infoName" data-rule="required" value="" size="5" maxlength="50"></th>
                    <th title="附件说明"><input type="text" id="infoDesc[#index#]" name="infoDesc" data-rule="" value="" size="5" maxlength="100"></th>
                    <th title="附件">  <div 
                       	data-toggle="upload"  
                           data-uploader="//<%=request.getServerName() %>/userfiles/upload.do?userId=${userId}&jsessionid=${jsessionid}"  
                           data-file-size-limit="1024000000" 
                           data-file-type-exts="${fileType}" 
                           data-multi="true" 
                           data-auto="true" 
                           data-on-upload-success="uploadSuccess"
                           data-max-file="5">
                           </div>
                        <input type="hidden" name="allFileNames" class="pic-name" id="projectFiles_#index#" value=""><span class="pic-box"></span>
                    </th>
                    <th title="新增" data-addbtn="true" width="100">
                        <a href="javascript:;" class="btn btn-blue" data-toggle="dosave">保存</a>
                        <a data-action="<%=request.getContextPath()%>/userfiles/del.do?id=" href="javascript:;" class="btn btn-red row-del" data-confirm-msg="确定要删除该行信息吗？">删</a>
                    </th>
                </tr>
            </thead>
            <tbody>
               <c:forEach var="obj" items="${list}" varStatus="status"> 
                <tr data-id="${obj.id}"><input type="hidden" name="userId" value="${userId}">
                    <td data-noedit="true">${obj.id}</td>
                    <td>${obj.infoName}</td>
                    <td>${obj.infoDesc}</td>
                    <td data-val="${obj.allFileNames()}">
                    	<c:if test="${not empty obj.file1}">
                    		<a target="_blank" href="${accessPath}u${obj.userFileGuid},${obj.file1Link()}">${obj.file1Show()}</a>
                    	</c:if>
                    	<c:if test="${not empty obj.file2}">
                    		|<a target="_blank" href="${accessPath}u${obj.userFileGuid},${obj.file2Link()}">${obj.file2Show()}</a>
                    	</c:if>
                    	<c:if test="${not empty obj.file3}">
                    		|<a target="_blank" href="${accessPath}u${obj.userFileGuid},${obj.file3Link()}">${obj.file3Show()}</a>
                    	</c:if>
                    	<c:if test="${not empty obj.file4}">
                    		|<a target="_blank" href="${accessPath}u${obj.userFileGuid},${obj.file4Link()}">${obj.file4Show()}</a>
                    	</c:if>
                    	<c:if test="${not empty obj.file5}">
                    		|<a target="_blank" href="${accessPath}u${obj.userFileGuid},${obj.file5Link()}">${obj.file5Show()}</a>
                    	</c:if>
                    </td>
                    <td data-noedit="true">
                        <button type="button" class="btn-blue" data-toggle="doedit">编辑</button>
                        <a data-action="<%=request.getContextPath()%>/userfiles/del.do?id=" href="<%=request.getContextPath()%>/userfiles/del.do?id=${obj.id}" class="btn btn-red row-del" data-confirm-msg="确定要删除该行信息吗？">删</a>
                    </td>
                </tr>
			</c:forEach>
            </tbody>
        </table>
    </form>
</div>
