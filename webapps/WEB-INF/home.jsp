<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.my-table > thead > tr > th { background: #fff;}
.my-table td {overflow:hidden; white-space:nowrap;}
.panel-block-nm {height:100px;overflow:auto;padding:0;}
.panel-block-lg {height:330px;overflow:auto;padding:0;}
/*.projectShow .panel-body {margin-bottom:20px;font-size:32px;}*/
.projectShow {margin-bottom:20px;}
.projectShow .col-md-2 .btn{position:relative;margin:10px;padding:10px;width:100%;height:auto;background-color:#6CA6CD;color:#fff;}
.projectShow .col-md-2 .badge{background:#fff;color:#CD3333;margin-left:5px;font-size:16px;}
.link{position:absolute;left:0;right:0;top:0;bottom:0;}
</style>
<script type="text/javascript">
$(function(){
	function buyingProject() {
		$.ajax({
			type: "GET",
			url: "/buyingproject.do",
			dataType: "json",
			success: function(data) {
				var html = [];
				for(var i=0; i<data.length; i++) {
					html.push('<tr>');
					if(data[i].productTypeId == 2) {
						html.push('<td><a href="/fasset/proissue/proinfo/view.do?id='+data[i].id); 
					}else if(data[i].productTypeId == 3) {
						html.push('<td><a href="/incomeright/proinfo/view.do?id='+data[i].id); 
					}else {
						html.push('<td><a href="/debt/proissue/proinfo/view.do?id='+data[i].id); 
					}
					html.push('" data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" data-mask="true" >'+data[i].projectName+'</a></td>');
					html.push('<td align="center">预融资额：'+data[i].projectMoney+'元</td>');
					html.push('<td align="center">募集金额'+data[i].collectMoney+'元;募集比例'+(data[i].collectMoney*100/data[i].projectMoney).toFixed(2)+'%</td>');
					html.push('</tr>');
				}
				$("#home_tbody1").html(html.join(""));
			}
		});
		//setTimeout(buyingProject, 300000);
	}
	function projectCount() {
		$.ajax({
			type: "GET",
			url: "/projectcount.do",
			dataType: "json",
			success: function(data) {
				var str = "";
				for(var i=0; i<data.length; i++) {
					var obj = data[i];
					//str +="<div class='col-md-2'><div class='panel panel-default'><div class='panel-heading'>"
						//+obj.projectStatusDesc+"</div><div class='panel-body'>"+obj.count+"</div></div><a href='javascript:;' class='link'></a></div>";
					str += "<div class='col-md-2'><button class='btn' type='button'>" + obj.projectStatusDesc 
						+ "<span class='badge'>" + obj.count + "</span></button></div>";
				}
				
				$(".projectShow").html(str);
			}
		});
		//setTimeout(projectCount, 300000);
	}
	buyingProject();
	projectCount();
}); 
function re(){
	$(this).bjuiajax('refreshDiv', 'home-pageContent');
	
}
</script>
<div class="bjui-pageHeader">
	<h4 class="pull-left">欢迎进入青金所—交易所运营平台</h4><h4 class="pull-right"><button type="button" class="btn btn-green pull-right" data-icon="refresh" onclick="$(this).navtab('refresh')">刷新</button>累计交易量：<fmt:formatNumber value="${summoney }" currencySymbol="" type="currency" maxFractionDigits="2" minFractionDigits="2"/> 元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4>	
</div>
<div class="bjui-pageContent">
	<div class="container-fluid">
		<div class="row text-center projectShow">
		</div>
		<div class="row">
			<div class="col-md-12">	
				<div class="panel panel-default panel-block-lg">
					<div class="panel-heading">发行认购中项目：</div>
					<div style="height:290px;overflow: auto;">
						<table class="table table-hover my-table" style="table-layout: fixed;">
							<thead>
								<tr>
									<th>项目信息</th>
									<th align="center">融资信息</th>
									<th align="center">认购信息</th>
								</tr>
							</thead>
							<tbody id="home_tbody1">								
							</tbody>	  
						</table>
					</div>											
				</div>
			</div>
		</div>
		
	</div>
</div>