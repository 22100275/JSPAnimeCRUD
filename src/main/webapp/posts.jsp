<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.jspanimecrud.BoardDAO, com.example.jspanimecrud.BoardVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>애니메이션 목록</title>
	<link rel="stylesheet" href="my.css">
</head>
<body>
<header>
	<h1>애니메이션 목록</h1>
	<%
		BoardDAO boardDAO = new BoardDAO();
		List<BoardVO> list = boardDAO.getBoardList();
		request.setAttribute("list",list);
	%>
</header>

<section>
	<ul>
		<c:forEach items="${list}" var="u">
		<li>
			<img src="${pageContext.request.contextPath}/upload/${u.getImg()}" alt="konosuba" width="10%" height="10%">
			<a href="view.jsp?no=${u.getNo()}">${u.getName()}</a>
			<span>저자 : ${u.getAuthor()} | 장르: ${u.getGenre()} | 평점: ${u.getRating()}</span>
		</li>
		</c:forEach>
	</ul>
</section>
<footer>
	<a href="addpostform.jsp" class="add-button">Add</a>
</footer>

</body>
</html>
