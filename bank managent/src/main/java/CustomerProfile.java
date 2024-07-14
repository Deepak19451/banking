

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CustomerProfile")
public class CustomerProfile extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out =response.getWriter();
		HttpSession session =request.getSession();
		
		Customer customer=(Customer) session.getAttribute("customer");
		
		if ( customer != null ) {
			
			 String fullName = customer.getName();
             String address = customer.getAddress();
             String account = customer.getAccountNo();
             String mobileNo = customer.getPhoneNo();
             String accountType = customer.getType();
             double balance = customer.getBalance();
             String dobStr = customer.getDob();
             String idProff_type = customer.getId_proof_type();
             String idProff_no = customer.getId_proof_no();
             String email=customer.getEmail();
             // Encode customer details into URL
             String encodedFullName = URLEncoder.encode(fullName, "UTF-8");
             String encodedAccount = URLEncoder.encode(account, "UTF-8");
             String encodedAddress = URLEncoder.encode(address, "UTF-8");
             String encodedMobileNo = URLEncoder.encode(mobileNo, "UTF-8");
             String encodedEmail = URLEncoder.encode(email, "UTF-8");
             String encodedAccountType = URLEncoder.encode(accountType, "UTF-8");
             String encodedBalance = URLEncoder.encode(String.valueOf(balance), "UTF-8");
           

          // Ensure these are correctly set and matched
             String encodedIdProff_type= URLEncoder.encode(idProff_type, "UTF-8");
             String encodedIdProff_no = URLEncoder.encode(idProff_no, "UTF-8");
             String encodedDob = URLEncoder.encode(dobStr, "UTF-8");

             response.sendRedirect("customerDashboard.jsp?fullName=" + encodedFullName + "&account=" + encodedAccount + "&address=" + encodedAddress + "&mobileNo=" + encodedMobileNo + "&email=" + encodedEmail + "&accountType=" + encodedAccountType + "&balance=" + encodedBalance + "&id_proff_type=" + encodedIdProff_type +"&id_proff_no=" + encodedIdProff_no + "&dob=" + encodedDob);

			
		}
		else {
			
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
			
		}

	}
}