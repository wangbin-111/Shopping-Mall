package com.ttsxht.servlet;

import com.ttsxht.dao.AdmiUserDAO;
import com.ttsxht.entity.AdmiUser;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/admi")
public class AdmiUserServlet extends BaseServlet{
    AdmiUserDAO admiUserDAO = new AdmiUserDAO();
    AdmiUser admiUser = null;
    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        return null;
    }
    public String login(HttpServletRequest req,HttpServletResponse resp) throws Exception{
        String admiusername=req.getParameter("admiusername");
        String admipassword=req.getParameter("admipassword");
        String captcha=req.getParameter("captcha");
        String check=req.getParameter("check");
       admiUser = (AdmiUser) admiUserDAO.get(new AdmiUser(admiusername),"admiusername");
       if(admipassword.equals(admiUser.getAdmipassword())&&captcha.equals(check)&&check.length()!=0){
           req.setAttribute("msg","欢迎来到向日葵杂货铺后台管理系统");
           return "index";
       }else {
           if(!admipassword.equals(admiUser.getAdmipassword())){
               req.setAttribute("msg","用户名或密码输入错误");
               return "login.jsp";
           }else{
               req.setAttribute("msg","验证码输入错误");
               return "login.jsp";
           }
       }
    }
}
