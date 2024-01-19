package homestay.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import homestay.bean.UserBean;
import homestay.service.user.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/searchUser")
public class SearchUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 从请求中获取user_id参数
        String searchUserId = request.getParameter("user_id");

        // 根据user_id执行数据库搜索或任何其他逻辑

        UserService userService = new UserService();
        List<UserBean> searchResults = userService.searchUsersByUserId(searchUserId);

        // 将搜索结果转换为JSON并将其作为响应发送
        response.setContentType("application/json");

        try (PrintWriter out = response.getWriter()) {
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.writeValue(out, searchResults);
        } catch (IOException e) {
            // 处理异常，这里可以记录日志或者其他操作
            e.printStackTrace();
        }
    }
}
