<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<title>書籍一覧</title>
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
            SELECT * from book;
        </sql:query>

	<button>
		<a href="insert.jsp">追加</a>
	</button>

	<center>

		<form>

			<table border="1" width="40%">
				<caption>書籍一覧</caption>

				<tr>
					<th>ID</th>

					<th>書籍名</th>
					<th>出版社</th>
					<th>ページ数</th>
					<th colspan="3">操作</th>
				</tr>
				<c:forEach var="row" items="${result.rows}">
					<tr>
						<td><c:out value="${row.id}" /></td>
						<td><c:out value="${row.name}" /></td>
						<td><c:out value="${row.publisher}" /></td>
						<td><c:out value="${row.page}" /></td>
						<td><button>
								<a href="update.jsp?id=<c:out value="${row.id}"/>">修正</a>
							</button></td>
						<td><button>
								<a
									href="javascript:confirmGo('書籍を削除してよろしでしょうか？','deletedb.jsp?id=<c:out value="${row.id}"/>')">削除</a>
							</button></td>
						<td><button>
								<a href="impression.jsp?id=<c:out value="${row.id}"/>"> 感想の一覧
							</button></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<button>
			<a href="index.jsp">戻る</a>
		</button>
	</center>
</body>
</html>