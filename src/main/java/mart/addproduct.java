package mart;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class addproduct
 */
@WebServlet("/addproduct")
@MultipartConfig(maxFileSize = 10000000)
public class addproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addproduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		

		String proid = request.getParameter("id");
		String proname = request.getParameter("product-nm");
		String procat = request.getParameter("catagory");
		String price = request.getParameter("product-price");
		Long proprice = Long.parseLong(price);
		String mainprice = request.getParameter("final-price");
		Long orgprice = Long.parseLong(mainprice);
		String prodiscount = request.getParameter("product-discount");
		String proinfo = request.getParameter("product-info");
		Part filepart =request.getPart("product-img");
		
		
		if(filepart!=null)
		{
			InputStream istream = filepart.getInputStream();
			
			try {
			
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/india_mart","root","jarvis");
				System.out.println(con);
				PreparedStatement pst = con.prepareStatement("insert into addproduct values(?,?,?,?,?,?,?,?)");
				pst.setString(1, proid);
				pst.setString(2, proname);
				pst.setString(3, procat);
				pst.setLong(4, proprice);
				pst.setString(5, prodiscount);
				pst.setString(6, proinfo);
				pst.setBlob(7, istream);
				pst.setLong(8, orgprice);
				int i = pst.executeUpdate();
				if(i==1)
				{

					RequestDispatcher rd = request.getRequestDispatcher("showproduct.jsp");
					rd.forward(request, response);
				 response.sendRedirect("showproduct.jsp?msg=valid");
				}
				else
				{

					RequestDispatcher rd = request.getRequestDispatcher("addproductform.jsp");
					rd.forward(request, response);
				 response.sendRedirect("addproductform.jsp?msg=valid");
					
				}
				
				PrintWriter out = response.getWriter();
				out.print("Product Added Successfully");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
	}


	}


