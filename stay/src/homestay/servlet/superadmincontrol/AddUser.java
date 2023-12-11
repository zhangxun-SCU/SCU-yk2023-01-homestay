package homestay.servlet.superadmincontrol;


import homestay.bean.UserBean;
import homestay.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddUser extends HttpServlet {
    private UserService userService=new UserService();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_id=request.getParameter("user_id");
        String user_password=request.getParameter("user_password");
        String email=request.getParameter("email");
        String permission=request.getParameter("permission");
        String priority=request.getParameter("priority");
        String path=request.getContextPath();
        UserBean user=new UserBean();
        user.setUser_id(user_id);
        user.setUser_password(user_password);
        user.setEmail(email);
        user.setPermission(permission);
        user.setPriority(priority);
        userService.addNewUser(user);
        response.sendRedirect(path+"/superadmin/getUsers");
    }
}

