

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/adminLogin")
public class adminLogin extends HttpServlet {
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/bankmanagement";
	private static final String USERNAME ="root";
    private static final String PASSWORD = "BankingSystem@12";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String adminName = request.getParameter("username");
		String password = request.getParameter("password");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(JDBC_URL,USERNAME,PASSWORD);  
			
			PreparedStatement s = con.prepareStatement("select * from admin where username = ? and password = ? ;");
			s.setString(1, adminName);
			s.setString(2, password);
			ResultSet rs = s.executeQuery();
			
			if (rs.next()) {
				Admin admin = new Admin(adminName,password);
				HttpSession session = request.getSession();
				session.setAttribute("admin", admin);
		    	RequestDispatcher rd = request.getRequestDispatcher("adminDashboard.jsp");
	        	rd.forward(request, response);
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("adminLogin.jsp");
	        	rd.forward(request, response);
				
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		

}
}
