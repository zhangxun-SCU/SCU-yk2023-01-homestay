package homestay.dao.comment;

import homestay.dao.DB;
import homestay.dao.Data;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

public class RoomCommentDao {
    DB db = null;

    private void showDebug(String function, String message) {
        String log = "[RoomCommentDao]" + function + message;
        System.out.println(log);
    }

    public void updateComment(Data data, JSONObject json) throws JSONException {
        String resCode = "00000";
        String info = "success";
        showDebug("updateComment", "update previous comment");
        db = new DB("group1");
        try {
            String house_id = data.getParam().getString("house_id");
            String room_id = data.getParam().getString("room_id");
            String user_id = data.getParam().getString("user_id");
            int rating = data.getParam().getInt("score");
            String description = data.getParam().getString("description");
            String create_time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
            String sql;
            // 有则更新，无则插入
            if (hasComment(house_id, room_id, user_id)) {
                sql = String.format(
                        "Update r_order_comment Set score=%d, comment='%s', create_time='%s' Where house_id='%s' And room_id='%s' And user_id='%s'",
                        rating,
                        description,
                        create_time,
                        house_id,
                        room_id,
                        user_id
                );
            } else {
                sql = String.format(
                        "Insert Into r_order_comment Values('%s', '%s', '%s', %d, '%s', '%s')",
                        house_id,
                        room_id,
                        user_id,
                        rating,
                        description,
                        create_time
                );
            }
            db.executeUpdate(sql);
            db.close();
            json.put("resCode", resCode);
            json.put("updateCommentInfo", info);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private boolean hasComment(String house_id, String room_id, String user_id) throws SQLException {
        String sql = String.format(
                "Select * From r_order_comment Where house_id='%s' And room_id='%s' And user_id='%s'",
                house_id,
                room_id,
                user_id
        );
        ResultSet res = db.executeQuery(sql);
        boolean flag = res.next();
        return flag;
    }

    public void getCommentById(String house_id, String room_id, String user_id, JSONObject json) throws JSONException, SQLException {
        String resCode = "00000";
        String info = "success";
        db = new DB("group1");
        try {
            String sql = String.format(
                    "Select score, comment From r_order_comment Where house_id='%s' And room_id='%s' And user_id='%s'",
                    house_id,
                    room_id,
                    user_id
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

    public void getComments(String house_id, String room_id, JSONObject json) {
        String resCode = "00000";
        String info = "success";
        db = new DB("group1");
        try {
            String sql = String.format(
                    "Select user_account.avatar, user_account.user_id, score, comment, create_time " +
                            "From r_order_comment Join user_account On r_order_comment.user_id=user_account.user_id " +
                            "Where house_id='%s' And room_id='%s'",
                    house_id,
                    room_id
            );
            showDebug("[getComments]", "sql: " + sql);
            ResultSet res = db.executeQuery(sql);
            ResultSetMetaData resMetaData = res.getMetaData();
            int fieldCount = resMetaData.getColumnCount();
            List comments = new ArrayList();
            while (res.next()) {
                HashMap<String, Object> map = new HashMap<>();
                for (int i = 0; i < fieldCount; i++) {
                    String key = resMetaData.getColumnName(i + 1);
                    String value = res.getString(key);
                    map.put(key, value);
                }
                comments.add(map);
            }
            json.put("resCode", resCode);
            json.put("getCommentsInfo", info);
            json.put("comments", comments);
        } catch (SQLException | JSONException e) {
            e.printStackTrace();
        }
    }
}
