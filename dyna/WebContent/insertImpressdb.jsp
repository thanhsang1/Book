<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<title>JINSERT Operation</title>
</head>
<body>
	<c:if test="${ empty param.pname}">
		<c:redirect url="a.jsp">
			<c:param name="errMsg" value="コメントを入力してください" />
		</c:redirect>

	</c:if>
	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/tbbook" user="root" password="" />
	<sql:update dataSource="${dbsource}" var="result">
            INSERT INTO impressions(comment, book_id) VALUES (?,?);
            
				<sql:param value="${param.pname}" />
		<sql:param value="${param.bookId}" />


	</sql:update>
	<c:if test="${result>=1}">
		<font size="5" color='green'> Congratulations ! Data inserted
			successfully.</font>

		<c:redirect url="impression.jsp">		
			<c:param name="id"
				value="${param.bookId}" />
		</c:redirect>
	</c:if>


</body>
</html>