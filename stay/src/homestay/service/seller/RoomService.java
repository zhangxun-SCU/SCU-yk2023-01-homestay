package homestay.service.seller;

import homestay.dao.Data;
import homestay.dao.seller.RoomDao;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.sql.SQLException;

public class RoomService {
    public void addRoom(Data data, JSONObject json) throws JSONException, IOException {
        RoomDao roomDao = new RoomDao();
        roomDao.addRoom(data, json);
    }

    public void getRoom(Data data, JSONObject json) throws JSONException, SQLException {
        RoomDao roomDao = new RoomDao();
        if (!data.getParam().has("house_id") || !data.getParam().has("room_id")) {
            roomDao.getRoomByHouse(data, json);
        } else {
            String roomId = data.getParam().getString("room_id");
            String houseId = data.getParam().getString("house_id");
            roomDao.getRoomById(houseId, roomId, json);
        }
    }

    public void deleteRoom(Data data, JSONObject json) throws SQLException, JSONException {
        RoomDao roomDao = new RoomDao();
        roomDao.deleteRoom(data, json);
    }

    public void modifyRoom(Data data, JSONObject json) throws SQLException, JSONException, IOException {
        RoomDao roomDao = new RoomDao();
        roomDao.modifyRoom(data, json);
    }
}
