<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ inputForm.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>inputForm.jsp</title>
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CDN - jquery 3.4.1 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
* {
	margin: 0px;
	padding: 0px;
}
</style>
<script>
	var hasIDCheck = 0;

	function pwdcheck() {
		var p1 = document.getElementById("pwd").value;
		var p2 = document.getElementById("pwd2").value;
		var target = document.getElementById("pwdcheck");
		var btn = document.getElementById("joinBtn");

		console.log(p1 + " " + p2);

		if (p2 != null && p2 !== "") {
			if (!(p1 === p2)) {
				target.innerHTML = '<div class="w3-panel w3-yellow"> <h2>WARNING!!</h2> 비밀번호 불일치 </div>';
				btn.disabled = true;
			} else {
				target.innerHTML = '<div class="w3-panel w3-green"> 비밀번호 일치 </div>';
				btn.disabled = false;
			}
		}
	}

	function submitinput() {
		var p1 = document.getElementById("pwd").value;
		var p2 = document.getElementById("pwd2").value;

		if (p1 === p2 && p1 != null && p1 !== "") {
			document.inputform.submit();
		} else {
			alert("비밀번호를 확인하세요.");
			document.getElementById("pwd").value = "";
			document.getElementById("pwd2").value = "";
			document.getElementById("pwd").focus();
		}
	}

	function idcheck() {
		var id = $("#id").val();
		console.log(id + "--------");
		// JSON 데이터로 만들기
		var reply = {
			// 항목이름 : 값(변수)
			id : id,
		}
		var url = "idcheck.jsp";
		// ajax(비동기 통신)를 통해서 post방식의 입력한 데이터를 서버에 넘기기
		$.ajax({
			type : "post",
			url : url,
			data : reply,
			// 리턴 되어 돌려 받는 데이터의 타입
			dataType : "text",
			// 기본값이므로 삭제 가능
			success : function(result, status, xhr) {
				console.log("result " + result);
				// id  조회결과 보여준다
				$("#idcheck").load("idcheck.jsp?id=" + id);
				hasIDCheck += 1;
			},
			error : function(xhr, status, error) {
				alert(xhr + "/" + status + "/" + error);
			} // error의 끝
		}); // ajax의 끝
	}
</script>

</head>
<body>
	<!-- 내용 -->


	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>

	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<div class="sw-center">

		<!-- 가로복 제한 400~1200 ---------------------------------------------------------------------------------->
		<div class="sw-container-400">
			<div class="w3-container">
				<!-- 3 main content start here!!!----------------------------------------------------------- -->
				<!-- 2 main content start here!!!----------------------------------------------------------- -->
				<!-- 1 main content start here!!!----------------------------------------------------------- -->

				<h2 class="w3-center w3-red">회원가입</h2>
				<form action="inputPro.jsp" name="inputform" method="post">
					<table class="w3-table">
						<tr>
							<td>id</td>
							<td><input type="text" name="id" id="id"
								class="w3-input w3-border" required></td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="button" onclick="idcheck()">id체크</button>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div id="idcheck"></div>
							</td>
						</tr>
						<tr>
							<td>name</td>
							<td><input type="text" name="name" id="name"
								class="w3-input w3-border" required></td>
						</tr>
						<tr>
							<td>pwd</td>
							<td><input type="password" name="pwd" id="pwd"
								class="w3-input w3-border" required onkeyup="pwdcheck()"></td>
						</tr>
						<tr>
							<td>pwd체크</td>
							<td><input type="password" name="pwd2" id="pwd2"
								class="w3-input w3-border" required onkeyup="pwdcheck()">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div id="pwdcheck"></div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="submit" id="joinBtn" class="w3-button w3-green"
									style="width: 92px;" disabled>회원가입</button>
								<button type="button" class="w3-button w3-yellow"
									style="width: 92px;">리셋</button>
							</td>
						</tr>
					</table>


				</form>


				<!-- main content end----------------------------------------------------------------------- -->
			</div>
		</div>
	</div>





	<%-- 사이트 공통 부분 Include - topnav --%>
	<jsp:include page="../sw_css/topnav.html" />




</body>
</html>