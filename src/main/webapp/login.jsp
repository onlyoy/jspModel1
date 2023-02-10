<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>

<style type="text/css">
.main {
    width: 250px;
    height: 300px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    border: 1px solid lightgrey;
    border-radius: 5px;
}

.logo {
    margin-top: 0px;
    margin-bottom: 40px;
}

#login {
    width: 100%;
    background-color: skyblue;
    border-color: transparent;
    color: white;
}

.account {
    display: block;
    margin-bottom: 3px;
    padding: 3px;
    border: 1px solid lightgray;
    border-radius: 3px;
}

.font{
	font-size: 10pt;
	float: left;
	position: relative;
	top: -1.5px;
}
.regi{
	font-size: 10pt;
	float: right;
	display: inline-block;
}
</style>

</head>
<body>

<div class="main">
<h1 class="logo">Login</h1>

<div class="container">

<form action="loginAf.jsp" method="post">

<table>
<tr>
	<td>
		<input type="text" id="id" name="id" placeholder="ID" size="20"><br>
	</td>
</tr>
<tr>
	<td>
		<input type="password" name="pwd" placeholder="Password" size="20"><br>
	</td>
</tr>
<tr>
	<td>
		<input id="login" class="account" type="submit" value="log-in">
	</td>
</tr>
<tr>
	<td>
		<div class="font">
		<input  type="checkbox" id="chk_save_id">ID 저장
		</div>
		<div class="regi">
		<a href="regi.jsp">회원가입</a>
		</div>
	</td>
</tr>
</table>


</form>

</div>
</div>

<script type="text/javascript">
/* 
	cookie	: id저장, pw저장	== String → Client
	session	: login한 정보	== Object → Server

*/
// id 저장
let user_id = $.cookie("user_id");

if(user_id != null){	// 저장한 id가 있음
	$("#id").val(user_id);
	$("#chk_save_id").prop("checked", true);
}

$("#chk_save_id").click(function() {
	
	if( $("#chk_save_id").is(":checked") == true ){

		if( $("#id").val().trim() == ""){
			alert("id를 입력해 주십시오");
			$("#chk_save_id").prop("checked", false);
		} else{
			// cookie를 저장
			$.cookie("user_id", $("#id").val().trim(), { expires:7, path: './' });
		}
		
	} else{
		$.removeCookie("user_id", { path: './' });
	}
});


</script>

</body>
</html>