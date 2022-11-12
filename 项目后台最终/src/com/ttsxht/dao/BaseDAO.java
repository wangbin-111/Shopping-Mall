package com.ttsxht.dao;


import com.ttsxht.entity.Goods;
import com.ttsxht.util.DBUtil;

import java.lang.reflect.Field;
import java.sql.*;
import java.util.ArrayList;

public class BaseDAO {

    /**
     * 通用新增
     * @param obj 实体类
     */
    public void save(Object obj){

        //反射创建obj的Class对象
        Class c = obj.getClass();
        //"insert into dept(deptno,dname,loc) values(?,?,?)"
        //创建StringBuffer对象
        StringBuffer sql = new StringBuffer();
        //根据类名获取对应的表名com.hc.entity.Dept
        String tableName = c.getName().substring(c.getName().lastIndexOf(".")+1).toLowerCase();
        //新增SQL语句动态拼接
        sql.append("insert into "+tableName+"(");
        //获取类中所有的属性对象数组
        Field[] fs = c.getDeclaredFields();
        //循环拼接插入的属性
        for(Field f : fs){
            sql.append(f.getName()+",");
        }
        //干掉最后一个多拼接的逗号
        sql.deleteCharAt(sql.length()-1);
        sql.append(") values(");
        //拼接占位符?
        for(Field f : fs){
            sql.append("?,");
        }
        //干掉最后一个多拼接的逗号
        sql.deleteCharAt(sql.length()-1);
        //拼接结束)符号
        sql.append(")");
        System.out.println(sql);

        //JDBC操作
        Connection con = null;
        PreparedStatement ps = null;
        try {
            //建立连接
            con = DBUtil.getCon();
            //创建预编译SQL执行对象
            ps = con.prepareStatement(sql.toString());
            //循环设置?占位符数据(索引下标从1开始)
            for(int i=0;i<fs.length;i++){
                //取消访问修饰符限制
                fs[i].setAccessible(true);
                //设置?参数的值
                ps.setObject(i+1 , fs[i].get(obj));
            }
            //执行sql(增删改)语句  返回受影响行数
            ps.executeUpdate();
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
    }

    //"update dept set dname=?,loc=? where deptno=?"
    //dao.update(new Dept(60,"教学部","五一路"),"deptno");

    /**
     * 通用修改
     * @param obj       实体类
     * @param pkname    主键字段名称
     */
    public void update(Object obj,String pkname){
        //反射创建对象的Class
        Class c = obj.getClass();
        //"update dept set dname=?,loc=? where deptno=?"
        //sql拼接
        //创建StringBuffer对象
        StringBuffer sql = new StringBuffer();
        //根据类名获取对应的表名com.hc.entity.Dept
        String tableName = c.getName().substring(c.getName().lastIndexOf(".")+1).toLowerCase();
        sql.append("update "+tableName+" set ");
        //获取所有属性数组
        Field[] fs = c.getDeclaredFields();
        //循环遍历
        for(Field f : fs){
            //拼接set属性 除主键以外其他字段
            if(!f.getName().equals(pkname)){
                sql.append(f.getName()+"=?,");
            }
        }
        //删除多余逗号
        sql.deleteCharAt(sql.length()-1);
        sql.append(" where "+pkname+"=?");
        System.out.println(sql);

        //JDBC操作
        PreparedStatement ps = null;
        Connection con = null;
        try {
            //建立连接
            con = DBUtil.getCon();
            //创建预编译SQL执行对象
            ps = con.prepareStatement(sql.toString());
            //定义问号索引下标
            int index = 1;
            //循环遍历
            for(Field f : fs){
                //取消访问修饰符限制
                f.setAccessible(true);
                //设置?的值,除主键以外其他字段
                if(!f.getName().equals(pkname)){
                    ps.setObject(index++,f.get(obj));
                }
            }
            //获取主键字段属性
            Field f = c.getDeclaredField(pkname);
            //取消访问修饰符限制
            f.setAccessible(true);
            //设置最后一个? 主键的值
            ps.setObject(index, f.get(obj));
            //执行sql(增删改)语句  返回受影响行数
            ps.executeUpdate();
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


    }



    /**
     * 通用删除
     * @param obj       实体类(只需要主键字段的数据)
     * @param pkname    主键字段名称
     */
    public void delete(Object obj,String pkname){
        //反射Class对象
        Class c = obj.getClass();
        //sql拼接//"delete from dept where deptno=?"
        //根据类名获取对应的表名com.hc.entity.Dept
        String tableName = c.getName().substring(c.getName().lastIndexOf(".")+1).toLowerCase();
        StringBuffer sql = new StringBuffer();
        sql.append("delete from "+tableName+" where "+pkname+"=?");

        //JDBC操作
        Connection con = null;
        PreparedStatement ps = null;
        try {
            //建立连接
            con = DBUtil.getCon();
            //创建预编译SQL执行对象
            ps = con.prepareStatement(sql.toString());
            //根据主键名称获取属性对象
            Field f = c.getDeclaredField(pkname);
            //取消访问修饰符限制
            f.setAccessible(true);
            //设置？参数值
            ps.setObject(1 , f.get(obj));
            //执行sql(增删改)语句  返回受影响行数
            ps.executeUpdate();
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
    }

    /**
     * 查询单行数据
     * @param obj
     * @param pkname
     * @return
     */
    public Object get(Object obj,String pkname){
        //反射Class对象
        Class c = obj.getClass();
        //sql拼接
        //创建StringBuffer对象
        StringBuffer sql = new StringBuffer();
        //根据类名获取对应的表名com.hc.entity.Dept
        String tableName = c.getName().substring(c.getName().lastIndexOf(".")+1).toLowerCase();
        sql.append("select ");
        Field[] fs = c.getDeclaredFields();
        for(Field f : fs){
            sql.append(f.getName()+",");
        }
        sql.deleteCharAt(sql.length()-1);
        sql.append(" from "+tableName+" where "+pkname+"=?");
        System.out.println(sql);

        //JDBC操作
        Object result = null;//查询返回对象(单行数据)
        Connection con = null;
        PreparedStatement ps = null;//预编译执行对象
        ResultSet rs = null;//结果集对象
        try {
            //获取连接
            con =DBUtil.getCon();
            ps = con.prepareStatement(sql.toString());
            //获取主键字段属性
            Field f = c.getDeclaredField(pkname);
            //取消访问修饰符限制
            f.setAccessible(true);
            //获取obj对象中的主键属性值设置?的值
            ps.setObject(1 ,f.get(obj));
            rs = ps.executeQuery();
            while(rs.next()){
                //实例化返回结果对象
                result = c.newInstance();
                for(Field field : fs){
                    //取消访问修饰符限制
                    field.setAccessible(true);
                    //绑定属性与表中列的数据
                    field.set(result, rs.getObject(field.getName()));
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
        return result;
    }

    /**
     * 查询表中所有数据
     * @param c
     * @return
     */
    public ArrayList list(Class c){
        //sql拼接
        //创建StringBuffer对象
        StringBuffer sql = new StringBuffer();
        //根据类名获取对应的表名
        String tableName = c.getName().substring(c.getName().lastIndexOf(".")+1).toLowerCase();
        sql.append("select ");
        Field[] fs = c.getDeclaredFields();
        for(Field f : fs){
            sql.append(f.getName()+",");
        }
        sql.deleteCharAt(sql.length()-1);
        sql.append(" from "+tableName);
        System.out.println(sql);

        //JDBC操作
        ArrayList list = new ArrayList();//查询多行保存结果集合
        Connection con = null;
        PreparedStatement ps = null;//预编译执行对象
        ResultSet rs = null;//结果集对象
        try {
            //获取连接
            con =DBUtil.getCon();
            ps = con.prepareStatement(sql.toString());
            rs = ps.executeQuery();
            while(rs.next()){
                //实例化返回结果对象
                Object obj = c.newInstance();
                for(Field field : fs){
                    //取消访问修饰符限制
                    field.setAccessible(true);
                    //绑定属性与表中列的数据
                    field.set(obj, rs.getObject(field.getName()));
                }
                //将对象添加到集合
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
     * 通用分页方法
     * @param c
     * @param page  当前第几页
     * @param size  每页多少行
     * @return
     */
    public ArrayList list(Class c,int page,int size){
        //sql拼接
        //创建StringBuffer对象
        StringBuffer sql = new StringBuffer();
        //根据类名获取对应的表名
        String tableName = c.getName().substring(c.getName().lastIndexOf(".")+1).toLowerCase();
        sql.append("select ");
        Field[] fs = c.getDeclaredFields();
        for(Field f : fs){
            sql.append(f.getName()+",");
        }
        sql.deleteCharAt(sql.length()-1);
        sql.append(" from "+tableName+" limit ?,?");
        System.out.println(sql);

        //JDBC操作
        ArrayList list = new ArrayList();//查询多行保存结果集合
        Connection con = null;
        PreparedStatement ps = null;//预编译执行对象
        ResultSet rs = null;//结果集对象
        try {
            //获取连接
            con =DBUtil.getCon();
            ps = con.prepareStatement(sql.toString());
            ps.setInt(1 ,(page-1)*size);
            ps.setInt(2 , size);
            rs = ps.executeQuery();
            while(rs.next()){
                //实例化返回结果对象
                Object obj = c.newInstance();
                for(Field field : fs){
                    //取消访问修饰符限制
                    field.setAccessible(true);
                    //绑定属性与表中列的数据
                    field.set(obj, rs.getObject(field.getName()));
                }
                //将对象添加到集合
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
     * 统计总页数方法
     * @param tablename     表名
     * @param size          每页多少行
     * @return
     */
    public int getTotal(String tablename,int size){
        String sql = "select count(*) from "+tablename;
        //JDBC操作
        int count = 0;
        Connection con = null;
        PreparedStatement ps = null;//预编译执行对象
        ResultSet rs = null;//结果集对象
        try {
            //获取连接
            con =DBUtil.getCon();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                count = rs.getInt(1);
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
        return count%size==0?count/size:count/size+1;
    }

    //根据主键查关键字方法
    public ArrayList keyWord(Object obj,String searchtype,String keyword){
        Class c = obj.getClass();
        //sql拼接
        //创建StringBuffer对象
        StringBuffer sql = new StringBuffer();
        //根据类名获取对应的表名
        String tableName = c.getName().substring(c.getName().lastIndexOf(".")+1).toLowerCase();
        sql.append("select ");
        Field[] fs = c.getDeclaredFields();
        for(Field f : fs){
            sql.append(f.getName()+",");
        }
        sql.deleteCharAt(sql.length()-1);
        sql.append(" from "+tableName+" where "+ searchtype+" like '%"+keyword+"%'");
        System.out.println(sql);

        //JDBC操作
        Object result = null;
        ArrayList list = new ArrayList();//查询多行保存结果集合
        Connection con = null;
        PreparedStatement ps = null;//预编译执行对象
        ResultSet rs = null;//结果集对象
        try {
            //获取连接
            con =DBUtil.getCon();
            ps = con.prepareStatement(sql.toString());
            rs = ps.executeQuery();
            while(rs.next()){
                //实例化返回结果对象
                 result = c.newInstance();
                for(Field field : fs){
                    //取消访问修饰符限制
                    field.setAccessible(true);
                    //绑定属性与表中列的数据
                    field.set(result, rs.getObject(field.getName()));
                }
                //将对象添加到集合
                list.add(result);
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
}
