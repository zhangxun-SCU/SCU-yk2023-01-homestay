package homestay.service.user;

import homestay.dao.Data;
import homestay.dao.UserDao;
import org.json.JSONException;
import org.json.JSONObject;

import java.math.BigDecimal;
import java.sql.SQLException;

public class BalanceService {
    public void recharge(Data data, JSONObject resJson) throws JSONException, SQLException {
        UserDao userDao = new UserDao();
        BigDecimal balance = userDao.getUserBalance(data.getParam().getString("userId"));
        balance = balance.add(BigDecimal.valueOf(Long.parseLong(data.getParam().getString("rechargeValue"))));
        System.out.println(balance);
        userDao.updateUserBalance(data.getParam().getString("userId"), balance);
        resJson.put("newBalance", balance.doubleValue());
        resJson.put("resCode", "00000");
    }

    public void payouts(Data data, JSONObject resJson) throws JSONException {
        UserDao userDao = new UserDao();
        userDao.updateUserBalance(data.getParam().getString("userId"), BigDecimal.valueOf(0));
        resJson.put("newBalance", 0);
        resJson.put("resCode", "00000");
    }
}
