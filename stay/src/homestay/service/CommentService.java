package homestay.service;

import homestay.dao.CommentDao;
import homestay.dao.Data;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.SQLException;

public class CommentService {
    public void updateComment(Data data, JSONObject json) throws JSONException, SQLException {
        CommentDao dao = new CommentDao();
        dao.updateComment(data, json);
    }

    public void getComment(Data data, JSONObject json) throws JSONException, SQLException {
        CommentDao dao = new CommentDao();
        String order_id = data.getParam().getString("order_id");
        dao.getCommentById(order_id, json);
    }
}
