package homestay.servlet;

import homestay.dao.Data;
import org.apache.poi.hssf.usermodel.*;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;

public class MyExcel {

    public MyExcel(String s) {
    }

    public void exportData(Data data, JSONObject json) throws JSONException, IOException {
        //创建对象HSSFWorkbook
        HSSFWorkbook wb=new HSSFWorkbook();
        //创建HSSFSheet对象
        HSSFSheet sheet=wb.createSheet("sheet0");

        //////////////////////////////////////////////////////
        //写表头
        JSONArray arrayTitle=json.getJSONArray("aaFieldName");
        //创建HSSFRow对象
        HSSFRow rowTitle=sheet.createRow(0);
        for(int i=0;i<arrayTitle.length();i++){
            //创建HSSFCell对象
            HSSFCell cell=rowTitle.createCell(i);
            cell.setCellValue((String)arrayTitle.get(i));
            System.out.println("表头字段="+(String)arrayTitle.get(i));
        }
        /////////////////////////////////////////////////////////
        JSONArray array=json.getJSONArray("aaData");
        for(int i=1;i<=array.length();i++){
            //创建HSSFRow对象
            HSSFRow row=sheet.createRow(i);

            int j=0;
            HashMap<String,String> record=(HashMap<String, String>) array.get(i-1);
            for(j = 0; j < arrayTitle.length(); j++){
                String key = arrayTitle.getString(j);
                String value = record.get(key);
                System.out.println("[exportData]key: " + key + " value: " + value);
                HSSFCell cell = row.createCell(j);
                cell.setCellValue(value);
            }
//            for(HashMap.Entry<String,String>entry:record.entrySet()){
//                System.out.println("key="+entry.getKey()+"---value"+entry.getValue());
//                //创建HSSFCell对象
//                HSSFCell cell=row.createCell(j);
//                //设置单元格的值
//                cell.setCellValue(entry.getValue());
//                j++;
//            }
        }
        //输出Excel文件
        FileOutputStream output=new FileOutputStream(json.getString("file_path"));
        wb.write(output);
        output.flush();
        output.close();
    }
}
