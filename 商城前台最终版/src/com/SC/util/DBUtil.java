package com.SC.util;



import org.apache.commons.dbcp.BasicDataSource;

import java.lang.reflect.Field;
import java.sql.*;
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
     * 通用的增删改方法
     * @param sql
     * @return
     */
    public static int update(String sql){
        //受影响行数
        int n = 0;
        Connection con = null;
        Statement sta = null;
        try {
            //建立连接
            con = DBUtil.getCon();
            //创建SQL执行对象
            sta = con.createStatement();
            //执行sql(增删改)语句  返回受影响行数
            n = sta.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                //关闭
                sta.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return n;
    }

    /**
     * 通用的增删改方法(预编译方式)
     * @param sql
     * @param args
     * @return
     */
    public static int update(String sql,Object...args){
        //受影响行数
        int n = 0;
        PreparedStatement ps = null;
        Connection con = null;
        try {
            //建立连接
            con = DBUtil.getCon();
            //创建预编译SQL执行对象
            ps = con.prepareStatement(sql);
            //循环设置?占位符数据(索引下标从1开始)
            for(int i=0;i<args.length;i++){
                ps.setObject(i+1 , args[i]);
            }
            //执行sql(增删改)语句  返回受影响行数
            n = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                //关闭
                ps.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return n;
    }

    /**
     * 通用查询对象方法(查询单行数据)
     * @param sql
     * @param rm
     * @param args
     * @return
     */
    public static Object queryForObject(String sql,RowMapper rm,Object...args){
        Object obj = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtil.getCon();
            ps = con.prepareStatement(sql);
            for(int i=0;i<args.length;i++){
                ps.setObject(i+1,args[i]);
            }
            rs = ps.executeQuery();
            while(rs.next()){
                obj = rm.mapRow(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                ps.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return obj;
    }

    /**
     * 通用查询对象方法(查询单行数据)
     * @param sql   执行sql语句
     * @param c     返回提示类的Class对象
     * @param args  SQL中占位符?数据
     * @return
     */
    public static Object queryForObject(String sql,Class c,Object...args){
        Object obj = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtil.getCon();
            ps = con.prepareStatement(sql);
            for(int i=0;i<args.length;i++){
                ps.setObject(i+1,args[i]);
            }
            rs = ps.executeQuery();
            while(rs.next()){
                obj = c.newInstance();
                //获取Class中所有的属性
                Field[] fs = c.getDeclaredFields();
                //循环遍历所有属性对象
                for(Field f : fs){
                    //取消访问修饰符限制
                    f.setAccessible(true);
                    //设置属性值
                    f.set(obj,rs.getObject(f.getName()));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                ps.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return obj;
    }



    /**
     * 通用查询集合方法(查询多行)
     * @param sql
     * @param rm
     * @param args
     * @return
     */
    public static ArrayList queryForList(String sql, RowMapper rm, Object...args){
        ArrayList list = new ArrayList();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtil.getCon();
            ps = con.prepareStatement(sql);
            for(int i=0;i<args.length;i++){
                ps.setObject(i+1,args[i]);
            }
            rs = ps.executeQuery();
            while(rs.next()){
                Object obj = rm.mapRow(rs);
                list.add(obj);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                ps.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
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
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtil.getCon();
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
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    /**
     * 查询返回整数
     * @param sql
     * @param args
     * @return
     */
    public static Object queryForInt(String sql,Object...args){
        int n = 0;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtil.getCon();
            ps = con.prepareStatement(sql);
            for(int i=0;i<args.length;i++){
                ps.setObject(i+1,args[i]);
            }
            rs = ps.executeQuery();
            while(rs.next()){
                n = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                ps.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return n;
    }

    /**
     * 查询返回字符串
     * @param sql
     * @param args
     * @return
     */
    public static Object queryForString(String sql,Object...args){
        String str = "";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtil.getCon();
            ps = con.prepareStatement(sql);
            for(int i=0;i<args.length;i++){
                ps.setObject(i+1,args[i]);
            }
            rs = ps.executeQuery();
            while(rs.next()){
                str = rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                ps.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return str;
    }


}
