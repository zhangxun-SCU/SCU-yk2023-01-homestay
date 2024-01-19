package homestay.servlet.superadmincontrol;

import homestay.bean.UserBean;
import homestay.service.user.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class GetAllUser extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        // 在初始化阶段初始化 userService
        userService = new UserService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<UserBean> list = userService.getAllUsers();
        if (list != null) {
            request.setAttribute("users", list);
            request.getRequestDispatcher("/superadmin/users.jsp").forward(request, response);
        } else {
            System.out.println("查询用户失败");
        }
    }
}
