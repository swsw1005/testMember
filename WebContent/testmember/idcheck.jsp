<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------idcheck.jsp");
%>


<%
	String id = request.getParameter("id");

	System.out.println("id=" + id);

	MemberDAO dao = MemberDAO.getInstance();

	if (dao.checkID(id)) {
		System.out.println("ID 사용가능");
%>
<div class="w3-alert w3-green">사용가능</div>
<%
	} else {
		System.out.println("ID 중복!!!!");
%>
<div class="w3-alert w3-red">사용불가</div>
<%
	}
%>