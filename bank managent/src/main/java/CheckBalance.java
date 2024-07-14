

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CheckBalance")
public class CheckBalance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		HttpSession session = request.getSession();
		double balance;
		Customer customer = (Customer)session.getAttribute("customer");
		balance=customer.getBalance();
		PrintWriter out = response.getWriter();
		out.println("<html><head>");
		out.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11\"></script>");
		out.println("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css\">");
		out.println("<title>Bank Account Balance</title></head><body>");
		out.println("<script>");
		out.println("Swal.fire({");
		out.println("  title: 'Bank Account Balance',");
		out.println("  text: 'Your current balance is: $" + balance + "',"); // Display the balance
		out.println("  icon: 'info'"); // Use 'info' icon for informational message
		out.println("}).then(() => { history.back(); });"); // Redirect to customer dashboard after viewing the balance
		out.println("</script>");
		out.println("</body></html>");
		out.close();

	}

}
