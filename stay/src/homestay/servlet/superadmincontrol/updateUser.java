package homestay.servlet.superadmincontrol;


import homestay.bean.UserBean;
import homestay.service.user.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class updateUser extends HttpServlet {
    private UserService userService = new UserService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_id = request.getParameter("user_id");
        String user_password = request.getParameter("user_password");
        String email = request.getParameter("email");
        String permission = request.getParameter("permission");
        String priority = request.getParameter("priority");
        String path = request.getContextPath();
        System.out.println(permission);
        System.out.println(priority);
        UserBean user = new UserBean(String.valueOf(user_id), permission, user_password, email, priority);
        System.out.println("User: " + user.getPermission());
        userService.updateUserById(user);
        response.sendRedirect("/superadmin/getUsers");
    }
}

