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
@WebServlet("/Modify")
public class Modify extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String UPDATE_QUERY = "UPDATE customer SET  address = ?, phoneNo = ?, email = ?,type = ?, balance = ?, dob = ? WHERE username = ?";
    public Modify() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        String mobileNo = request.getParameter("mobileNo");
        String address = request.getParameter("address");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String accountType = request.getParameter("accountType");
        double balance = Double.parseDouble(request.getParameter("balance"));
        String dob = request.getParameter("dob");

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankmanagement", "root", "BankingSystem@12");
             PreparedStatement ps = con.prepareStatement(UPDATE_QUERY)) {
            ps.setString(1, address);
            ps.setString(2, mobileNo);
            ps.setString(3, email);
            ps.setString(4, accountType);
            ps.setDouble(5, balance);
            ps.setString(6, dob);
            ps.setString(7, fullName);
            int count = ps.executeUpdate();
            if (count > 0) {
                pw.println("<html><head>");
                pw.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11\"></script>");
                pw.println("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css\">");
                pw.println("</head><body>");
                pw.println("<script>");
                pw.println("Swal.fire('Data Updated Successfully').then(() => {  history.back(); });");
                pw.println("</script>");
                pw.println("</body></html>");
            } else {
                pw.println("<html><head>");
                pw.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11\"></script>");
                pw.println("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css\">");
                pw.println("</head><body>");
                pw.println("<script>");
                pw.println("Swal.fire('Failed to update data. (Possible Reason: Credential Not Exist)').then(() => {  history.back();; });");
                pw.println("</script>");
                pw.println("</body></html>");
            }


        } catch (SQLException se) {
            pw.println(se.getMessage());
            se.printStackTrace();
        } catch (Exception e) {
            pw.println(e.getMessage());
            e.printStackTrace();
        }
    }
}
