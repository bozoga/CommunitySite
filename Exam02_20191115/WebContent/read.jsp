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
	String idx =request.getParameter("idx");
	vo.setIdx(idx);
	BoardVO bvo = dao.getReadOne(vo);
	
	CommentVO cvo = new CommentVO();
	cvo.setBidx(idx);
	ArrayList<CommentVO> clist = dao.getCommentList(cvo);
%>
<body> 
	<header>
		<div>커뮤니티 사이트</div>
	</header>
		
	<section>
		<div class="art1">
			<table>
				<tr>
					<td colspan="2" class="td3"><h2 align="center">게시물 조회</h2></td>
				</tr>
				<tr>
					<td colspan="2" class="td4">제목 : <%=bvo.getSubject() %></td>
				</tr>
				<tr>
					<td class="td5">작성자 : <%=bvo.getWriter() %></td>
					<td class="td6">작성일 : <%=bvo.getRegdate() %></td>
				</tr>
				<tr>
					<td colspan="2" class="td7"><%=bvo.getContent() %></td>
				</tr>
			</table>
		</div>
		
		<div class="art1">
			댓글 조회<br>
			<% if(clist!=null){ %>
			<% for(CommentVO c : clist) {%>
			<%=c.getWriter() %> / <%=c.getContent() %> / <%=c.getRegdate() %> / 
			<input type="button" value="삭제" onclick="location.href='deleteCommentPro.jsp?idx=<%=c.getIdx() %>&bidx=<%=c.getBidx() %>'" /> <br>
			<%}} %>
		</div>
		
		<div class="art1">
		댓글 작성
		<form action="writeCommentPro.jsp?bidx=<%=idx %>" method="post">
			<input type="text" name="writer" placeholder="글쓴이">
			<input type="text" name="content"  placeholder="내용" class="commentbox">
			<input type="submit" value="작성완료">
		</form>
		</div>
		<div class="input1">
			<input type="button" value="목록" onclick="location.href='list.jsp'" />
			<input type="button" value="수정" onclick="location.href='update.jsp?idx=<%=idx %>'" />
			<input type="button" value="삭제" onclick="location.href='deletePro.jsp?idx=<%=idx %>'" />
		</div>
	</section>
	
	<footer>
		<div>Copyright (C) 2018 정보처리산업기사 All Right Reserved</div>
	</footer>
</body>
</html>