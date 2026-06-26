<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="dashboard-container">
    <div class="dashboard-header">
      <h1 class="dashboard-title">Registered Users</h1>
      
    </div>
    
    <div class="table-container">
      <table class="users-table">
        <thead>
          <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Mobile Number</th>
            <th>Password</th>
            <th>Gender</th>
            <th>Remove User</th>
            
          </tr>
        </thead>
        <tbody>
  
<% 

	try {
			
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/india_mart","root","jarvis");
				PreparedStatement pst = con.prepareStatement("select * from register");
			ResultSet rs =	pst.executeQuery();
			
			while(rs.next())
			{%>
			
			
			<tr>
              <td><%= rs.getString("firstname") %></td>
              <td><%= rs.getString("lastname") %></td>
              <td><%= rs.getString("email") %></td>
              <td><%= rs.getLong("mobileno") %></td>
              <td><%= rs.getString("password") %> </td>
              <td><%= rs.getString("gender") %></td>
              <td><div class="remvp"><a href="removeusers.jsp?id=<%=rs.getString("email")%>">  <button class="cancel">Remove User</button></a></div></td>
              
            
              
               
              
            </tr>
 			</tbody>
			<%		
	}
	}
catch(Exception e)
{
	e.printStackTrace();
}
				%>
				
				
</body>
</html>
			
		
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    body {
      background-color: #f5f7fa;
      color: #333;
      padding: 20px;
    }
    
    .dashboard-container {
      max-width: 1200px;
      margin: 0 auto;
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
      padding: 25px;
      height: calc(100vh - 40px);
      display: flex;
      flex-direction: column;
    }
    
    .dashboard-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 25px;
      padding-bottom: 15px;
      border-bottom: 1px solid #eaedf3;
    }
    
    .dashboard-title {
      color: #2d3748;
      font-size: 24px;
      font-weight: 600;
    }
    
    .search-box {
      display: flex;
      align-items: center;
      background: #f1f5f9;
      border-radius: 6px;
      padding: 8px 16px;
      width: 300px;
    }
    
    .search-box input {
      border: none;
      background: transparent;
      padding: 5px;
      font-size: 14px;
      width: 100%;
      outline: none;
    }
    
    .search-icon {
      color: #94a3b8;
      margin-right: 8px;
    }
    
    .table-container {
      overflow-y: auto;
      flex-grow: 1;
    }
    
    .users-table {
      width: 100%;
      border-collapse: collapse;
    }
    
    .users-table thead {
      position: sticky;
      top: 0;
      z-index: 1;
    }
    
    .users-table th {
      text-align: left;
      padding: 12px 15px;
      background-color: #f8fafc;
      color: #64748b;
      font-weight: 600;
      font-size: 14px;
      border-bottom: 2px solid #e2e8f0;
    }
    
    .users-table td {
      padding: 12px 15px;
      border-bottom: 1px solid #edf2f7;
      color: #1e293b;
      font-size: 14px;
    }
    
    .users-table tr:hover {
      background-color: #f1f5f9;
    }
    
    .action-btn {
      background: none;
      border: none;
      color: #6366f1;
      cursor: pointer;
      font-size: 14px;
      margin-right: 10px;
      text-decoration: underline;
    }
    
    .action-btn:hover {
      color: #4f46e5;
    }
    
    .password-field {
      font-family: monospace;
      letter-spacing: 1px;
    }
    
    @media (max-width: 768px) {
      .dashboard-header {
        flex-direction: column;
        align-items: flex-start;
      }
      
      .search-box {
        width: 100%;
        margin-top: 15px;
      }
      
      .table-container {
        overflow-x: auto;
      }
    }
    
        button.cancel {
    padding: 8px 10px;
    border-radius: 7px;
    border: none;
    background-color: #61565e;
    color: white;
    }
    button.cancel:hover {
	 background-color: red;
    color: white;
}
  </style>


  <script>
    // Search functionality
    document.addEventListener('DOMContentLoaded', function() {
      const searchInput = document.getElementById('searchInput');
      const tableRows = document.querySelectorAll('.users-table tbody tr');
      
      searchInput.addEventListener('keyup', function() {
        const searchTerm = this.value.toLowerCase();
        
        tableRows.forEach(row => {
          let found = false;
          const cells = row.querySelectorAll('td');
          
          cells.forEach(cell => {
            if (cell.textContent.toLowerCase().indexOf(searchTerm) > -1) {
              found = true;
            }
          });
          
          if (found) {
            row.style.display = '';
          } else {
            row.style.display = 'none';
          }
        });
      });
    });
    
    // Edit user function
    function editUser(userId) {
      // Redirect to edit page or open modal
      window.location.href = "edit-user.jsp?id=" + userId;
    }
    
    // Delete user function
    function deleteUser(userId) {
      if(confirm("Are you sure you want to delete this user?")) {
        window.location.href = "delete-user.jsp?id=" + userId;
      }
    }
  </script>

			
			

			
