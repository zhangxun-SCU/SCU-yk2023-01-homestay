package homestay.dao.seller;

import homestay.dao.DB;
import org.apache.poi.hssf.usermodel.*;
import org.json.JSONException;
import org.json.JSONObject;
import homestay.dao.Data;
import org.apache.poi.*;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class ExportDao {
    private void showDebug(String function, String msg) {
        String log = "[ExportDao]" + function + msg;
        System.out.println(log);
    }

    public void exportData(Data data, JSONObject json) {
        String resCode = "00000";
        String info = "success";
        // 生成excel文件并保存
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFCellStyle style = workbook.createCellStyle();
        HSSFFont font = workbook.createFont();
        font.setCharSet(HSSFFont.ANSI_CHARSET);
        style.setFont(font);
        try {
            String owner_id = data.getParam().getString("owner_id");
            showDebug("[exportData]", "owner_id: " + owner_id);
            // 生成特产销量信息sheet
            generateSpecialtySheet(workbook, owner_id);
            // 生成民宿销量信息sheet
            generateHouseSheet(workbook, owner_id);

            String filepath = "D:\\upload\\sales_statistics\\" + owner_id + ".xls";
            String downloadPath = "/upload/sales_statistics/" + owner_id + ".xls";
            FileOutputStream output = new FileOutputStream(filepath);
            OutputStreamWriter writer = new OutputStreamWriter(output, StandardCharsets.UTF_8);
            workbook.write(output);
            output.flush();
            output.close();
            json.put("resCode", resCode);
            json.put("exportDataInfo", info);
            json.put("download_path", downloadPath);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void generateSpecialtySheet(HSSFWorkbook workbook, String owner_id) throws SQLException {
        DB db = new DB("group1");
        HSSFSheet specialtySheet = workbook.createSheet("特产销量表");
        HSSFRow specialtyTitle = specialtySheet.createRow(0);
        String sql = String.format(
                "Select specialty_id As '特产ID', specialty_name As '特产名称', inventory As '库存', price As '单价', SUM(num) As '总销量' " +
                        "From (Select specialty.specialty_id, specialty.specialty_name, specialty.num As inventory, specialty.price, specialty_order.num " +
                        "From specialty_order " +
                        "Join specialty On specialty_order.good_id=specialty.specialty_id " +
                        "Where specialty.owner_id='%s' And specialty_order.order_status=1) A Group By specialty_id",
                owner_id
        );
        showDebug("[generateSpecialtySheet]", "sql: " + sql);
        ResultSet res = db.executeQuery(sql);
        ResultSetMetaData resMetaData = res.getMetaData();
        int fieldCount = resMetaData.getColumnCount();
        for (int i = 0; i < fieldCount; i++) {
            HSSFCell cell = specialtyTitle.createCell(i);
            cell.setCellValue(resMetaData.getColumnName(i + 1));
        }
        int rowNumber = 1;
        while (res.next()) {
            HSSFRow row = specialtySheet.createRow(rowNumber);
            for (int i = 0; i < fieldCount; i++) {
                HSSFCell cell = row.createCell(i);
                String key = resMetaData.getColumnName(i + 1);
                String value = res.getString(key);
                cell.setCellValue(value);
            }
            rowNumber++;
        }
        res.close();
        db.close();
    }

    private void generateHouseSheet(HSSFWorkbook workbook, String owner_id) throws SQLException {
        DB db = new DB("group1");
        HSSFSheet houseSheet = workbook.createSheet("民宿销量表");
        HSSFRow houseTitle = houseSheet.createRow(0);
        String sql = String.format(
                "Select house_id As '民宿ID', room_id As '房间ID', house_name As '民宿名称', room_name As '房间类型', inventory As '空闲房间数', room_price As '单价', SUM(num) As '预订总数' " +
                        "From (Select house.house_id, room.room_id, house.house_name, room.room_name, room.room_num As inventory, room.room_price, deal_order.num " +
                        "From deal_order " +
                        "Join room_occupy On deal_order.good_id=room_occupy.op_id " +
                        "Join room On room_occupy.room_id=room.room_id " +
                        "Join house On room.house_id=house.house_id " +
                        "Where house.owner_id='%s' And deal_order.order_status=1) A Group By house_id, room_id;",
                owner_id
        );
        showDebug("[generateHouseSheet]", "sql: " + sql);
        ResultSet res = db.executeQuery(sql);
        ResultSetMetaData resMetaData = res.getMetaData();
        int fieldCount = resMetaData.getColumnCount();
        for (int i = 0; i < fieldCount; i++) {
            HSSFCell cell = houseTitle.createCell(i);
            cell.setCellValue(resMetaData.getColumnName(i + 1));
        }
        int rowNumber = 1;
        while (res.next()) {
            HSSFRow row = houseSheet.createRow(rowNumber);
            for (int i = 0; i < fieldCount; i++) {
                HSSFCell cell = row.createCell(i);
                String key = resMetaData.getColumnName(i + 1);
                String value = res.getString(key);
                cell.setCellValue(value);
            }
            rowNumber++;
        }
        res.close();
        db.close();
    }
}
