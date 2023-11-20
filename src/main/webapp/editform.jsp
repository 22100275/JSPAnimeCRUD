<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--    pageEncoding="UTF-8"%>--%>
<%-- <%@page import="com.example.jspanimecrud.BoardDAO, com.example.jspanimecrud.BoardVO"%>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--<meta charset="UTF-8">--%>
<%--<title>Edit Form</title>--%>
<%--</head>--%>
<%--<body>--%>

<%--<%--%>
<%--	BoardDAO boardDAO = new BoardDAO();--%>
<%--	String id=request.getParameter("id");	--%>
<%--	BoardVO u=boardDAO.getBoard(Integer.parseInt(id));--%>
<%--%>--%>

<%--<h1>Edit Form</h1>--%>
<%--<form action="editpost.jsp" method="post">--%>
<%--<input type="hidden" name="seq" value="<%=u.getSeq() %>"/>--%>
<%--<table>--%>
<%--<tr><td>Title:</td><td><input type="text" name="title" value="<%= u.getTitle()%>"/></td></tr>--%>
<%--<tr><td>Writer:</td><td><input type="text" name="writer" value="<%= u.getWriter()%>" /></td></tr>--%>
<%--<tr><td>Content:</td><td><textarea cols="50" rows="5" name="content"><%= u.getContent()%></textarea></td></tr>--%>
<%--<tr><td colspan="2"><input type="submit" value="Edit Post"/>--%>
<%--<input type="button" value="Cancel" onclick="history.back()"/></td></tr>--%>
<%--</table>--%>
<%--</form>--%>

<%--</body>--%>
<%--</html>--%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@page import="com.example.jspanimecrud.BoardDAO, com.example.jspanimecrud.BoardVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>애니메이션 정보 수정</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="my.css">
</head>
<body>
<header>
	<h1 class="text-center mt-3">애니메이션 수정</h1>
	<%
		BoardDAO boardDAO = new BoardDAO();
		String no=request.getParameter("no");
		BoardVO u=boardDAO.getBoard(Integer.parseInt(no));
	%>
</header>

<section class="container mt-5">
	<form action="editpost.jsp" id="addForm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="no" value="<%=u.getNo()%>"/>
		<div class="mb-3">
			<label class="form-label">애니메이션 이름:</label>
			<input type="text" name="name" class="form-control" value="<%=u.getName()%>">
		</div>
		<div class="mb-3">
			<label class="form-label">작가:</label>
			<input type="text" name="author" class="form-control" value="<%=u.getAuthor()%>">
		</div>
		<div class="mb-3">
			<label class="form-label">장르:</label>
			<input type="text" name="genre" class="form-control" value="<%=u.getGenre()%>">
		</div>
		<div class="mb-3">
			<label class="form-label">평점:</label>
			<input type="number" name="rating" class="form-control" min="0" max="10" step="0.1" value="<%=u.getRating()%>">
		</div>
		<div class="mb-3">
			<label class="form-label">회차:</label>
			<input type="number" name="episode" class="form-control" value="<%=u.getEpisode()%>" >
		</div>
		<div class="mb-3">
			<label class="form-label">시청 등급:</label>
			<input type="number" name="pg" class="form-control" value="<%=u.getPg()%>">
		</div>
		<div class="mb-3">
			<label class="form-label">감독:</label>
			<input type="text" name="director" class="form-control" value="<%=u.getDirector()%>">
		</div>
		<div class="mb-3">
			<label class="form-label">이미지:</label>
			<input type="file" name="img" class="form-control" value="<%=u.getImg()%>">
		</div>
		<div class="bt">
			<button type="submit" class="btn btn-primary">수정</button>
		</div>
	</form>
</section>

<footer class="text-center mt-5">
	<a href="index.jsp" class="btn btn-secondary">뒤로 가기</a>
</footer>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>

<script>

</script>
</body>
</html>



