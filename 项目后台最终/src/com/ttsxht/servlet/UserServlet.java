package com.ttsxht.servlet;

import com.ttsxht.dao.UserDAO;
import com.ttsxht.entity.User;
import com.ttsxht.util.BeanUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

@WebServlet("/user")
public class UserServlet extends BaseServlet {

    private UserDAO userDAO = new UserDAO();

    //查询
    public String show(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        ArrayList<User> userlist = userDAO.list(User.class);
        req.setAttribute("userlist",userlist);
        req.setAttribute("msg","ok");
        return "user_list.jsp";
    }


    //新增
    public String save(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        userDAO.save(BeanUtil.beanCopy(req, User.class));
        return "redirect:user?method=show";
    }

    //删除
    public String delete(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        System.out.println(req.getParameter("u_id"));
        userDAO.delete(new User(Integer.parseInt(req.getParameter("u_id"))),"u_id");
        return "redirect:user?method=show";
    }
//
    //初始化修改
    public String init(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        req.setAttribute("u",userDAO.get(new User(Integer.parseInt(req.getParameter("id"))),"u_id"));
        return "user_update.jsp";
    }

    //修改
    public String update(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        userDAO.update(BeanUtil.beanCopy(req, User.class),"u_id");
        return "redirect:user?method=show";
    }

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        return null;
    }
}
