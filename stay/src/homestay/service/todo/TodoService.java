package homestay.service.todo;

import homestay.dao.Data;
import homestay.dao.todo.TodoDao;
import homestay.entity.TodoRecord;
import org.apache.poi.ss.formula.functions.T;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;

public class TodoService {
    public void queryTodoRecord(Data data, JSONObject resJson) throws SQLException, JSONException {
        TodoDao dao =new TodoDao();
        List<HashMap<String, Object>> res = dao.getAllRecord(data.getParam().getString("userId"));
        resJson.put("data", res);
    }

    public void addTodoRecord(Data data, JSONObject resJson) throws JSONException {
        TodoDao dao =new TodoDao();
        TodoRecord todoRecord = new TodoRecord();
        todoRecord.userId = data.getParam().getString("userId");
        todoRecord.content = data.getParam().getString("content");
        todoRecord.deadline = Timestamp.valueOf(data.getParam().getString("deadline"));
        todoRecord.status = "0";
        todoRecord.createTime = Timestamp.valueOf(LocalDateTime.now());
        dao.addTodoRecord(todoRecord);
    }

    public void deleteTodoRecord(Data data, JSONObject resJson) throws JSONException {
        TodoDao todoDao = new TodoDao();
        todoDao.deleteTodoRecord(data.getParam().getString("userId"), data.getParam().getString("todoId"));
    }

    public void updateTodoRecord(Data data, JSONObject resJson) throws JSONException {
        TodoDao todoDao = new TodoDao();
        todoDao.updateTodoRecord(data.getParam().getString("todoId"), data.getParam().getString("content"));
    }
}
