package homestay.service.Feedback;
import homestay.dao.Data;
//import homestay.servlet.MyExcel;
import homestay.dao.Feedback.FeedbackDao;
import homestay.dao.weather.WeatherDao;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.SQLException;
public class FeedbackService {
    public static void getFeedback(Data data, JSONObject json) throws JSONException, SQLException {
        FeedbackDao dao = new FeedbackDao();
        dao.getDeviceRecord(data, json);
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
