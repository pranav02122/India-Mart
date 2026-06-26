
<%@page import="java.io.PrintWriter"%>
<%
			HttpSession hs=request.getSession();
			hs.invalidate();
			
			PrintWriter  opt=response.getWriter();
			
			RequestDispatcher rd=request.getRequestDispatcher("Loginpage.jsp");
			rd.include(request, response);
			


 %>