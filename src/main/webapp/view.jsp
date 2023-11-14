<%--
  Created by IntelliJ IDEA.
  User: gnh09
  Date: 2023-11-14
  Time: 오후 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.example.jspanimecrud.BoardDAO, com.example.jspanimecrud.BoardVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>View</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="my.css">
</head>
<body>
<header class="bg-dark text-white p-3">
    <div class="container">
        <h1 class="text-center">애니 상세 정보</h1>
        <%
            int no = 0; // 기본값 설정
            String noParam = request.getParameter("no");
            if (noParam != null && !noParam.isEmpty()) {
                no = Integer.parseInt(noParam);
            } else {
                System.out.println("<p>애니메이션 정보를 불러올 수 없습니다. 올바른 매개변수를 제공하세요.</p>");
                return;
            }
            BoardDAO boardDAO = new BoardDAO();
            BoardVO u = boardDAO.getBoard(no);
        %>
    </div>
</header>

<section class="container my-4">
    <div class="row">
        <div class="col-md-4">
            <img src="https://i.namu.wiki/i/zqJHklbIe5IH__d7PqwLa7XQji33qfQyBJAilEXnlT3mEvp0BA18Ql3LP6mN8DqqCdFUY_64klpjX0x5LrUr-g.webp" alt="konosuba" class="img-fluid">
        </div>
        <div class="col-md-8">
            <h2>${u.getName()}</h2>
            <h2>${u.getAuthor()}</h2>
            <p>장르: ${u.getGenre()}</p>
            <p>평점: ${u.getRating()}</p>
        </div>
    </div>

    <div class="mt-4">
        <button class="btn btn-primary" onclick="redirectToEditPage()">[Edit]</button>
        <button class="btn btn-danger" onclick="confirmDelete()">[Delete]</button>
    </div>
</section>

<footer class="text-center p-3">
    <a href="index.html" class="btn btn-secondary">뒤로 가기</a>
</footer>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>

<script>
    function confirmDelete() {
        if (confirm("게시물을 삭제할까요?")) {
        }
    }

    function redirectToEditPage() {
        window.location.href = "edit.html";
    }
</script>
</body>
</html>
