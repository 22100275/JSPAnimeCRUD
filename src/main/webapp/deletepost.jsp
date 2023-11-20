<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.jspanimecrud.BoardDAO, com.example.jspanimecrud.BoardVO"%>
<%@ page import="com.example.jspanimecrud.FileUpload"%>
<%
	String no = request.getParameter("no");
	if (no != ""){
		int id = Integer.parseInt(no);
		BoardVO u = new BoardVO();
		u.setNo(id);
		BoardDAO boardDAO = new BoardDAO();
		String filename = boardDAO.getPhotoFilename(id);
		if(filename != null) {
			FileUpload.deleteFile(request, filename);
		}
		boardDAO.deleteBoard(u);
	}
	response.sendRedirect("posts.jsp");
%>