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

@WebServlet("/Pay")
public class Pay extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/bankmanagement";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "BankingSystem@12";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        PrintWriter out = response.getWriter();
        String acountNo = request.getParameter("acountNo");
        String password = request.getParameter("password");
        String money = request.getParameter("amount");

        if (customer != null) {
        	        	
        	if(customer.getPassword().equals(password)){
        		 try {
                     Class.forName("com.mysql.cj.jdbc.Driver");
                     Connection con = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
                     PreparedStatement query = con.prepareStatement("SELECT * FROM customer WHERE  accountNo = ?;");
                     query.setString(1, acountNo);
                     double amount = Double.parseDouble(money);
                     ResultSet rs = query.executeQuery();

                     boolean status = customer.withdraw(amount);
                     
                     if (rs.next() && status) {
                         PreparedStatement query1 = con.prepareStatement("UPDATE customer SET balance = ? WHERE username = ?;");
                         query1.setDouble(1, customer.getBalance());
                         query1.setString(2, customer.getName());
                         int row1 = query1.executeUpdate();

                         PreparedStatement query2 = con.prepareStatement("UPDATE customer SET balance = ? WHERE username = ?;");
                         query2.setDouble(1, rs.getDouble("balance") + amount);
                         query2.setString(2, rs.getString("username"));
                         int row2 = query2.executeUpdate();

                         PreparedStatement t1 = con.prepareStatement("INSERT INTO transaction (accountNo, transaction_type, amount, balance, transaction_date, id) VALUES (?, ?, ?, ?, ?, ?);");
                         t1.setString(1, customer.getAccountNo());
                         t1.setString(2, "Debit");
                         t1.setDouble(3, amount);
                         t1.setDouble(4, customer.getBalance());
                         t1.setString(5, getTime());
                         t1.setDouble(6, getId());
                         int num1 = t1.executeUpdate();

                         PreparedStatement t = con.prepareStatement("INSERT INTO transaction (accountNo, transaction_type, amount, balance, transaction_date, id) VALUES (?, ?, ?, ?, ?, ?);");
                         t.setString(1, acountNo);
                         t.setString(2, "Credit");
                         t.setDouble(3, amount);
                         t.setDouble(4, rs.getDouble("balance") + amount);  
                         t.setString(5, getTime());
                         t.setDouble(6, getId());
                         int num2 = t.executeUpdate();

                         if (row1 > 0 && row2 > 0 && num1 > 0 && num2 > 0) {
                             displayMessage(out, "Success", "Money has been successfully deposited!", "success");
                         } else {
                             displayMessage(out, "Error", "Error: Unable to complete the transaction!", "error");
                         }
                     } else {
                         displayMessage(out, "Error", "Error: Account number or mobile number does not exist or insufficient funds!", "error");
                     }
                     con.close();
                 } catch (ClassNotFoundException | SQLException | NumberFormatException e) {
                     e.printStackTrace();
                     displayMessage(out, "Error", "Error: " + e.getMessage(), "error");
                 }
        	}
        	else {
                displayMessage(out, "Error", "Error: " + " Password incorrect !", "error");

        	}
        } else {

            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }
    }

    private static String getTime() {
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        return now.format(formatter);
    }

    public double getId()  {

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

    private void displayMessage(PrintWriter out, String title, String message, String icon) {
        out.println("<html><head>");
        out.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11\"></script>");
        out.println("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css\">");
        out.println("<title>" + title + "</title></head><body>");
        out.println("<script>");
        out.println("Swal.fire({");
        out.println("  title: '" + title + "',");
        out.println("  text: '" + message + "',");
        out.println("  icon: '" + icon + "'");
        out.println("}).then(() => { history.back(); });");
        out.println("</script>");
        out.println("</body></html>");
        out.close();
    }
}
