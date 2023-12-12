package homestay.servlet.superadmincontrol;


import homestay.bean.UserBean;
import homestay.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GetOneUser extends HttpServlet {
    private UserService userService=new UserService();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_id=request.getParameter("user_id");
        UserBean user=userService.getUserById(String.valueOf(user_id));
        request.setAttribute("user",user);
        request.getRequestDispatcher("/superadmin/updateUser.jsp").forward(request,response);
    }
}

