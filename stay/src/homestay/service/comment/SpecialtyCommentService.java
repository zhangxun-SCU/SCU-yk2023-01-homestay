package homestay.service.comment;

import homestay.dao.comment.SpecialtyCommentDao;
import homestay.dao.Data;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.SQLException;

public class SpecialtyCommentService {
    public void updateComment(Data data, JSONObject json) throws JSONException, SQLException {
        SpecialtyCommentDao dao = new SpecialtyCommentDao();
        dao.updateComment(data, json);
    }

    public void getComment(Data data, JSONObject json) throws JSONException, SQLException {
        SpecialtyCommentDao dao = new SpecialtyCommentDao();
        String specialty_id = data.getParam().getString("specialty_id");
        if (data.getParam().has("user_id")) {
            String user_id = data.getParam().getString("user_id");
            dao.getCommentById(specialty_id, user_id, json);
        } else {
            dao.getComments(specialty_id, json);
        }
    }
}
