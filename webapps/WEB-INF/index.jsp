<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
    <title>${exchange.ptomsSysName }—${exchange.simpleName }</title>
    <meta name="Keywords" content="${exchange.exchangeName }—${exchange.ptomsSysName }"/>
    <%@ include file="jsp/common/intoHead.jsp" %>
</head>

<body>
    <%@ include file="jsp/common/header.jsp" %>

    <div id="bjui-container" class="clearfix">
        <%@ include file="jsp/common/leftMenu_qx.jsp" %>

        <div id="bjui-navtab" class="tabsPage">
            <div class="tabsPageHeader">
                <div class="tabsPageHeaderContent">
                    <ul class="navtab-tab nav nav-tabs">
                        <li data-url="/getSumCfmRightMoney.do" class="active"><a href="javascript:;"><span><i class="fa fa-home"></i> #maintab#</span></a></li>
                    </ul>
                    
                </div>
                <div class="tabsLeft"><i class="fa fa-angle-double-left"></i></div>
                <div class="tabsRight"><i class="fa fa-angle-double-right"></i></div>
                <div class="tabsMore"><i class="fa fa-angle-double-down"></i></div>
            </div>
            <ul class="tabsMoreList">
                <li><a href="javascript:;">#maintab#</a></li>
            </ul>

            <div class="navtab-panel tabsPageContent">
                <div class="navtabPage unitBox">

                    <div class="bjui-pageHeader" style="background:#FFF;">
                        
                    </div>

                </div>
            </div>
        </div>
    </div>
    <%@ include file="jsp/common/footer.jsp" %>
</body>

</html>