package homestay.service.market;

import homestay.dao.Data;
import homestay.dao.market.MarketDao;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.SQLException;
import java.util.Iterator;

public class HouseMarketService {
    public void queryAllHouse(Data data, JSONObject json) throws SQLException, JSONException {
        MarketDao dao=new MarketDao();
        JSONArray specialtyList=new JSONArray();
        RoomService ros=new RoomService();
        try{
            specialtyList =dao.queryAllHouse();
            json.put("good_list",specialtyList);
            json.put("code",0);
        }

        catch (Exception e)
        {
            e.printStackTrace();
            json.put("code",1);
            System.out.println("queryAllHouse error");
        }

    }

    public void queryHouseById(String goodId, JSONObject json) throws SQLException, JSONException {
        MarketDao dao=new MarketDao();
        try{
            JSONObject specialty=new JSONObject();
            specialty =dao.queryHouseById(goodId);
            Iterator keys=specialty.keys();
            while(keys.hasNext())
            {
                String key=String.valueOf(keys.next());
                json.put(key,specialty.getString(key));
            }
            json.put("code",0);
        }

        catch (Exception e)
        {
            e.printStackTrace();
            json.put("code",1);
            System.out.println("queryAllSpecialty error");
        }

    }


    public void queryHouseByName(Data data, JSONObject json) throws JSONException {
        MarketDao dao=new MarketDao();
        JSONArray specialtyList=new JSONArray();

        try{

            specialtyList =dao.queryHouseByName(data.getParam().getString("search_name"));
            json.put("good_list",specialtyList);
            json.put("code",0);
        }

        catch (Exception e)
        {
            e.printStackTrace();
            json.put("code",1);
            System.out.println("queryAllHouse error");
        }
    }

    public void queryHouseByList(Data data, JSONObject json) throws JSONException {
        MarketDao dao=new MarketDao();
        JSONArray specialtyList=new JSONArray();
        try{

            specialtyList =dao.queryHouseByList(data);
            json.put("good_list",specialtyList);
            json.put("code",0);
        }
        catch (Exception e)
        {
            e.printStackTrace();
            json.put("code",1);
            System.out.println("query house bylist error");
        }
    }
}
