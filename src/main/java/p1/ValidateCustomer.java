package p1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ValidateCustomer
 */
@WebServlet("/ValidateCustomer")
public class ValidateCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidateCustomer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw = response.getWriter();
		int id = Integer.parseInt(request.getParameter("t1"));
		String password = request.getParameter("t2");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
				
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knightriderz","root","tiger");
			
			Statement st = con.createStatement();
		
			ResultSet rs = st.executeQuery("select * from customer where id='"+id+"'AND password='"+password+"'");
			
			if(rs.next()) {
				request.setAttribute("customerId", id);
                // Forward the request to the JSP page
                request.getRequestDispatcher("DisplayItems.jsp").forward(request, response);
			}
			else {
				pw.println("Incorrect credentials");
			}
		}
		catch(Exception e) {
			pw.println(e);
		}
	}

}
