<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>

<html>
<!-- 	<head> -->
<!-- 		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/> -->
<%-- 		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/frame.css"/> --%>
<%-- 		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/foo.css"/> <!-- Somente para exemplo. --> --%>
<%-- 		<title><decorator:title default="http://wbotelhos.com"/></title> --%>
<%-- 		<decorator:head/> --%>
<!-- 	</head> -->



	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
		<title><decorator:title default="Movy | A Movie Manager"/></title>

		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/frame.css"/>
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/foo.css"/> <!-- Somente para exemplo. -->
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.gridy.css"/>
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui-1.8.14.css"/>

		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.6.4.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui-1.8.14.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.tmpl.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.gridy.min.js"></script>

		<style type="text/css">
<!-- /* 			td { */ -->
<!-- /* 				font: 11px verdana !important; */ -->
<!-- /* 			} */ -->
<!-- 		</style> -->
	</head>






	<body id="corpo">
	
	
		<div id="geral"> <!-- 0 -->
			
    	  	<div id="topo"><%@ include file="/topo.jsp" %></div> <!-- 1 -->
    	  	<div id="menu"><%@ include file="/menu.jsp" %></div> <!-- 2 -->
      		
      		<div id="conteudo">
	      		<div id="conteudo-usuario">
	      			<decorator:body/>
	      		</div> <!-- 3 -->
			</div>
			
	      	<div id="rodape"><%@ include file="/rodape.jsp" %></div> <!-- 6 -->
    	</div>
	</body>
</html>











<%-- <%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %> --%>

<!-- <html> -->
<!-- 	<head> -->
<!-- 		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/> -->
<%-- 		<title><decorator:title default="Movy | A Movie Manager"/></title> --%>

<%-- 		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/> --%>
<%-- 		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.gridy.css"/> --%>
<%-- 		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui-1.8.14.css"/> --%>

<%-- 		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.6.4.min.js"></script> --%>
<%-- 		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui-1.8.14.min.js"></script> --%>
<%-- 		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.tmpl.min.js"></script> --%>
<%-- 		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.gridy.min.js"></script> --%>

<!-- 		<style type="text/css"> -->
<!-- /* 			td { */ -->
<!-- /* 				font: 11px verdana !important; */ -->
<!-- /* 			} */ -->
<!-- 		</style> -->
<!-- 	</head> -->
<!-- 	<body> -->
<%-- 		<div id="topo"><jsp:include page="../../topo.jsp" /></div> --%>
<%-- 		<div id="menu"><jsp:include page="../../menu.jsp" /></div> --%>

<!-- 		<div id="conteudo"> -->
<%-- 			<c:if test="${not empty error}">${error}</c:if> --%>
<%-- 			<c:if test="${not empty message}">${message}</c:if> --%>

<%-- 			<c:forEach var="error" items="${errors}"> --%>
<%--   				${error.category} - ${error.message} --%>
<%-- 			</c:forEach> --%>

<%-- 			<decorator:body/> --%>
<!-- 		</div> -->

<%-- 		<div id="rodape"><jsp:include page="../../rodape.jsp" /></div> --%>
<!-- 	</body> -->
<!-- </html> -->