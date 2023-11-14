<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.jspanimecrud.BoardDAO, com.example.jspanimecrud.BoardVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">--%>
<%--<title>free board</title>--%>
<%--<style>--%>
<%--#list {--%>
<%--  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;--%>
<%--  border-collapse: collapse;--%>
<%--  width: 100%;--%>
<%--}--%>
<%--#list td, #list th {--%>
<%--  border: 1px solid #ddd;--%>
<%--  padding: 8px;--%>
<%--  text-align:center;--%>
<%--}--%>
<%--#list tr:nth-child(even){background-color: #f2f2f2;}--%>
<%--#list tr:hover {background-color: #ddd;}--%>
<%--#list th {--%>
<%--  padding-top: 12px;--%>
<%--  padding-bottom: 12px;--%>
<%--  text-align: center;--%>
<%--  background-color: #006bb3;--%>
<%--  color: white;--%>
<%--}--%>
<%--</style>--%>
<%--<script>--%>
<%--	function delete_ok(id){--%>
<%--		var a = confirm("정말로 삭제하겠습니까?");--%>
<%--		if(a) location.href='deletepost.jsp?id=' + id;--%>
<%--	}--%>
<%--</script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>애니목록</h1>--%>
<%--<%--%>
<%--	BoardDAO boardDAO = new BoardDAO();--%>
<%--	List<BoardVO> list = boardDAO.getBoardList();--%>
<%--	request.setAttribute("list",list);--%>
<%--%>--%>
<%--<table id="list" width="90%">--%>
<%--<tr>--%>
<%--	<th>No</th>--%>
<%--	<th>Name</th>--%>
<%--	<th>Author</th>--%>
<%--	<th>Genre</th>--%>
<%--	<th>Rating</th>--%>
<%--	<th>Episode</th>--%>
<%--	<th>Img</th>--%>
<%--	<th>Pg</th>--%>
<%--	<th>Director</th>--%>
<%--	<th>Date</th>--%>
<%--	<th>Edit</th>--%>
<%--	<th>Delete</th>--%>
<%--</tr>--%>
<%--<c:forEach items="${list}" var="u">--%>
<%--	<tr>--%>
<%--		<td>${u.getNo()}</td>--%>
<%--		<td>${u.getName()}</td>--%>
<%--		<td>${u.getAuthor()}</td>--%>
<%--		<td>${u.getGenre()}</td>--%>
<%--		<td>${u.getRating()}</td>--%>
<%--		<td>${u.getEpisode()}</td>--%>
<%--		<td>${u.getImg()}</td>--%>
<%--		<td>${u.getPg()}</td>--%>
<%--		<td>${u.getDirector()}</td>--%>
<%--		<td>${u.getDate()}</td>--%>
<%--		<td><a href="editform.jsp?id=${u.getNo()}">Edit</a></td>--%>
<%--		<td><a href="javascript:delete_ok('${u.getNo()}')">Delete</a></td>--%>
<%--	</tr>--%>
<%--</c:forEach>--%>
<%--</table>--%>
<%--<br/><a href="addpostform.jsp">Add New Post</a>--%>
<%--</body>--%>
<%--</html>--%>




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
			<img src="${u.getImg()}" alt="konosuba" width="10%" height="10%">
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
