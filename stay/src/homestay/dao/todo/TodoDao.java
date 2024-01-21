package homestay.dao.todo;

import homestay.dao.DB;
import homestay.entity.TodoRecord;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class TodoDao {
    public List<HashMap<String, Object>> getAllRecord(String userId) throws SQLException {
        String sql = "SELECT * FROM todo WHERE user_id='" + userId + "';";
        DB db = new DB("group1");
        ResultSet rs = db.executeQuery(sql);
        List<HashMap<String, Object>> res = new ArrayList<>();
        while (rs.next()) {
            HashMap<String, Object> todo = new HashMap<>();
            todo.put("userId", rs.getString("user_id"));
            todo.put("content", rs.getString("content"));
            todo.put("deadline", rs.getTimestamp("deadline"));
            todo.put("todoId", rs.getString("todo_id"));
            todo.put("status", rs.getString("status"));
            todo.put("createTime", rs.getString("create_time"));
            res.add(todo);
        }
        db.close();
        return res;
    }

    public void addTodoRecord(TodoRecord todoRecord) {
        String sql = "INSERT INTO todo(user_id, content, deadline, status, create_time) ";
        sql += "VALUES('" + todoRecord.userId + "','" + todoRecord.content + "','" + todoRecord.deadline + "','" + todoRecord.status + "','" + todoRecord.createTime + "');";
        DB db = new DB("group1");
        System.out.println(sql);
        db.executeUpdate(sql);
        db.close();
    }

    public void deleteTodoRecord(String userId, String todoId) {
        String sql = "DELETE FROM todo WHERE user_id='" + userId + "' AND todo_id='" + todoId + "';";
        System.out.println(sql);
        DB db = new DB("group1");
        System.out.println(sql);
        db.executeUpdate(sql);
        db.close();
    }

    public void updateTodoRecord(String todoId, String content) {
        String sql = "UPDATE todo SET content='" + content + "' WHERE todo_id='" + todoId + "';";
        DB db = new DB("group1");
        System.out.println(sql);
        db.executeUpdate(sql);
        db.close();
    }
}
