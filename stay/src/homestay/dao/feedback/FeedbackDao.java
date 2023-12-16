package homestay.dao.feedback;

import homestay.dao.DB;
import homestay.dao.Data;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FeedbackDao {
    private void showDebug(String function, String message) {
        String log = "[FeedbackDao]" + function + message;
        System.out.println(log);
    }

    public void getFeedback(Data data, JSONObject json) throws SQLException, JSONException {
        String resCode = "00000";
        String info = "success";
        DB db = new DB("group1");
        // 两表联查，获取用户头像以及feedback信息，按照feedback发布时间降序排列
        String sql = "Select feedback.*, user_account.avatar " +
                "From feedback Join user_account " +
                "On feedback.user_id=user_account.user_id " +
                "Order By feedback.feedback_time Desc";
        showDebug("[getFeedback]", "sql: " + sql);
        ResultSet res = db.executeQuery(sql);
        ResultSetMetaData resMetaData = res.getMetaData();
        int fieldCount = resMetaData.getColumnCount();
        List feedbackList = new ArrayList();
        while (res.next()) {
            Map feedback = new HashMap();
            for (int i = 0; i < fieldCount; i++) {
                String key = resMetaData.getColumnName(i + 1);
                String value = res.getString(key);
                feedback.put(key, value);
                showDebug("[getFeedback]", key + ": " + value);
            }
            feedbackList.add(feedback);
        }
        res.close();
        db.close();
        json.put("resCode", resCode);
        json.put("getFeedbackInfo", info);
        json.put("feedbackList", feedbackList);
    }

    public void replyFeedback(String fid, String reply, JSONObject json) throws JSONException {
        DB db = new DB("group1");
        String resCode = "00000";
        String info = "success";
        try {
            String sql = "Update feedback Set reply='" + reply + "' Where fid='" + fid + "'";
            db.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
            resCode = "F0002";
            info = "fid错误";
        }
        db.close();
        json.put("resCode", resCode);
        json.put("replyFeedbackInfo", info);
    }
}
