package homestay.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfigMysql {
    private static ConfigMysql configMysql;
    private Properties properties;

    private ConfigMysql() {
        String configFile = "sql.properties";
        properties = new Properties();
        InputStream in = ConfigMysql.class.getClassLoader().getResourceAsStream(configFile);
        try {
            properties.load(in);
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static ConfigMysql getInstance() {
        if(configMysql == null) {
            configMysql = new ConfigMysql();
        }
        return configMysql;
    }

    public String getString(String key) {
        return properties.getProperty(key);
    }
}
