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
            BoardDAO boardDAO = new BoardDAO();
            String noParam = request.getParameter("no");
            BoardVO selectedItem = null;
            if (noParam != null && !noParam.isEmpty()) {
                int no = Integer.parseInt(noParam);
                selectedItem = boardDAO.getBoard(no); // 데이터베이스에서 no에 해당하는 항목을 가져옴
            } else {
                return;
            }

            if (selectedItem == null) {
                return;
            }
            String img = selectedItem.getImg();
            String name = selectedItem.getName();
            String author = selectedItem.getAuthor();
            String genre = selectedItem.getGenre();
            String director = selectedItem.getDirector();
            Date date = selectedItem.getDate();
            int episode = selectedItem.getEpisode();
            int pg = selectedItem.getPg();
            int rating = selectedItem.getRating();
            int no = Integer.parseInt(noParam);

            request.setAttribute("vo", selectedItem);

        %>
    </div>
</header>

<section class="container my-4">
    <div class="row">
        <div class="col-md-4">
            <img src="${pageContext.request.contextPath}/upload/<%=img%>" alt="konosuba" class="img-fluid">
        </div>
        <div class="col-md-8">
            <h2><%=name%></h2>
            <h2><%=author%></h2>
            <p>장르: <%=genre%></p>
            <p>감독: <%=director%></p>
            <p>평점: <%
                for (int i = 0; i < rating; i++) {
            %>
                <i class="star-icon">★</i>
                <%
                    }
                %>(<%=rating%>)</p>
            <p>회차: <%=episode%></p>
            <p>시청 등급: <%=pg%></p>
            <p>최신 업데이트: <%=date%></p>
        </div>
    </div>

    <div class="mt-4">
        <button class="btn btn-primary" onclick="redirectToEditPage()">[Edit]</button>
        <a href="javascript:delete_ok('<%=no%>')"><button class="btn btn-danger">[Delete]</button></a>
    </div>
</section>

<footer class="text-center p-3">
    <a href="index.jsp" class="btn btn-secondary">뒤로 가기</a>
</footer>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>

<script>

    function delete_ok(no){
   		    var a = confirm("정말로 삭제하겠습니까?");
    		if(a) location.href='deletepost.jsp?no=' + no;
    }
    function redirectToEditPage() {
        window.location.href = "editform.jsp?no=<%=no%>";
    }
</script>
</body>
</html>
