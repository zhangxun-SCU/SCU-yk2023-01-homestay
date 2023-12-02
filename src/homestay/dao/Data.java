package homestay.dao;

import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Enumeration;

public class Data {
    private JSONObject params = new JSONObject();

    public JSONObject getParam() {
        return params;
    }

    public void setParam(JSONObject params) {
        this.params = params;
    }

    static public Data getPageParameters(HttpServletRequest req, HttpServletResponse resp) throws JSONException {
        Data data = new Data();
        JSONObject param = data.getParam();
        System.out.print("[getPageParameters]: ");
        Enumeration<String> requestNames = req.getParameterNames();
        while (requestNames.hasMoreElements()) {
            String key = requestNames.nextElement();
            System.out.println(key + ": " + req.getParameter(key));
            param.put(key, req.getParameter(key));
        }
        System.out.println();
        return data;
    }
}
