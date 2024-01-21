package homestay.todo;

import homestay.dao.Data;
import homestay.service.todo.TodoService;
import homestay.utils.UserUtil;
import org.apache.poi.ss.formula.functions.T;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/todo")
public class TodoServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setHeader("Access-Control-Allow-Origin", "*");
        resp.setHeader("Access-Control-Allow-Methods", "*");
        resp.setHeader("Access-Control-Max-Age", "3600");
        resp.setHeader("Access-Control-Allow-Headers", "*");
        resp.setHeader("Access-Control-Allow-Credentials", "true");
        try {
            Data data = Data.getPageParameters(req, resp);
            data.getParam().put("userId", UserUtil.getUserId(req));
            String action = data.getParam().getString("action");
            JSONObject resJson = new JSONObject();  /* 响应数据 */
            if(action.equals("get_todo_record")) {
                doQueryTodoRecord(data, resJson);
            } else if(action.equals("modify_todo_record")) {
                doUpdateTodoRecord(data, resJson);
            } else if(action.equals("add_todo_record")) {
                doAddTodoRecord(data, resJson);
            } else if(action.equals("delete_todo_record")) {
                doDeleteTodoRecord(data, resJson);
            }
            resp.setContentType("application/json; charset=UTF-8");
            resp.getWriter().println(resJson);
        } catch (JSONException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doQueryTodoRecord(Data data, JSONObject resJson) throws SQLException, JSONException {
        TodoService service = new TodoService();
        service.queryTodoRecord(data, resJson);
    }

    protected void doUpdateTodoRecord(Data data, JSONObject resJson) throws JSONException {
        TodoService service = new TodoService();
        service.updateTodoRecord(data, resJson);
    }

    protected void doAddTodoRecord(Data data, JSONObject resJson) throws JSONException {
        TodoService service = new TodoService();
        service.addTodoRecord(data, resJson);
    }

    protected void doDeleteTodoRecord(Data data, JSONObject resJson) throws JSONException {
        TodoService service = new TodoService();
        service.deleteTodoRecord(data, resJson);
    }
}
