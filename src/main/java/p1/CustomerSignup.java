package p1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CustomerSignup
 */
@WebServlet("/CustomerSignup")
public class CustomerSignup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerSignup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("t1"));
		String name = request.getParameter("t2");
		String email = request.getParameter("t3");
		String password = request.getParameter("t4");
		int balance = Integer.parseInt(request.getParameter("t5"));
		PrintWriter pw = response.getWriter();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knightriderz","root","tiger");
			PreparedStatement ps = con.prepareStatement("insert into customer values(?,?,?,?,?)");
			ps.setInt(1,id);
			ps.setString(2,name);
			ps.setString(3,email);
			ps.setString(4, password);
			ps.setInt(5, balance);
			ps.execute();
			con.close();
			pw.println("Signup successful");
			
		}
		catch(Exception e) {
			pw.println(e);
		}
		
	}

}
