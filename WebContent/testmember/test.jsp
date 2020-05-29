<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------test.jsp");
%>

<%
	MemberDAO dao = MemberDAO.getInstance();

	System.out.println(dao.test());
	out.println(dao.test());
%>