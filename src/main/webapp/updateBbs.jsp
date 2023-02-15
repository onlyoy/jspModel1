<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
int seq = Integer.parseInt(request.getParameter("seq"));


MemberDto login = (MemberDto)session.getAttribute("login");
if(login == null){
	%>
	<script>
	alert("로그인 해 주십시오");
	location.href = "login.jsp"
	</script>
	<% 
}


%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
<%
	BbsDao dao = BbsDao.getInstance();
	BbsDto dto = dao.getBbs(seq);
%>

<h1>수정하기</h1>
<div align="center">

<form action="updateBbsAf.jsp" method="post">
<input type="hidden" name="seq" value="<%=dto.getSeq() %>">

<table border="1">
	<col width="100"><col width="500">
<tr>
	<th>작성자</th>
	<td><%=dto.getId() %></td>
</tr>
<tr>
	<th>제목</th>
	<td>
	<input type="text" name="title" size="50px" value="<%=dto.getTitle() %>">
	</td>
</tr>
<tr>
	<th>작성일</th>
	<td><%=dto.getWdate() %></td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea name="content" rows="15" cols="90"><%=dto.getContent() %></textarea>
	</td>
</tr>
</table>

<br>
<button type="submit">수정하기</button>
</form>



</div>

<script type="text/javascript">
/* $(document).ready(function() {
	$("#updatebtn").click(function() {
		alert(seq);
		location.href = "updateBbsAf.jsp?seq=" + seq;
	})
}) */
</script>

</body>
</html>