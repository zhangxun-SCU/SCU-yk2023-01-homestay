package homestay.servlet.superadmincontrol;


import homestay.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteUser extends HttpServlet {
    private UserService userService=new UserService();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_id=request.getParameter("user_id");
        String path=request.getContextPath();
        userService.deleteUserById(String.valueOf(user_id));
        response.sendRedirect(path+"/superadmin/getUsers");
    }
}

