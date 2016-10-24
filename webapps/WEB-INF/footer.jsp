<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"  %>
<script>
	var copyrightYear = "2015";
	var currentYear=new Date().getFullYear();
	if(currentYear>2015)
	{
		copyrightYear ='2015-' + currentYear;
	}
</script>
<div class="qj-footer">
		<div class="hj_wrap text-center" style="position:relative;">
			<!--<div class="bottom-pic"></div>-->
			<p>版权所有 © <script>document.write(copyrightYear);</script> ${exchange.poweredBy }</p>
			<p>Copyright © <script>document.write(copyrightYear);</script> Qingdao Financial Asset Exchange Co.Ltd.All Rights Reserved</p>
			<p><a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=37021202000071" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;"><img src="//cf2.<%=host%>.com/img/security_remark.png" style="float:left;"><span style="height:20px;line-height:20px;margin: 0px 0px 0px 1px;color:#737373">鲁公网安备 37021202000071号</span></a>&nbsp;&nbsp;&nbsp;&nbsp;鲁ICP备15038929号</p>
			<!-- <img class="qrcode" src="<%=request.getContextPath() %>/js/BJUI/themes/css/img/qrcode.png" alt="" title="" /> -->
		</div>
	</div>