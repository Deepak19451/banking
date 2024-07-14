
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

@WebServlet("/CustomerLogin")
public class CustomerLogin extends HttpServlet {
    Connection con;
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/bankmanagement";
	private static final String USERNAME ="root";
    private static final String PASSWORD = "BankingSystem@12";

    public CustomerLogin()  {
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			this.con = DriverManager.getConnection(JDBC_URL,USERNAME,PASSWORD);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

	public Connection getCon(){
		return this.getCon();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name= request.getParameter("username");
		String word= request.getParameter("password");
		Customer customer= authenticate(name,word);
		if (customer != null) {
			HttpSession session =request.getSession();
			session.setAttribute("customer", customer);
			response.sendRedirect(request.getContextPath()+"/CustomerProfile");
		}
		else {
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
	}
	
	private Customer authenticate(String username,String password) {
		Customer customer=null;
		int s=0;
			try {
			PreparedStatement ps= this.con.prepareStatement("select * from customer where username = ? and password = ?");
			ps.setString(1,username);
			ps.setString(2,password);
			ResultSet rs=ps.executeQuery();
			
			if (rs.next()) {
				
				customer =new Customer(username,rs.getString("address"),rs.getString("phoneNo"),rs.getString("email"),rs.getString("type"),rs.getDouble("balance"),rs.getString("dob"),rs.getString("id_proof_type"),rs.getString("id_proof_no"),rs.getString("accountNo"),password,rs.getInt("status"));
				 s=rs.getInt("status");
			}  
			
	
			}finally {
				if (s==1) {
					return customer;	
				}
				else {
					return null;
				}
			}

	}

}
