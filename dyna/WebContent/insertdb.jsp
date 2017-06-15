<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<title>書籍登録</title>
</head>
<body>
	<c:if test="${ empty param.pname or empty param.qty}">
		<c:redirect url="insert.jsp">
			<c:param name="errMsg" value="データを入力してください" />
		</c:redirect>

	</c:if>
	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/tbbook" user="root" password="" />
	<sql:update dataSource="${dbsource}" var="result">
            INSERT INTO book(name,publisher, page) VALUES (?,?,?);
            <sql:param value="${param.pname}" />
		<sql:param value="${param.qty}" />
				<sql:param value="${param.page}" />
		
	</sql:update>
	<c:if test="${result>=1}">
		<font size="5" color='green'>書籍登録が完了しました.</font>

		<c:redirect url="book.jsp">
			<c:param name="susMsg"
				value="Congratulations ! Data inserted
            successfully." />
		</c:redirect>
	</c:if>


</body>
</html>