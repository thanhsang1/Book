<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>感想編集</title>
</head>
<body>
	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/tbbook" user="root" password="" />
	<sql:update dataSource="${dbsource}" var="count">
            UPDATE impressions SET comment = ?, book_id=?
            WHERE id='${param.impressId}'
            <sql:param value="${param.pname}" />
		<sql:param value="${param.bookId}" />



	</sql:update>
	<c:if test="${count>=1}">
		<font size="5" color='green'> Congratulations ! Data updated
			successfully.</font>
		<a href="impression.jsp?id=<c:out value="${param.bookId}"/>">Go Home</a>
	</c:if>
</body>
</html>