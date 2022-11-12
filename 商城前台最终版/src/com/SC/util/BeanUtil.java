package com.SC.util;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Field;
import java.sql.Date;
import java.util.Enumeration;

public class BeanUtil {


    /**
     * 从请求对象中获取数据绑定到实体类entity中
     * @param request
     * @param c
     * @return
     */
    public static Object beanCopy(HttpServletRequest request,Class c){
        try {
            //反射实例化对象
            Object obj = c.newInstance();
            //获取所有标签name属性的值
            Enumeration en = request.getParameterNames();
            //循环遍历
            while(en.hasMoreElements()){
                //获取表单name属性值(等同于实体类中的属性名称)
                String name = en.nextElement().toString();
                //获取表单name属性对应的数据value
                String[] value = request.getParameterValues(name);
                //根据name获取实体类中属性对象
                Field f = c.getDeclaredField(name);
                //取消访问修饰符限制
                f.setAccessible(true);
                //name属性只有一个值的情况
                if(value.length==1){
                    //根据不同数据类型设置实体类中属性的值
                    if(f.getType().equals(String.class)){
                        f.set(obj , value[0]);
                    }else if(f.getType().equals(Integer.class)||f.getType().equals(int.class)){
                        f.set(obj, Integer.parseInt(value[0]));
                    }else if(f.getType().equals(Double.class)||f.getType().equals(double.class)){
                        f.set(obj, Double.parseDouble(value[0]));
                    }else if(f.getType().equals(Float.class)||f.getType().equals(float.class)){
                        f.set(obj, Float.parseFloat(value[0]));
                    }else if(f.getType().equals(Date.class)){
                        f.set(obj ,Date.valueOf(value[0]));
                    }
                }else{//name属性有多个值
                    StringBuffer sb = new StringBuffer();
                    for(String s : value){
                        sb.append(s+",");
                    }
                    sb.deleteCharAt(sb.length()-1);
                    f.set(obj , sb.toString());
                }




            }
            return obj;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
