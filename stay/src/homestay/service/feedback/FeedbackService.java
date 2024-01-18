package homestay.service.feedback;

import homestay.dao.Data;
import homestay.dao.feedback.FeedbackDao;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.SQLException;

public class FeedbackService {
    private void showDebug(String function, String message) {
        String log = "[FeedbackService]" + function + message;
        System.out.println(log);
    }

    public void getFeedback(Data data, JSONObject json) throws SQLException, JSONException {
        FeedbackDao dao = new FeedbackDao();
        if (!data.getParam().has("fid")) {
            dao.getAllFeedback(json);
        } else {
            String fid = data.getParam().getString("fid");
            dao.getFeedbackById(fid, json);
        }
    }

    public void updateFeedback(Data data, JSONObject json) throws JSONException {
        FeedbackDao dao = new FeedbackDao();
        if (data.getParam().has("reply") && data.getParam().has("fid")) {
            String fid = data.getParam().getString("fid");
            String reply = data.getParam().getString("reply");
            dao.replyFeedback(fid, reply, json);
        }
    }

    public static void deleteFeedback(Data data, JSONObject json) throws JSONException, SQLException {
        FeedbackDao dao = new FeedbackDao();
        dao.deleteFeedback(data, json);
    }

    public static void addFeedback(Data data, JSONObject json) throws JSONException, SQLException {
        FeedbackDao dao = new FeedbackDao();
        dao.addFeedback(data, json);
    }
}
