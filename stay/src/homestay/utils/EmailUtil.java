package homestay.utils;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

import java.util.Random;

public class EmailUtil {
    private String fromAddr = "2089647798@qq.com";
    private String password = "srtppwdjnhisdgid";
    private String smtp_server = "smtp.qq.com";


    public void sendEmail(String toAddr, String info) throws EmailException {
        HtmlEmail email=new HtmlEmail();
        email.setHostName(smtp_server);
        email.setCharset("utf-8");
        email.addTo(toAddr);
        email.setFrom(fromAddr);
        email.setAuthentication(fromAddr,password);


        email.setSubject("测试");  //设置发送主题
        email.setMsg("验证码" + info);  //设置发送内容
        email.send();  //进行发送
    }
}
