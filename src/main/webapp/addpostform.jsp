<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.example.jspanimecrud.BoardDAO, com.example.jspanimecrud.BoardVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시물 추가</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="my.css">
</head>
<body>
<header>
    <h1 class="text-center mt-3">도서 추가</h1>
</header>

<section class="container mt-5">
    <form action="addpost.jsp" id="addForm" method="post">
        <div class="mb-3">
            <label class="form-label">애니메이션 이름:</label>
            <input type="text" name="name" class="form-control">
        </div>
        <div class="mb-3">
            <label class="form-label">작가:</label>
            <input type="text" name="author" class="form-control">
        </div>
        <div class="mb-3">
            <label class="form-label">장르:</label>
            <input type="text" name="genre" class="form-control">
        </div>
        <div class="mb-3">
            <label class="form-label">평점:</label>
            <input type="number" name="rating" class="form-control" min="0" max="10" step="0.1">
        </div>
        <div class="mb-3">
            <label class="form-label">회차:</label>
            <input type="number" name="episode" class="form-control" >
        </div>
        <div class="mb-3">
            <label class="form-label">시청 등급:</label>
            <input type="number" name="pg" class="form-control" >
        </div>
        <div class="mb-3">
            <label class="form-label">감독:</label>
            <input type="text" name="director" class="form-control">
        </div>
        <div class="mb-3">
            <label class="form-label">이미지(링크):</label>
            <input type="text" name="img" class="form-control">
        </div>
        <div class="bt">
            <button type="submit" class="btn btn-primary">추가</button>
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
