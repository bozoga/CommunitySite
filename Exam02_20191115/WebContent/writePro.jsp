<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	BoardDAO dao = BoardDAO.getInstance();
	BoardVO vo = new BoardVO();
	vo.setWriter(request.getParameter("writer"));
	vo.setSubject(request.getParameter("subject"));
	vo.setContent(request.getParameter("content"));
	dao.insert(vo);
	response.sendRedirect("list.jsp");
%>
</body>
</html>