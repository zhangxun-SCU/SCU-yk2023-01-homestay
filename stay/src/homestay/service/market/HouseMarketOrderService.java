package homestay.service.market;
import homestay.dao.Data;
import homestay.dao.market.MarketOrderDao;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

public class HouseMarketOrderService {
    public void queryHouseOrderByList(Data data, JSONObject json,String buyer_id) throws JSONException {
        MarketOrderDao dao=new MarketOrderDao();
        JSONArray specialtyList=new JSONArray();
        try{

            String goodlist=data.getParam().getString("good_list");
            System.out.println(goodlist);
            JSONArray infolist=new JSONArray(goodlist);
            ArrayList<String> order_list=new ArrayList<>();
            for(int i=0;i<infolist.length();i++)
            {
                JSONObject good=infolist.getJSONObject(i);

                String order_id=dao.addPayRoomOrder(good,buyer_id);
                order_list.add(order_id);
            }
            specialtyList=dao.queryPayRoomOrderByList(order_list);
            json.put("good_list",specialtyList);
            json.put("code",0);
        }
        catch (Exception e)
        {
            e.printStackTrace();
            json.put("code",1);
            System.out.println("queryspecialtybylist error");
        }
    }

    public void payHouseOrder(Data data, JSONObject json, String buyer_id) throws JSONException {
        System.out.println(data.getParam().getString("good_list"));
        MarketOrderDao dao=new MarketOrderDao();
        try {
            double balance=dao.getBalanceByUserId(buyer_id);
            JSONArray jsonArray=new JSONArray(data.getParam().getString("good_list"));
            dao.payHouseOrder(balance,jsonArray,json,buyer_id);
            System.out.println("用户的余额是："+balance);
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
            json.put("code",2);
            e.printStackTrace();
        }

    }
}
