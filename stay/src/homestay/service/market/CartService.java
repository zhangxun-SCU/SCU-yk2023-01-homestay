package homestay.service.market;
import homestay.dao.CartDao;
import homestay.dao.Data;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.SQLException;

public class CartService {
    public void queryNumCartByUserId(String user_id,JSONObject json) throws SQLException, JSONException {
        try{
            CartDao dao=new CartDao();
            int num=dao.numCartByUserId(user_id);
            json.put("cart_num",num);
        }
        catch (Exception e){
            e.printStackTrace();
            System.out.println("query num cart by user id error");
        }

    }

    public void queryAllGood(JSONObject json,String user_id) throws JSONException {
        CartDao dao=new CartDao();
        JSONArray specialtyList=new JSONArray();

        try{
            specialtyList =dao.queryAllGood(user_id);

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

    public void addGood2Cart(Data data, JSONObject json,String user_id) throws JSONException {

        try{

            CartDao dao=new CartDao();
            dao.addGood2Cart(user_id,data,json);
            CartService cs=new CartService();
            cs.queryNumCartByUserId(user_id,json);
            json.put("code",0);
        }
        catch (Exception e){
            json.put("code",1);
            e.printStackTrace();
        }


    }

    public void deleteCartGood(Data data,JSONObject json,String user_id) throws JSONException {

        try{

            CartDao dao=new CartDao();
            dao.deleteCartGood(user_id,data,json);
            json.put("code",0);
        }
        catch (Exception e){
            json.put("code",1);
            e.printStackTrace();
        }

    }

    public void modifyCartGood(Data data, JSONObject json, String user_id) throws JSONException {
        try{

            CartDao dao=new CartDao();
            dao.modifyCartGood(user_id,data,json);
            json.put("code",0);
        }
        catch (Exception e){
            json.put("code",1);
            e.printStackTrace();
        }
    }
}
