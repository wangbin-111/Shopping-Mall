package com.ttsxht.util;


import org.apache.commons.dbcp.BasicDataSource;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * 数据库工具类
 */
public final class DBUtil {

    //单例模式(数据库连接池)
    private static BasicDataSource dataSource = null;

    private DBUtil(){

    }

    //静态块
    static{
        //初始化连接池
        dataSource = new BasicDataSource();
        //配置驱动字符串
        dataSource.setDriverClassName(PropertiesUtil.getProperty("className"));
        //配置连接url地址
        dataSource.setUrl(PropertiesUtil.getProperty("url"));
        //配置连接账户
        dataSource.setUsername(PropertiesUtil.getProperty("user"));
        //配置连接账户密码
        dataSource.setPassword(PropertiesUtil.getProperty("password"));
    }


    /**
     * 获取数据库连接方法
     * @return
     */
    public static Connection getCon(){
        Connection con = null;
        try {
            con = dataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }

    /**
     * 通用查询集合方法(查询多行)
     * @param sql
     * @param c
     * @param args
     * @return
     */
    public static ArrayList queryForList(String sql, Class c, Object...args){
        ArrayList list = new ArrayList();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection con =DBUtil.getCon();
            ps = con.prepareStatement(sql);
            for(int i=0;i<args.length;i++){
                ps.setObject(i+1,args[i]);
            }
            rs = ps.executeQuery();
            while(rs.next()){
                Object obj = c.newInstance();
                //获取Class中所有的属性
                Field[] fs = c.getDeclaredFields();
                //循环遍历所有属性对象
                for(Field f : fs){
                    //取消访问修饰符限制
                    f.setAccessible(true);
                    //设置属性值
                    f.set(obj,rs.getObject(f.getName()));
                }
                list.add(obj);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }


}
