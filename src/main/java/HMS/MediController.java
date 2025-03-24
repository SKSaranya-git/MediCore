package HMS;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DoctorLogin")  // Ensure this is mapped correctly
public class MediController extends HttpServlet {

    private MediCoreDAO dao = new MediCoreDAO();

    // Handles POST requests for login validation
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String username = req.getParameter("uname");  // Ensure these match input field names in your login form
        String password = req.getParameter("upass");

        // Validate credentials
        if (dao.doctorCheck(username, password)) {
            // Login Success - Create session for the doctor
            System.out.println("Login Success...");
            HttpSession session = req.getSession();
            session.setAttribute("doctor", username);  // Store doctor's username in session
            res.sendRedirect("dashboard.jsp");  // Redirect to doctor dashboard
        } else {
            // Invalid credentials - Display error message
            System.out.println("Wrong Credentials...");
            req.setAttribute("errorMessage", "Invalid username or password");
            req.getRequestDispatcher("login.jsp").forward(req, res);  // Forward to login page with error message
        }
    }
}
