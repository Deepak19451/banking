

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Delete")
public class Delete extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		String username = request.getParameter("username");
		String phoneNo = request.getParameter("phoneNo");
		
        try {
        	PrintWriter out = response.getWriter();
        	Class.forName("com.mysql.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankmanagement", "root", "BankingSystem@12");
	        PreparedStatement ps = con.prepareStatement(" update customer set status = ?,username=? where username= ? and phoneNo = ? ");
	        ps.setInt(1, 0);
	        ps.setString(2, "deleted-"+username+System.currentTimeMillis());
	        ps.setString(3,username);
	        ps.setString(4, phoneNo);
	        int rs = ps.executeUpdate();
	        if (rs>0) {
	            out.println("<html><head>");
	            out.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11\"></script>");
	            out.println("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css\">");
	            out.println("<title>" + "Success" + "</title></head><body>");
	            out.println("<script>");
	            out.println("Swal.fire({");
	            out.println("  title: '" + "Success" + "',");
	            out.println("  text: '" + "Account Deleted" + "',");
	            out.println("  icon: '" + "sccuess" + "'");
	            out.println("}).then(() => { history.back(); });");
	            out.println("</script>");
	            out.println("</body></html>");
	            out.close();
	        }
	        else {
	        	
	        	out.println("<html><head>");
	            out.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11\"></script>");
	            out.println("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css\">");
	            out.println("<title>" + "Error" + "</title></head><body>");
	            out.println("<script>");
	            out.println("Swal.fire({");
	            out.println("  title: '" + "Error" + "',");
	            out.println("  text: '" + " Account not Deleted" + "',");
	            out.println("  icon: '" + "error" + "'");
	            out.println("}).then(() => { history.back(); });");
	            out.println("</script>");
	            out.println("</body></html>");
	            out.close();
	        	
	        }
	       
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


				
	}

}
