

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

@WebServlet("/Register")
public class Register extends HttpServlet {
	
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/bankmanagement";
	private static final String USERNAME ="root";
    private static final String PASSWORD = "BankingSystem@12";

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String username = request.getParameter("full_name");	
		String address = request.getParameter("address");		
		String phoneNo = request.getParameter("mobile_no");		
		String email = request.getParameter("email");		
		String type = request.getParameter("account_type");		
		String money = request.getParameter("balance");
		String dob = request.getParameter("dob");
		String id_proof_type = request.getParameter("id_proof_type");
		String id_proof_no = request.getParameter("id_proof_number");
		String accountNo=generateAccountNumber();
		String password=request.getParameter("dob");
		double balance=Double.parseDouble(money);
		int status=1;
		
		String s= "INSERT INTO customer (username,address,phoneNo,email,type,balance,password,id_proof_type,id_proof_no,accountNo,dob,status) VALUES (?,?,?,?,?,?,?,?,?,?,?,?);";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(JDBC_URL,USERNAME,PASSWORD);  
			PreparedStatement st = con.prepareStatement(s);
			st.setString(1, username);
			st.setString(2, address);
			st.setString(3, phoneNo);
			st.setString(4, email);
			st.setString(5, type);
			st.setDouble(6, balance);
			st.setString(7, password);
			st.setString(8, id_proof_type);
			st.setString(9, id_proof_no);
			st.setString(10, accountNo);
			st.setString(11, dob);
			st.setInt(12,status);
			
			int r = st.executeUpdate();
			
			if (r>0) {
				
			    out.println("<html><head>");
                out.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11\"></script>");
                out.println("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css\">");
                out.println("<title>Success</title></head><body>");
                out.println("<script>");
                out.println("Swal.fire({");
                out.println("  title: 'Success',");
                out.println("  text: 'User Registered !',");
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
                out.println("  text: 'Error: Registration failed!',");
                out.println("  icon: 'error'");
                out.println("}).then(() => { history.back(); });"); // Using history.back() to go back to the previous page
                out.println("</script>");
                out.println("</body></html>");
                out.close();
			}


			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			
            out.println("<html><head>");
            out.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11\"></script>");
            out.println("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css\">");
            out.println("<title>Error</title></head><body>");
            out.println("<script>");
            out.println("Swal.fire({");
            out.println("  title: 'Error',");
            out.println("  text: 'Error: user already Register with that username ',");
            out.println("  icon: 'error'");
            out.println("}).then(() => { history.back(); });"); // Using history.back() to go back to the previous page
            out.println("</script>");
            out.println("</body></html>");
            out.close();
		}
	}
	
	private String generateAccountNumber() {
        return "ACC" + System.currentTimeMillis() + (int) (Math.random() * 1000);
    }

}
