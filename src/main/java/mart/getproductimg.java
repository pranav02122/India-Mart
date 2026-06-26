package mart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class getproductimg
 */
@WebServlet("/getproductimg")
public class getproductimg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getproductimg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
			String id= request.getParameter("id");
		try {
		
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/india_mart","root","jarvis");
			System.out.println(con);
			PreparedStatement pst = con.prepareStatement("select pimg from addproduct where pid =?");
			pst.setString(1, id);

			ResultSet rs =	pst.executeQuery();
			
			
			if(rs.next())
			{
				byte[] img = rs.getBytes("pimg");
				response.setContentType("image/png");
				OutputStream out = response.getOutputStream();
				out.write(img);
				out.flush();
				out.close();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}



	}

	


