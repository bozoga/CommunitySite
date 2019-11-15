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
	request.setCharacterEncoding("utf-8");
	BoardDAO dao = BoardDAO.getInstance();

	BoardVO vo = new BoardVO();
	String idx =request.getParameter("idx");
	vo.setIdx(idx);
	BoardVO bvo = dao.getReadOne(vo);
	
%>
<body>
	<header>
		<div>커뮤니티 사이트</div>
	</header>

	<section>
		<div><h2 align="center">게시물 수정</h2></div>
		<form action="updatePro.jsp?idx=<%=bvo.getIdx()%>" method="post">
		<div>
		<table>
			<tr>
				<td class="td10">작성자</td>
				<td><input type="text" id="writer" name="writer" class="input2" value="<%=bvo.getWriter()%>"></td>
			</tr>
			<tr>
				<td class="td10">제목</td>
				<td><input type="text" id="subject" name="subject"  class="input2" value="<%=bvo.getSubject()%>"></td>
			</tr>
			<tr>
				<td class="td10">내용</td>
				<td height="300px"><textarea id="content" name="content" class="input2" style="height:340px;"><%=bvo.getContent()%></textarea></td>
			</tr>

		</table>
		</div><br>
		<div class="input1">
			<input type="button" value="목록" onclick="location.href='list.jsp'"/>
			<input type="submit" value="완료"/>
		</div>
		</form>
		
	</section>
	
	<footer>
		<div>Copyright (C) 2018 정보처리산업기사 All Right Reserved</div>
	</footer>
</body>
</html>