package com.SC.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesUtil {

    public static String getProperty(String key){
        try {
            //创建配置文件对象
            Properties prop = new Properties();
            //配置文件字节输入
            InputStream in = PropertiesUtil.class.getClassLoader().getResourceAsStream("db.properties");
            //重输入流中加载配置文件
            prop.load(in);
            return prop.getProperty(key);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }


}
