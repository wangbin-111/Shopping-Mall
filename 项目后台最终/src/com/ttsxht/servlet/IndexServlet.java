package com.ttsxht.servlet;

import com.ttsxht.dao.BaseDAO;
import com.ttsxht.entity.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/index")
public class IndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        BaseDAO dao = new BaseDAO();
//商品总数
        ArrayList goodlist = dao.list(Goods.class);
//        用户总数
        ArrayList userlist = dao.list(User.class);
//订单总数
        ArrayList<Orders_sj> orderlist = dao.list(Orders_sj.class);
//        总价
        double allMoney=0;
//        订单总价
        for(Orders_sj o:orderlist){
            allMoney+=o.getAllmoney();
        }
//        展示订单
        ArrayList<OrderInfo> orderInfoList=new ArrayList<>();

        for(Orders_sj o:orderlist){
            User use = (User) dao.get(new User(o.getU_id()), "u_id");
            Ship_address ship = (Ship_address) dao.get(new Ship_address(o.getShip_id()), "ship_id");
            OrderInfo orderInfo = new OrderInfo(o.getOrder_id(), o.getOrdernum(), use.name, ship.getShip_num(), o.getDate(), (ship.getShip_address() + ship.getShip_da()), o.getState());
            orderInfoList.add(orderInfo);
        }


        req.setAttribute("userSum",userlist.size());
        req.setAttribute("goodsSum",goodlist.size());
        req.setAttribute("ordersssSum",orderlist.size());
        req.setAttribute("priceSum",allMoney);
        req.setAttribute("orderInfoList",orderInfoList);
        req.getRequestDispatcher("indexMainPage.jsp").forward(req,resp);
    }
}
