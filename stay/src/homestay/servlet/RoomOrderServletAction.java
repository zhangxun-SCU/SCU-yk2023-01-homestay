package homestay.servlet;
/*
 * 待完成：用MVC模式分开DB和Action操作
 * 增删改查看导印统功能的实现
 */

import homestay.dao.Data;
import homestay.dao.MySQLDao;
import homestay.dao.RoomOrderDao;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/homestay_servlet_room_order_servlet_action")
public class RoomOrderServletAction extends HttpServlet {
    String module="homestay";
    String sub="servlet";
    Data data=null;
    public void showDebug(String msg){
        System.out.println("["+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date())+"]["+module+"/"+sub+"/RoomOrderServletAction]"+msg);
    }
    /*
     * 处理顺序：先是service，后根据情况doGet或者doPost
     */
    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            processAction(request,response);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }
    /*========================================函数分流 开始========================================*/
    public void processAction(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, JSONException {
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        //设置以下头信息允许跨域
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "*");
        response.setHeader("Access-Control-Max-Age", "3600");
        response.setHeader("Access-Control-Allow-Headers", "*");
        response.setHeader("Access-Control-Allow-Credentials", "true");
        data=getPageParameters(request,response);
        String action = data.getParam().getString("action");
        boolean actionOk = false;
        int resultCode=0;
        String resultMsg="ok";
        JSONObject json=new JSONObject();
        showDebug("[processAction]收到的action是："+action);
        if (action == null){
            resultMsg="传递过来的action是NULL";
        }else{
            json.put("action",action);
            json.put("result_code",0);
            json.put("result_msg","ok");
            //这几个常规增删改查功能
            //买家查询订单操作
            if (action.equals("get_room_order_record")) {
                actionOk=true;
                try {
                    getOrderRecord(request, response, json);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (action.equals("get_room_order_record_seller")) {
                actionOk=true;
                try {
                    getOrderRecordSeller(request, response, json);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (action.equals("get_room_order_record_finished")) {
                actionOk=true;
                try {
                    getOrderRecordFinished(request, response, json);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (action.equals("get_room_order_record_finished_seller")) {
                actionOk=true;
                try {
                    getOrderRecordFinishedSeller(request, response, json);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (action.equals("get_room_order_record_unfinished")) {
                actionOk=true;
                try {
                    getOrderRecordUnfinished(request, response, json);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (action.equals("get_room_order_record_unfinished_seller")) {
                actionOk=true;
                try {
                    getOrderRecordUnfinishedSeller(request, response, json);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (action.equals("get_room_order_record_up")) {
                actionOk=true;
                try {
                    getOrderRecordUp(request, response, json);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (action.equals("get_room_order_record_up_seller")) {
                actionOk=true;
                try {
                    getOrderRecordUpSeller(request, response, json);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (action.equals("get_room_order_record_down")) {
                actionOk=true;
                try {
                    getOrderRecordDown(request, response, json);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (action.equals("get_room_order_record_down_seller")) {
                actionOk=true;
                try {
                    getOrderRecordDownSeller(request, response, json);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if(action.equals("get_room_order_record_by_hour")){
                actionOk=true;
                try {
                    getOrderCountByHour(request, response, json);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if(action.equals("get_room_order_record_by_hour_seller")){
                actionOk=true;
                try {
                    getOrderCountByHourSeller(request, response, json);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }


            //卖家查询订单操作

            if (action.equals("add_device_record")) {
                actionOk=true;
                try {
                    addDeviceRecord(request, response, json);
                } catch (JSONException e) {
                    e.printStackTrace();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (action.equals("modify_device_record")) {
                actionOk=true;
                try {
                    modifyDeviceRecord(request, response, json);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (action.equals("delete_room_order_record")) {
                actionOk=true;
                try {
                    deleteDeviceRecord(request, response, json);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (action.equals("delete_room_order_record_seller")) {
                actionOk=true;
                try {
                    deleteDeviceRecordSeller(request, response, json);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (action.equals("pay_room_order_record")) {
                actionOk=true;
                try {
                    payRoomOrderRecord(request, response, json);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            try {
                responseBack(request,response,data,json);
            } catch (JSONException e) {
                e.printStackTrace();
            }
            if (action.equals("export_device_record")) {
                actionOk=true;
                try {
                    exportDeviceRecord(request, response, json);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (action.equals("query_record")) {
                actionOk=true;
                try {
                    queryRecord(request, response, json);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (action.equals("update_record")) {
                actionOk=true;
                try {
                    updateRecord(request, response, json);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if(action.equals("upload_file")){
                actionOk=true;
                try {
                    uploadFile(request, response, json);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            try {
                responseBack(request,response,data,json);
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }
    /*========================================函数分流 结束========================================*/
    /*========================================公共函数 开始========================================*/
    private Data getPageParameters(HttpServletRequest request, HttpServletResponse response) throws JSONException {
        Data data=new Data();
        HttpSession session = request.getSession();
        /*----------------------------------------获取所有表单信息 开始----------------------------------------*/
        showDebug("[getPageParameters]----------------------------------------获取所有表单信息 开始----------------------------------------");
        JSONObject param=data.getParam();
        Enumeration requestNames=request.getParameterNames();
        for(Enumeration e=requestNames;e.hasMoreElements();){
            String thisName=e.nextElement().toString();
            String thisValue=request.getParameter(thisName);
            showDebug("[getPageParameters]"+thisName+"="+thisValue);
            param.put(thisName, thisValue);
        }
        showDebug("[getPageParameters]data的Param="+data.getParam().toString());
        showDebug("[getPageParameters]----------------------------------------获取所有表单信息 完毕----------------------------------------");
        /*----------------------------------------获取所有表单信息 完毕----------------------------------------*/
        return data;
    }
    private void responseBack(HttpServletRequest request, HttpServletResponse response, Data data, JSONObject json) throws JSONException {
        /*----------------------------------------获取所有服务器端信息 开始----------------------------------------*/
        boolean isAjax=true;if (request.getHeader("x-requested-with") == null || request.getHeader("x-requested-with").equals("com.tencent.mm")){isAjax=false;}	//判断是异步请求还是同步请求，腾讯的特殊
        //如果有参数就另外处理
        if(data.getParam().has("ajax") && data.getParam().getString("ajax").equals("true")){isAjax=true;};
        json.put("ajax",isAjax);
        /*----------------------------------------获取所有服务器端信息 结束----------------------------------------*/
        if(json.has("ajax") && json.getBoolean("ajax")){
            showDebug("[responseBack]ajax方式返回数据，页面局部刷新");
            response.setContentType("application/json; charset=UTF-8");
            try {
                response.getWriter().print(json);
                response.getWriter().flush();
                response.getWriter().close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            showDebug("[responseBack]跳转方式返回数据，页面跳转到指定页面");
            String action=json.getString("action");
            String errorNo="0";
            String errorMsg="ok";
            String url = module+"/"+sub+"/result.jsp?action="+action+"&result_code="+errorNo+ "&result_msg=" + errorMsg;
            if(json.has("redirect_url")) url=json.getString("redirect_url");
            try {
                response.sendRedirect(url);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    /*========================================公共函数 结束========================================*/
    /*========================================MySQL HTTP操作通用函数 开始========================================*/
    private void updateRecord(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException, SQLException {
        MySQLDao dao=new MySQLDao();
        dao.updateRecord(data,json);
    }
    private void queryRecord(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException, SQLException {
        MySQLDao dao=new MySQLDao();
        dao.queryRecord(data,json);
    }
    /*========================================MySQL HTTP操作通用函数 结束========================================*/
    /*========================================CRUD业务函数 开始========================================*/
    private void getOrderRecord(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException, SQLException {
        RoomOrderDao dao=new RoomOrderDao();
        dao.getOrderRecord(data,json);
    }
    private void getOrderRecordSeller(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException, SQLException {
        RoomOrderDao dao=new RoomOrderDao();
        dao.getOrderRecordSeller(data,json);
    }
    private void getOrderRecordFinished(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException, SQLException {
        RoomOrderDao dao=new RoomOrderDao();
        dao.getDeviceRecordFinished(data,json);
    }
    private void getOrderRecordFinishedSeller(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException, SQLException {
        RoomOrderDao dao=new RoomOrderDao();
        dao.getDeviceRecordFinishedRecord(data,json);
    }
    private void getOrderRecordUnfinished(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException, SQLException {
        RoomOrderDao dao=new RoomOrderDao();
        dao.getDeviceRecordUnfinished(data,json);
    }
    private void getOrderRecordUnfinishedSeller(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException, SQLException {
        RoomOrderDao dao=new RoomOrderDao();
        dao.getDeviceRecordUnfinishedSeller(data,json);
    }
    private void getOrderRecordUp(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException, SQLException {
        RoomOrderDao dao=new RoomOrderDao();
        dao.getDeviceRecordUp(data,json);
    }
    private void getOrderRecordUpSeller(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException, SQLException {
        RoomOrderDao dao=new RoomOrderDao();
        dao.getDeviceRecordUpSeller(data,json);
    }
    private void getOrderRecordDown(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException, SQLException {
        RoomOrderDao dao=new RoomOrderDao();
        dao.getDeviceRecordDown(data,json);
    }
    private void getOrderRecordDownSeller(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException, SQLException {
        RoomOrderDao dao=new RoomOrderDao();
        dao.getDeviceRecordDownSeller(data,json);
    }
    private void modifyDeviceRecord(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException, SQLException {
        RoomOrderDao dao=new RoomOrderDao();
        dao.modifyDeviceRecord(data,json);
    }

    private void payRoomOrderRecord(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException, SQLException {
        System.out.println("aa");
        RoomOrderDao dao=new RoomOrderDao();
        dao.payRoomOrderRecord(data,json);
    }
    private void deleteDeviceRecord(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException, SQLException {
        System.out.println("aa");
        RoomOrderDao dao=new RoomOrderDao();
        dao.deleteDeviceRecord(data,json);
    }
    private void deleteDeviceRecordSeller(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException, SQLException {
        System.out.println("aa");
        RoomOrderDao dao=new RoomOrderDao();
        dao.deleteDeviceRecordSeller(data,json);
    }
    private void addDeviceRecord(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException, SQLException {
        RoomOrderDao dao=new RoomOrderDao();
        dao.addDeviceRecord(data,json);
    }

    /*========================================CRUD业务函数 结束========================================*/

    private void exportDeviceRecord(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException, SQLException, IOException {
        RoomOrderDao dao=new RoomOrderDao();
        dao.getOrderRecord(data,json);
        getExportDeviceRecordToFile(json);
        getExportDeviceRecordToTxt(json);
        getExportDeviceRecordToExcel(json);
        getExportDeviceRecordToPdf(json);
    }
    private void getExportDeviceRecordToExcel(JSONObject json) throws JSONException, IOException {
        MyExcel me=new MyExcel("C:\\upload\\maintain\\device\\export_order.xls");
        json.put("download_url","/upload/maintain/device/export_order.xls");
        json.put("file_path","C:\\upload\\maintain\\device\\export_order.xls");
        me.exportData(data,json);
    }
    private void getExportDeviceRecordToPdf(JSONObject json) {
        //exportDeviceRecordToPdf(data,json);
    }


    private void getExportDeviceRecordToTxt(JSONObject json) {
        //exportDeviceRecordToTxt(data,json);
    }

    private void getExportDeviceRecordToFile(JSONObject json) throws JSONException {
        String jsonStr = json.toString();
//		System.out.println("aaaa");
        File jsonFile = new File("C:\\upload\\maintain\\device\\export_device.txt");
        json.put("download_url","/upload/maintain/device/export_device.txt");
        try {
            // 文件不存在就创建文件
            if (!jsonFile.exists()) {
                jsonFile.createNewFile();
            }
            FileWriter fileWriter = new FileWriter(jsonFile.getAbsoluteFile());
            BufferedWriter bw = new BufferedWriter(fileWriter);
            bw.write(jsonStr);
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    //	private void getExportDeviceRecordToExcel(JSONObject json) throws JSONException, IOException {
//		MyExcel me=new MyExcel("C:\\upload\\maintain\\device\\export_order.xls");
//		json.put("download_url","/upload/maintain/device/export_order.xls");
//		json.put("file_path","C:\\upload\\maintain\\device\\export_order.xls");
//		me.exportData(data,json);
//	}
    private void getOrderCountByHour(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException, IOException {
        RoomOrderDao dao=new RoomOrderDao();
        dao.getOrderCountByHour(data,json);
    }
    private void getOrderCountByHourSeller(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException, IOException {
        RoomOrderDao dao=new RoomOrderDao();
        dao.getOrderCountByHourSeller(data,json);
    }
    /*========================================上传文件函数 开始========================================*/
    private void uploadFile(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException, SQLException {
        uploadFileAttachment(request, response, json);				//上传文件到指定目录，返回文件存放目录和构造出来的url，放在json里传递出来
        saveFileAttachmentRecord(data,json);						//把文件上传后，存在json传递的文件存放信息，保存进数据库表里
    }
    private void uploadFileAttachment(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException, SQLException {
        //先做初始化工作，定义一堆目录变量
        String fileUrl=null;
        String rootPath="D:\\upload";
        String filePath=rootPath+"\\teach\\"+(new SimpleDateFormat("yyyyMMddHH")).format(new Date());
        String rootUrl="/upload";
        String filePathUrl=rootUrl+"/teach/"+(new SimpleDateFormat("yyyyMMddHH")).format(new Date());
        String tmpPath = rootPath + "\\temp\\"; // 临时路径
        showDebug("[uploadFileAttachment]服务器保存根目录："+rootPath);
        showDebug("[uploadFileAttachment]服务器保存目录："+filePath+"，临时目录："+tmpPath);
        showDebug("[uploadFileAttachment]服务器保存后的URL根路径："+rootUrl);

        //接着检查目录是否存在，不存在就创建目录
        File fileRepository = new File(filePath);
        if (!fileRepository.exists() && !fileRepository.isDirectory())
            fileRepository.mkdirs();
        File tmpRepository = new File(tmpPath);
        if (!tmpRepository.exists() && !tmpRepository.isDirectory())
            tmpRepository.mkdirs();

        //定义两个传递结果出来的数组，字段数组和文件数组
        List fileList = new ArrayList();							//保存收到的文件信息
        List fieldList = new ArrayList();							//保存传递过来的字段信息

        //开始接收上传文件
        try {
            if (ServletFileUpload.isMultipartContent(request)) {
                DiskFileItemFactory dff = new DiskFileItemFactory();//创建该对象
                dff.setRepository(tmpRepository);					//指定上传文件的临时目录
                dff.setSizeThreshold(1024000);						//指定在内存中缓存数据大小,单位为byte
                ServletFileUpload sfu = new ServletFileUpload(dff);	//创建该对象
                sfu.setHeaderEncoding("UTF-8");						//设定编码用统一的
                sfu.setSizeMax(1000000000);							//指定单个上传文件的最大尺寸
                /*--------------------收文件 开始--------------------*/
                List<FileItem> list = sfu.parseRequest(request);

                for (Iterator<FileItem> iter = list.iterator(); iter.hasNext();) {
                    FileItem item = iter.next();
                    //item可能是文件，也可能是字段类型，分别区分对待
                    if (item.isFormField()) {
                        //如果是字段，例如：device_id、device_name等
                        String fieldName=item.getFieldName();
                        String fieldValue=item.getString("UTF-8");
                        HashMap map = new HashMap();
                        map.put(fieldName, fieldValue);
                        fieldList.add(map);
                        showDebug("[uploadFileAttachment]收到字段："+fieldName+"="+fieldValue);
                    }else{
                        //如果是form-data
                        String objectId=null;
                        String filePathName=null;
                        String fileName=item.getName();
                        int fileSize=0;
                        showDebug("[uploadFileAttachment]收到文件："+fileName);
                        if(!fileName.isEmpty()){
                            //如果带有路径，就去掉路径，找文件名
                            fileName=fileName.substring(fileName.lastIndexOf("\\")+1);
                            //fileName=(new SimpleDateFormat("yyyyMMddHHmmss")).format(new Date());						//或者自行编写一个流水号的文件名
                            objectId="UPLOAD_"+(new SimpleDateFormat("yyyyMMddHHmmssSSS")).format(new Date());	//生成一个流水号附件id给前端
                            showDebug("[uploadFileAttachment]文件路径："+filePath + "\\" + fileName);
                            filePathName=filePath + "\\" + fileName;
                            /*--------------------接收文件数据 开始--------------------*/
                            FileOutputStream out=new FileOutputStream(filePath + "\\" + fileName);
                            InputStream in = item.getInputStream();
                            byte buffer[] = new byte[1024];
                            int len = 0;
                            while((len=in.read(buffer))>0){
                                out.write(buffer,0,len);
                                fileSize=fileSize+len;
                            }
                            in.close();
                            out.close();
                            /*--------------------接收文件数据 结束--------------------*/
                            fileUrl=filePathUrl+"/"+fileName;															//fileUrl是保存文件后，构造出供前端访问的fileUrl
                        }
                        // 构造返回结果的json
                        HashMap map = new HashMap();
                        map.put("file_size", fileSize);
                        map.put("file_path_name", filePathName);
                        map.put("file_url_name", fileUrl);
                        map.put("file_object_id", objectId);
                        fileList.add(map);
                        showDebug("[uploadFileAttachment]存到：fileName="+fileName+",filePath="+filePath+",fileSize="+fileSize+",fileUrl="+fileUrl);
                    }
                }
                /*--------------------收文件 结束--------------------*/
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        json.put("upload_files", fileList);
        json.put("upload_fields", fieldList);
    }
    /*
    功能：把上传文件uploadFileAttachment后，得到的文件信息，保存进数据库表里
     */
    private void saveFileAttachmentRecord(Data data, JSONObject json) throws JSONException, SQLException {
        //这部分需要自己写
        showDebug("[saveFileRecord]收完文件后，传递出来的json是："+json.toString());
        RoomOrderDao dao=new RoomOrderDao();
        dao.saveUploadFileRecord(json,data);
    }
    /*========================================上传文件函数 结束========================================*/
}
