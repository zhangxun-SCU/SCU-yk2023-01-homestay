package homestay.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class UploadUtil {
    static public final String ROOT_PATH = "D:\\upload";
    static public final String ROOT_URL="/upload";
    static public final String TMP_PATH = ROOT_PATH + "\\temp\\"; // 临时路径

    static public final long serialVersionUID = 1L;
    // 上传文件存储目录
    static public final String UPLOAD_DIRECTORY = "upload";
    // 上传配置
    static public final int MEMORY_THRESHOLD   = 1024 * 1024 * 5;  // 5MB
    static public final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    static public final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
}
