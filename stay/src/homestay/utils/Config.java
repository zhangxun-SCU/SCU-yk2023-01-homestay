package homestay.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class Config {
    private static Config config;
    private Properties properties;

    private Config() {
        String configFile = ".properties";
        properties = new Properties();
        InputStream in = Config.class.getClassLoader().getResourceAsStream(configFile);
        try {
            properties.load(in);
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static Config getInstance() {
        if(config == null) {
            config = new Config();
        }
        return config;
    }

    public String getString(String key) {
        return properties.getProperty(key);
    }
}
