<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title"></tiles:getAsString></title>
<!-- core CSS -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/prettyPhoto.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/responsive.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/font-awesome.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commons/valueInspection.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commons/messageCommons.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commons/commons.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/commons/jquery.serializejson.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/main/index.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->       
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-57-precomposed.png">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function() {
	$("li[name=" + $("#board_gubun").val() + "]").siblings().removeClass("active");
	$("li[name=" + $("#board_gubun").val() + "]").addClass("active");
	$("li[name=G]").siblings().removeClass("active");
	$("li[name=G]").addClass("active");

});
</script>
</head>
<body class="homepage">
<center>
	<div id="wrap">
		<!-- header -->
		<div id="header">
		   <tiles:insertAttribute name="header"></tiles:insertAttribute>
		</div>
		<!-- //header -->
		<!-- Container -->
<!-- 		<p style="clear:both;"></p> -->
		<div id="container">
			<section id="blog" class="container" >
			    <div class="left">	    	
			        <tiles:insertAttribute name="left"></tiles:insertAttribute>
			    </div>
			    <div id="content">
					<tiles:insertAttribute name="body"></tiles:insertAttribute>    	
			    </div>
			</section>
		</div>
		<!-- //Container -->
		<!-- footer -->
		<div id="footer">
			<tiles:insertAttribute name="footer"></tiles:insertAttribute>
		</div>
		<!-- //footer -->
	</div>
</center>
<script src="${pageContext.request.contextPath}/js/bootstrap/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap/jquery.prettyPhoto.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap/jquery.isotope.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap/main.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap/wow.min.js"></script>
</body>
</html>