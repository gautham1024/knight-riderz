package p1;

import java.io.FileInputStream;
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
 * Servlet implementation class AddItems
 */
@WebServlet("/AddItems")
public class AddItems extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddItems() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int sno = Integer.parseInt(request.getParameter("t1"));
		String name = request.getParameter("t2");
		String brand = request.getParameter("t3");
		int cost = Integer.parseInt(request.getParameter("t4"));
		String imgurl = request.getParameter("t5");
		PrintWriter pw = response.getWriter();
		FileInputStream fin = new FileInputStream(imgurl);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knightriderz","root","tiger");
			PreparedStatement ps = con.prepareStatement("insert into itemslist values(?,?,?,?,?)");
			ps.setInt(1,sno);
			ps.setString(2,name);
			ps.setString(3,brand);
			ps.setInt(4, cost);
			ps.setBinaryStream(5, fin);
			ps.execute();
			con.close();
			pw.println("Successfully Added");
			
		}
		catch(Exception e) {
			pw.println(e);
		}
	}

}
