package homestay.dao;

import org.json.JSONException;
import org.json.JSONObject;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;

public class CommentDao {
    DB db = null;

    private void showDebug(String function, String message) {
        String log = "[CommentDao]" + function + message;
        System.out.println(log);
    }

    public void updateComment(Data data, JSONObject json) throws JSONException {
        String resCode = "00000";
        String info = "success";
        showDebug("updateComment", "update previous comment");
        db = new DB("group1");
        try {
            String type = data.getParam().getString("type");
            String order_id = data.getParam().getString("order_id");
            int rating = data.getParam().getInt("score");
            String description = data.getParam().getString("description");
            String table = type.equals("specialty") ? "s_order_comment" : "r_order_comment";
            String sql = String.format(
                    "Update %s Set score=%d, comment='%s' Where order_id='%s'",
                    table,
                    rating,
                    description,
                    order_id
            );
            db.executeUpdate(sql);
            db.close();
            json.put("resCode", resCode);
            json.put("updateCommentInfo", info);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void getCommentById(String order_id, String type, JSONObject json) throws JSONException, SQLException {
        String resCode = "00000";
        String info = "success";
        db = new DB("group1");
        try {
            String table = type.equals("specialty") ? "s_order_comment" : "r_order_comment";
            String sql = String.format(
                    "Select score, comment From %s Where order_id='%s'",
                    table,
                    order_id
            );
            ResultSet res = db.executeQuery(sql);
            HashMap<String, Object> map = new HashMap();
            while (res.next()) {
                map.put("score", res.getString("score"));
                map.put("comment", res.getString("comment"));
            }
            db.close();
            json.put("resCode", resCode);
            json.put("getCommentInfo", info);
            json.put("comment_info", map);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
