package homestay.service.market;

import homestay.dao.Data;
import homestay.dao.market.RoomDao;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RoomService {
    public void getRestNum(Data data, JSONObject json) throws JSONException, SQLException {
        String house_id =data.getParam().getString("good_id");
        String in_date=data.getParam().getString("in_date");
        String  out_date=data.getParam().getString("out_date");

        ArrayList<JSONObject> room_list=new ArrayList<JSONObject>();
        RoomDao dao=new RoomDao();
        room_list=dao.getRoomListByHouseId(house_id);
        JSONArray room_with_num =new JSONArray();

        for(int ri=0;ri<room_list.size();ri++){

            JSONObject room=room_list.get(ri);

            JSONObject roomres=dao.getRoomResNum(house_id,room,in_date,out_date);

            room_with_num.put(roomres);

        }

        json.put("room_list",room_with_num);
    }

}
