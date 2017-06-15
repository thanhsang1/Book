<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 書籍編集</title>
</head>
<body>

	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/tbbook" user="root" password="" />

	<sql:query dataSource="${dbsource}" var="result">
            SELECT * from book where id=?;
            <sql:param value="${param.id}" />
	</sql:query>
	<form action="updatedb.jsp" method="post">
		<table border="0" width="40%">
			<caption>書籍編集</caption>

		
			<c:forEach var="row" items="${result.rows}">
				<tbody>
					<tr>
						<td><input type="hidden" value="${param.id}" name="id" />
					</tr>
					<tr>
						<td><label>書籍名</label></td>
						<td><input type="text" value="${row.name}" name="pname" /></td>
					</tr>
					<tr>
						<td><label>出版社</label></td>
						<td><input type="text" value="${row.publisher}" name="qty" /></td>
					</tr>
					<tr>
						<td><label>ページ数</label></td>
						<td><input type="text" value="${row.page}" name="page" /></td>
					</tr>
					<tr>
					<td></td>
					<td><input type="submit" value="編集" /></td>

					</tr>

				</tbody>

			</c:forEach>
		</table>
		<a href="book.jsp">戻る</a>
	</form>
</body>
</html>