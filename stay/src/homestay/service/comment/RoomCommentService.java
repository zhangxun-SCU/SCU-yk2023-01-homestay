package homestay.service.comment;

import homestay.dao.Data;
import homestay.dao.comment.RoomCommentDao;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.SQLException;

public class RoomCommentService {
    public void updateComment(Data data, JSONObject json) throws JSONException, SQLException {
        RoomCommentDao dao = new RoomCommentDao();
        dao.updateComment(data, json);
    }

    public void getComment(Data data, JSONObject json) throws JSONException, SQLException {
        RoomCommentDao dao = new RoomCommentDao();
        String house_id = data.getParam().getString("house_id");
        String room_id = data.getParam().getString("room_id");
        if (data.getParam().has("user_id")) {
            String user_id = data.getParam().getString("user_id");
            dao.getCommentById(house_id, room_id, user_id, json);
        } else {
            dao.getComments(house_id, room_id, json);
        }
    }
}
