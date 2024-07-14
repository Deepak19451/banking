

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Close")
public class Close extends HttpServlet {
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/bankmanagement";
	private static final String USERNAME ="root";
    private static final String PASSWORD = "BankingSystem@12";

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		Customer customer = (Customer) session.getAttribute("customer");
		if (customer.getBalance()==0) {
			customer.setStatus(0);
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection(JDBC_URL,USERNAME,PASSWORD);
				
				PreparedStatement s= con.prepareStatement("update customer set status = ? , username= ? where username = ?;");
				s.setInt(1, 0);
				s.setString(2, "closed-"+customer.getName()+System.currentTimeMillis());
				s.setString(3, customer.getName());
				s.executeUpdate();

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			session.removeAttribute("customer");
	        PrintWriter out = response.getWriter();
			 out.println("<html><head>");
             out.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11\"></script>");
             out.println("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css\">");
             out.println("<title>Success</title></head><body>");
             out.println("<script>");
             out.println("Swal.fire({");
             out.println("  title: 'Success',");
             out.println("  text: ' Account Succesfully Closed !',");
             out.println("  icon: 'success'");
             out.println("}).then(() => { window.location.href = 'login.jsp';});"); // Redirect to a success page or any other action
             out.println("</script>");
             out.println("</body></html>");
             out.close();
			
		}
		else {
			
	        PrintWriter out = response.getWriter();
	        out.println("<html><head>");
            out.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11\"></script>");
            out.println("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css\">");
            out.println("<title>Error</title></head><body>");
            out.println("<script>");
            out.println("Swal.fire({");
            out.println("  title: 'Error',");
            out.println("  text: 'Error: "+customer.getBalance()+"Rs Please withdraw Money to close account !',");
            out.println("  icon: 'error'");
            out.println("}).then(() => { history.back(); });"); // Using history.back() to go back to the previous page
            out.println("</script>");
            out.println("</body></html>");
            out.close();
		}
		
	}

}
