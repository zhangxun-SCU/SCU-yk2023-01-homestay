package homestay.dao.seller;

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

public class StatisticsDao {
    public void getNewOrders(Data data, JSONObject json) throws JSONException, SQLException {
        DB db = new DB("group1");
        String resCode = "00000";
        String info = "success";
        try {
            String sql;
            if (data.getParam().has("owner_id")) {
                String owner_id = data.getParam().getString("owner_id");
                sql = String.format(
                        "Select user_account.avatar, user_account.user_id, A.specialty_name, specialty_order.num, specialty_order.price, specialty_order.create_date " +
                                "From specialty_order " +
                                "Join (Select specialty_id, specialty_name From specialty Where owner_id='%s') A On specialty_order.good_id=A.specialty_id " +
                                "Join user_account On specialty_order.buyer_id=user_account.user_id Where specialty_order.create_date Between DATE_SUB(NOW(), Interval 1 day) And NOW();",
                        owner_id
                );
            } else {
                sql = "Select user_account.avatar, user_account.user_id, A.specialty_name, specialty_order.num, specialty_order.price, specialty_order.create_date " +
                        "From specialty_order " +
                        "Join (Select specialty_id, specialty_name From specialty) A On specialty_order.good_id=A.specialty_id " +
                        "Join user_account On specialty_order.buyer_id=user_account.user_id";
            }
            System.out.println("[StatisticsDao][getNewOrders]" + "sql: " + sql);
            ResultSet res = db.executeQuery(sql);
            ResultSetMetaData resMetaData = res.getMetaData();
            int fieldCount = resMetaData.getColumnCount();
            List list = new ArrayList();
            while (res.next()) {
                HashMap map = new HashMap();
                for (int i = 0; i < fieldCount; i++) {
                    String key = resMetaData.getColumnName(i + 1);
                    String value = res.getString(key);
                    map.put(key, value);
                }
                list.add(map);
            }
            res.close();
            db.close();
            json.put("resCode", resCode);
            json.put("getNewOrdersInfo", info);
            json.put("new_orders", list);
        } catch (SQLException | JSONException e) {
            e.printStackTrace();
        }
    }

    public void getTotalStatistics(Data data, JSONObject json) throws JSONException, SQLException {
        DB db = new DB("group1");
        String resCode = "00000";
        String info = "success";
        String owner_id = data.getParam().getString("owner_id");
        String sql = String.format(
                "Select SUM(specialty_order.price) As total_income, Count(Distinct specialty_order.order_id) As total_sales " +
                        "From specialty_order " +
                        "Join (Select specialty_id From specialty Where owner_id='%s') A On specialty_order.good_id=A.specialty_id;",
                owner_id
        );
        System.out.println("[StatisticsDao][getTotalStatistics]" + "sql: " + sql);
        ResultSet res = db.executeQuery(sql);
        String total_sales = null, total_income = null;
        while (res.next()) {
            total_sales = res.getString("total_sales");
            total_income = res.getString("total_income");
        }
        res.close();
        db.close();
        json.put("resCode", resCode);
        json.put("getTotalStatisticsInfo", info);
        json.put("total_income", total_income);
        json.put("total_sales", total_sales);
    }

    public void getSalesComparison(Data data, JSONObject json) throws JSONException, SQLException {
        DB db = new DB("group1");
        String resCode = "00000";
        String info = "success";
        String owner_id = data.getParam().getString("owner_id");
        {
            // 特产今日销售额
            String sql = String.format(
                    "Select IF(SUM(specialty_order.price) Is NULL, 0, SUM(specialty_order.price)) As total_income " +
                            "From specialty_order " +
                            "Join (Select specialty_id From specialty Where owner_id='%s') A " +
                            "On specialty_order.good_id=A.specialty_id " +
                            "Where specialty_order.create_date BETWEEN DATE_SUB(NOW(), Interval 1 day) And NOW();",
                    owner_id
            );
            ResultSet res = db.executeQuery(sql);
            while (res.next()) {
                json.put("specialty_today", res.getString("total_income"));
            }
            res.close();
        }
        {
            // 特产昨日销售额
            String sql = String.format(
                    "Select IF(SUM(specialty_order.price) Is NULL, 0, SUM(specialty_order.price)) As total_income " +
                            "From specialty_order " +
                            "Join (Select specialty_id From specialty Where owner_id='hubert') A " +
                            "On specialty_order.good_id=A.specialty_id " +
                            "Where specialty_order.create_date BETWEEN DATE_SUB(NOW(), Interval 2 day) And DATE_SUB(NOW(), Interval 1 day);",
                    owner_id
            );
            ResultSet res = db.executeQuery(sql);
            while (res.next()) {
                json.put("specialty_yesterday", res.getString("total_income"));
            }
            res.close();
        }
        {
            // 民宿今日销售额
            String sql = String.format(
                    "Select IF(SUM(deal_order.price)Is NULL, 0, SUM(deal_order.price)) As total_income " +
                            "From deal_order " +
                            "Join room_occupy On deal_order.good_id=room_occupy.op_id " +
                            "Join room On room_occupy.room_id=room.room_id " +
                            "Join (Select house_id From house Where owner_id='%s') A On room.house_id=A.house_id " +
                            "Where deal_order.create_date BETWEEN DATE_SUB(NOW(), Interval 1 day) And NOW();",
                    owner_id
            );
            ResultSet res = db.executeQuery(sql);
            while (res.next()) {
                json.put("house_today", res.getString("total_income"));
            }
            res.close();
        }
        {
            // 民宿昨日销售额
            String sql = String.format(
                    "Select IF(SUM(deal_order.price)Is NULL, 0, SUM(deal_order.price)) As total_income " +
                            "From deal_order " +
                            "Join room_occupy On deal_order.good_id=room_occupy.op_id " +
                            "Join room On room_occupy.room_id=room.room_id " +
                            "Join (Select house_id From house Where owner_id='%s') A On room.house_id=A.house_id " +
                            "Where deal_order.create_date BETWEEN DATE_SUB(NOW(), Interval 2 day) And DATE_SUB(NOW(), Interval 1 day);",
                    owner_id
            );
            ResultSet res = db.executeQuery(sql);
            while (res.next()) {
                json.put("house_yesterday", res.getString("total_income"));
            }
            res.close();
        }
        db.close();
        json.put("resCode", resCode);
        json.put("getSalesComparisonInfo", info);
    }
}
