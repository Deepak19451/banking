

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Transaction") 
public class Transaction extends HttpServlet {
	
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/bankmanagement";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "BankingSystem@12";
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		    
		    HttpSession session = request.getSession();
		    
		    Customer customer = (Customer)session.getAttribute("customer");
		  
		    if (customer != null) {
		    	
		    	  try {
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection connect = DriverManager.getConnection(JDBC_URL,USERNAME,PASSWORD);
						PreparedStatement s=connect.prepareStatement("select * from transaction where accountNo = ? ;");
						s.setString(1,customer.getAccountNo());
						ResultSet list = s.executeQuery();
						
				        PrintWriter out = response.getWriter();
						out.println("<!DOCTYPE html>");
			            out.println("<html>");
			            out.println("<head>");
			            out.println("<meta charset=\"UTF-8\">");
			            out.println("<title>Transaction History</title>");
			            out.println("<style>");
			            out.println("table { border-collapse: collapse; width: 100%; }");
			            out.println("th, td { border: 1px solid #dddddd; text-align: left; padding: 8px; }");
			            out.println("tr:nth-child(even) { background-color: #f2f2f2; }");
			            out.println("</style>");
			            out.println("</head>");
			            out.println("<body>");
			            out.println("<h2>Transaction History</h2>");
			            out.println("<table>");
			            out.println("<tr><th>Transaction ID</th><th>Transaction Type</th><th>Amount</th><th>Current Balance</th><th>Transaction Date</th></tr>");

			            
						
							
							
							 while (list.next()) {
					                out.println("<tr>");
					                out.println("<td>" + list.getString("id") + "</td>");
					                out.println("<td>" + list.getString("transaction_type") + "</td>");
					                out.println("<td>" + list.getDouble("amount") + "</td>");
					                out.println("<td>" + list.getDouble("balance") + "</td>");
					                out.println("<td>" + list.getString("transaction_date") + "</td>");
					                out.println("</tr>");
					            }
							
							
							 out.println("</table>");
					            out.println("</body>");
					            out.println("</html>");
							
							connect.close()	;
							list.close()	;
							s.close();
							out.close();
							
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		    	
		    	
		    }
		
	}


}
