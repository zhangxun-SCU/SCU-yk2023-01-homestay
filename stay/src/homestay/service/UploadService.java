package homestay.service;

import homestay.utils.UploadUtil;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class UploadService {
    public List<String> upload(HttpServletRequest req, HttpServletResponse resp, JSONObject resJson, String subPath) {
        if (!ServletFileUpload.isMultipartContent(req)) {
            // 如果不是则停止
            try {
                resJson.put("resCode", "F00001");
                resJson.put("uploadInfo", "form must contain enctype=multipart/form-data");
            } catch (JSONException e) {
                e.printStackTrace();
            }
            return null;
        }
        /* 配置上传参数 */
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(UploadUtil.MEMORY_THRESHOLD);  // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录
        File tmpDir = new File(UploadUtil.TMP_PATH);
        if (!tmpDir.exists()) { tmpDir.mkdir(); }
        factory.setRepository(tmpDir);

        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setFileSizeMax(UploadUtil.MAX_FILE_SIZE);  // 设置最大文件上传值
        upload.setSizeMax(UploadUtil.MAX_REQUEST_SIZE);  // 最大请求值： 文件 + 表单
        upload.setHeaderEncoding("UTF-8");
        String uploadPath = "".equals(subPath) ? UploadUtil.ROOT_PATH : UploadUtil.ROOT_PATH + File.separator+ subPath;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) { uploadDir.mkdir(); }  // 目录不存在就创建
        // 上传
        List<String> urls = new ArrayList<>();
        try {
            // 解析请求的内容提取文件数据
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(req);

            if (formItems != null && formItems.size() > 0) {
                // 迭代表单数据
                for (FileItem item : formItems) {
                    // 处理不在表单中的字段
                    if (!item.isFormField()) {
                        String originFileName = new File(item.getName()).getName();
                        String fileName = originFileName.substring(0, originFileName.lastIndexOf('.'))
                                + "_"
                                + UUID.randomUUID().toString()
                                + originFileName.substring(originFileName.lastIndexOf('.'));
                        String filePath = uploadPath + File.separator + fileName;
                        File storeFile = new File(filePath);
                        // 在控制台输出文件的上传路径
                        System.out.println(filePath);
                        // 保存文件到硬盘
                        item.write(storeFile);
                        urls.add("".equals(subPath) ? "/upload/" + fileName
                                : "/upload/" + subPath + "/" + fileName);
                    }
                }
            }
            resJson.put("resCode", "00000");
            resJson.put("uploadInfo", "success");
            resJson.put("urls", urls);
        } catch (Exception ex) {
            req.setAttribute("message",
                    "错误信息: " + ex.getMessage());

        }
        return urls;
    }
}
