<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<title>感想一覧</title>
<script>
	function confirmGo(m, u) {
		if (confirm(m)) {
			window.location = u;
		}
	}
</script>
</head>
<body>

	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/tbbook" user="root" password="" />

	<sql:query dataSource="${dbsource}" var="result">
            SELECT impressions.id,impressions.comment,impressions.book_id FROM book,impressions WHERE book.id=? AND book.id=impressions.book_id
              <sql:param value="${param.id}" />
        </sql:query>
        <button>
					<a href="insertImpress.jsp?bookId=<c:out value="${param.id}"/>">追加</a>
				</button>
	<center>
		<form>
			<table border="1" width="40%">
				<caption>感想の一覧</caption>
					
				<tr>
					<th>ID</th>

					<th>コメント</th>
					<th colspan="2">操作</th>
				</tr>
				<c:forEach var="row" items="${result.rows}">
					<tr>
						<td><c:out value="${row.id}" /></td>
						<td><c:out value="${row.comment}" /></td>

						<td><button>
								<a href="updateImpress.jsp?impressId=<c:out value="${row.id}"/>&bookId=<c:out value="${param.id}"/>">修正</a>
							</button></td>
						<td><button><a
							href="javascript:confirmGo('書籍を削除してよろしでしょうか？','deleteImpress.jsp?id=<c:out value="${row.id}"/>')">削除</a></button></td>

					</tr>
				</c:forEach>
			</table>
		</form>
		<a href="index.jsp">戻る</a>
	</center>
</body>
</html>