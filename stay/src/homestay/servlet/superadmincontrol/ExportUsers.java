package homestay.servlet.superadmincontrol;

import homestay.dao.Data;
import homestay.service.user.UserService;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/exportUsers")
public class ExportUsers extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            JSONObject resJson = new JSONObject();
            Data data = Data.getPageParameters(req, resp);
            UserService userService = new UserService();
            userService.exportAllUsers(data, resJson);

            resp.setContentType("application/json; charset=UTF-8");
            resp.getWriter().println(resJson);
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }

    }
}
