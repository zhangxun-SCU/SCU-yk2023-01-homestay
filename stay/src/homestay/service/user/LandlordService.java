package homestay.service.user;

import homestay.dao.Data;
import homestay.dao.UserDao;
import homestay.entity.User;
import homestay.utils.UserUtil;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.SQLException;

public class LandlordService {
    public void beLandlord(Data data, JSONObject resJson) throws JSONException, SQLException {
        UserDao dao = new UserDao();
        User user = dao.queryUserById(data.getParam().getString("userId"));
        if (data.getParam().getString("id").equals(user.id) && UserUtil.encrypt(data.getParam().getString("password")).equals(user.password)) {
            dao.updateUserPermission(user.id, "middle");
            resJson.put("resCode", "00000");
            return;
        }
        resJson.put("resCode", "L00001");
    }
}
