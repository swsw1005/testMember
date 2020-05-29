<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="member.*"%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------inputPro.jsp");
%>

<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");

	System.out.println(id + " " + name + " " + pwd);
	out.println(id + " " + name + " " + pwd);

	MemberDAO dao = MemberDAO.getInstance();
	MemberDTO dto = new MemberDTO();

	dto.setId(id);
	dto.setName(name);
	dto.setPwd(pwd);

	//	dao.input(dto);
	//	response.sendRedirect("home.jsp");

	int result = dao.input(dto);

	if (result == 1) {
		response.sendRedirect("index.jsp");
	} else {
%>
<script>
	alert("회원가입 실패!!!");
	history.back();
</script>
<%
	}
%>