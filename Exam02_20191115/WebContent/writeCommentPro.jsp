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
	CommentVO vo = new CommentVO();
	String bidx = request.getParameter("bidx");
	vo.setBidx(bidx);
	vo.setWriter(request.getParameter("writer"));
	vo.setContent(request.getParameter("content"));
	dao.insertComment(vo);
%>
<script>
	location.href="read.jsp?idx=<%=bidx%>";
</script>
</body>
</html>