package homestay.service.market;

import homestay.dao.Data;
import homestay.dao.market.MarketDao;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.SQLException;
import java.util.*;

public class SpecialtyMarketService {
    public void queryAllSpecialty(Data data, JSONObject json,String user_id) throws SQLException, JSONException {
        MarketDao dao=new MarketDao();
        JSONArray specialtyList=new JSONArray();

        try{

            CartService cs=new CartService();
            cs.queryNumCartByUserId(user_id,json);
            specialtyList =dao.queryAllSpecialty();
            json.put("good_list",specialtyList);
            json.put("code",0);
        }

        catch (Exception e)
        {
            e.printStackTrace();
            json.put("code",1);
            System.out.println("queryAllSpecialty error");
        }

    }

    public void querySpecialtyById(String goodId, JSONObject json,String user_id) throws SQLException, JSONException {
        MarketDao dao=new MarketDao();
        try{
            JSONObject specialty=new JSONObject();
            specialty =dao.querySpecialtyById(goodId);
            Iterator keys=specialty.keys();
            while(keys.hasNext())
            {
                String key=String.valueOf(keys.next());
                json.put(key,specialty.getString(key));
            }

            CartService cs=new CartService();
            cs.queryNumCartByUserId(user_id,json);
            json.put("code",0);
        }

        catch (Exception e)
        {
            e.printStackTrace();
            json.put("code",1);
            System.out.println("queryAllSpecialty error");
        }

    }


    public void querySpecialtyByName(Data data, JSONObject json,String user_id) throws JSONException {
        MarketDao dao=new MarketDao();
        JSONArray specialtyList=new JSONArray();

        try{

            CartService cs=new CartService();
            cs.queryNumCartByUserId(user_id,json);
            specialtyList =dao.querySpecialtyByName(data.getParam().getString("search_name"));
            json.put("good_list",specialtyList);
            json.put("code",0);
        }

        catch (Exception e)
        {
            e.printStackTrace();
            json.put("code",1);
            System.out.println("queryAllSpecialty error");
        }
    }

    public void querySpecialtyByList(Data data, JSONObject json,String user_id) throws JSONException {
        MarketDao dao=new MarketDao();
        JSONArray specialtyList=new JSONArray();
        try{

            CartService cs=new CartService();
            cs.queryNumCartByUserId(user_id,json);
            specialtyList =dao.querySpecialtyByList(data);
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
}
