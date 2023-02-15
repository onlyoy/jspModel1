<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
int seq = Integer.parseInt(request.getParameter("seq"));
System.out.println("2seq:" + seq);

BbsDao dao = BbsDao.getInstance();

boolean isS = dao.delete(seq);
if(isS == true){
	%>
		<script type="text/javascript">
		alert("삭제되었습니다");
		location.href = "bbslist.jsp";
		</script>
	<% 
} else{	
	%>
		<script type="text/javascript">
		alert("삭제에 실패했습니다");
		let seq = "<%=seq %>";
		location.href = "bbsdetail.jsp" + seq;
		</script>
	<%
}
%>
