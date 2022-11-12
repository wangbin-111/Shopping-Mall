package com.SC.Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;


public abstract class BaseServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            //处理请求执行的方法名称
            String method = req.getParameter("method");
            if(method==null){
                method = "execute";
            }
            //反射创建BaseServlet子类的class对象
            Class c = this.getClass();
            //获取要执行方法对象
            Method m = c.getDeclaredMethod(method,HttpServletRequest.class,HttpServletResponse.class);
            //执行方法
            String url = (String) m.invoke(c.newInstance(), req, resp);
            //根据url判断跳转模式(转发/重定向)
            if(url.indexOf(":")!=-1){
                if(url.startsWith("redirect")){//重定向
                    resp.sendRedirect(url.substring(url.indexOf(":")+1));
                }else if(url.startsWith("forward")){//转发
                    req.getRequestDispatcher(url.substring(url.indexOf(":")+1)).forward(req,resp);
                }else{
                    //转发(默认)
                    req.getRequestDispatcher(url.substring(url.indexOf(":")+1)).forward(req,resp);
                }
            }else{
                //转发(默认)
                req.getRequestDispatcher(url).forward(req,resp);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public abstract String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception;


}
