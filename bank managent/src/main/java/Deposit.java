

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Deposit")
public class Deposit extends HttpServlet {
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/bankmanagement";
	private static final String USERNAME ="root";
    private static final String PASSWORD = "BankingSystem@12";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		HttpSession session = request.getSession();
		
		Customer customer = (Customer)session.getAttribute("customer");
		
        PrintWriter out = response.getWriter();
        
        String password = request.getParameter("password");
        
        String money = request.getParameter("amount");

        
        if (customer != null) {
        	
        	if (customer.getPassword().equals(password)) {
        	try {
        		
        		Class.forName("com.mysql.cj.jdbc.Driver");
	 			Connection con = DriverManager.getConnection(JDBC_URL,USERNAME,PASSWORD);  
				PreparedStatement query = con.prepareStatement(" select * from customer where phoneNo = ?  and accountNo = ? ;");
				query.setString(1,customer.getPhoneNo());
				query.setString(2,customer.getAccountNo());
		        double amount = Double.parseDouble(money);
				ResultSet rs= query.executeQuery();
				if (rs.next()) {
					
					customer.deposit(amount);
					PreparedStatement query1 = con.prepareStatement(" UPDATE customer SET balance = ? WHERE username = ?;");
					query1.setDouble(1,customer.getBalance());
					query1.setString(2,customer.getName());
					int rows = query1.executeUpdate();
					
		            
		            PreparedStatement t = con.prepareStatement("INSERT INTO transaction (accountNo, transaction_type, amount, balance, transaction_date, id) VALUES (?, ?, ?, ?, ?, ?);");
					t.setString(1, customer.getAccountNo());
		            t.setString(2, "Credit");
		            t.setDouble(3, amount);
		            t.setDouble(4, customer.getBalance());
		            t.setString(5, getTime());
		            t.setDouble(6, getId());
		            int num = t.executeUpdate();
					
					if (rows > 0 && num>0) {
						
					    out.println("<html><head>");
		                out.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11\"></script>");
		                out.println("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css\">");
		                out.println("<title>Success</title></head><body>");
		                out.println("<script>");
		                out.println("Swal.fire({");
		                out.println("  title: 'Success',");
		                out.println("  text: 'Money has been successfully deposited!',");
		                out.println("  icon: 'success'");
		                out.println("}).then(() => { history.back(); });"); // Redirect to a success page or any other action
		                out.println("</script>");
		                out.println("</body></html>");
		                out.close();
					}
					else {
		                out.println("<html><head>");
		                out.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11\"></script>");
		                out.println("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css\">");
		                out.println("<title>Error</title></head><body>");
		                out.println("<script>");
		                out.println("Swal.fire({");
		                out.println("  title: 'Error',");
		                out.println("  text: 'Error: Account number or mobile number does not exist!',");
		                out.println("  icon: 'error'");
		                out.println("}).then(() => { history.back(); });"); // Using history.back() to go back to the previous page
		                out.println("</script>");
		                out.println("</body></html>");
		                out.close();					}
					
			         }
				else {
	                out.println("<html><head>");
	                out.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11\"></script>");
	                out.println("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css\">");
	                out.println("<title>Error</title></head><body>");
	                out.println("<script>");
	                out.println("Swal.fire({");
	                out.println("  title: 'Error',");
	                out.println("  text: 'Error: Account number or mobile number does not exist!',");
	                out.println("  icon: 'error'");
	                out.println("}).then(() => { history.back(); });"); // Using history.back() to go back to the previous page
	                out.println("</script>");
	                out.println("</body></html>");
	                out.close();
				}
				
				con.close();
        		
        	
				
				
			} catch (ClassNotFoundException e) {
				out.println("<html><head>");
                out.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11\"></script>");
                out.println("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css\">");
                out.println("<title>Error</title></head><body>");
                out.println("<script>");
                out.println("Swal.fire({");
                out.println("  title: 'Error',");
                out.println("  text: 'Error:  ClassNotFound !',");
                out.println("  icon: 'error'");
                out.println("}).then(() => { history.back(); });"); // Using history.back() to go back to the previous page
                out.println("</script>");
                out.println("</body></html>");
                out.close();			} catch (SQLException e) {
				out.println("<html><head>");
                out.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11\"></script>");
                out.println("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css\">");
                out.println("<title>Error</title></head><body>");
                out.println("<script>");
                out.println("Swal.fire({");
                out.println("  title: 'Error',");
                out.println("  text: 'Error:  SQL Exception !',");
                out.println("  icon: 'error'");
                out.println("}).then(() => { history.back(); });"); // Using history.back() to go back to the previous page
                out.println("</script>");
                out.println("</body></html>");
                out.close();			}
        	catch(NumberFormatException e) {
				out.println("<html><head>");
                out.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11\"></script>");
                out.println("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css\">");
                out.println("<title>Error</title></head><body>");
                out.println("<script>");
                out.println("Swal.fire({");
                out.println("  title: 'Error',");
                out.println("  text: 'Error:  Number Format Error !',");
                out.println("  icon: 'error'");
                out.println("}).then(() => { history.back(); });"); // Using history.back() to go back to the previous page
                out.println("</script>");
                out.println("</body></html>");
                out.close();
				
			}
        	}
else {
        		
        		out.println("<html><head>");
                out.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11\"></script>");
                out.println("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css\">");
                out.println("<title>Error</title></head><body>");
                out.println("<script>");
                out.println("Swal.fire({");
                out.println("  title: 'Error',");
                out.println("  text: ' Password Incorrect Error !',");
                out.println("  icon: 'error'");
                out.println("}).then(() => { history.back(); });"); // Using history.back() to go back to the previous page
                out.println("</script>");
                out.println("</body></html>");
                out.close();
        		
        		
        	}
        }
        else {
        	RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        	rd.forward(request, response);
        			
        }
	
	}
	
		public static String getTime() {
		
		LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = now.format(formatter);
		
		return formattedDateTime;
			}
	
	
	public double getId()  {
        String lastId = null;
        double id = -1;
      

        try  {
        	Class.forName("com.mysql.cj.jdbc.Driver");
 			Connection connection = DriverManager.getConnection(JDBC_URL,USERNAME,PASSWORD);  
 			PreparedStatement r = connection.prepareStatement("SELECT MAX(id) AS max_id FROM transaction;");
 			ResultSet resultSet = r.executeQuery();

 			if (resultSet.next()) {
 			     id = resultSet.getDouble("max_id");
 			    return id+1;
 			}
 			
         }
          catch(SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return id+1;
        
    }

}
