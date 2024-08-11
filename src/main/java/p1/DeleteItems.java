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
 * Servlet implementation class DeleteItems
 */
@WebServlet("/DeleteItems")
public class DeleteItems extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteItems() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int sno = Integer.parseInt(request.getParameter("t1"));
		PrintWriter pw = response.getWriter();
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			pw.println("Driver class loaded");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knightriderz","root","tiger");
			pw.println("Connection Established");
			PreparedStatement ps = con.prepareStatement("delete from itemslist where sno=?");
			ps.setInt(1, sno);
			ps.execute();
			pw.println("Item Deleted");
			con.close();
			
		}
		catch(Exception e) {
			pw.println(e);
		}
	}

}
