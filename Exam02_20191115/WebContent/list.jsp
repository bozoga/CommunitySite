<%@page import="java.util.ArrayList"%>
<%@page import="sun.security.jca.GetInstance"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>커뮤니티 사이트</title>
</head>
<%
	BoardDAO dao = BoardDAO.getInstance();
	BoardVO vo = new BoardVO();
	ArrayList<BoardVO> list= dao.getBoardList(vo);
	String cnt=dao.count(vo);
	int numPerPage=8;
	int totalPost=Integer.parseInt(cnt);
	int totalpage=(totalPost/numPerPage)+1;
%>
<body>
	<header>
		<div>커뮤니티 사이트</div>
	</header>
		
	<section>
		<div>
		&nbsp;&nbsp;&nbsp;&nbsp;
		총 <%=cnt %>개의 게시물이 있습니다.
		</div><br>
		<table>
			<tr>
				<th class="th1">번호</th>
				<th class="th2">작성자</th>
				<th class="th3">제목</th>
				<th class="th4">작성일</th>
			</tr>
			<% for(BoardVO e : list) {%>
			<tr>
				<td class="td1"><%=e.getIdx() %></td>
				<td class="td1"><%=e.getWriter() %></td>
				<td class="td2">
				<a href="read.jsp?idx=<%=e.getIdx() %>"><%=e.getSubject() %></a></td>
				<td class="td1"><%=e.getRegdate() %></td>
				
			</tr>
			<%} %>
		</table>
		<br>
		<div class="input1"><input type="button" value="작성" onclick="location.href='write.jsp'" /></div>
	</section>
	
	<footer>
		<div>Copyright (C) 2018 정보처리산업기사 All Right Reserved</div>
	</footer>
</body>
</html>