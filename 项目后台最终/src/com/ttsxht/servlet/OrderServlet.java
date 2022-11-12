package com.ttsxht.servlet;

import com.ttsxht.dao.OrderDAO;
import com.ttsxht.entity.Orders_sj;
import com.ttsxht.entity.Ship_address;
import com.ttsxht.util.DBUtil;
import com.ttsxht.vo.OrderSystemVO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

@WebServlet("/order")
public class OrderServlet extends BaseServlet{

        @Override
        public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
            return null;
        }

        private OrderDAO orderDAO = new OrderDAO();

        //查询数据库
        public String show(HttpServletRequest req, HttpServletResponse resp) throws Exception {
            String sql="select a.order_id,a.date,a.count,a.allmoney,a.fastmail,a.paytype,a.type,a.state,b.g_name,c.ship_address,c.ship_name,c.ship_num from orders_sj a,goods b,ship_address c,state d where a.g_id=b.g_id and a.u_id=c.u_id and a.state=d.state";
            ArrayList<OrderSystemVO>  List = DBUtil.queryForList(sql,OrderSystemVO.class);

           req.setAttribute("niubi",List);
            return "order_list.jsp";
        }

    //初始化修改
    public String init(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String order_id = req.getParameter("order_id");

        Orders_sj orders_sj = (Orders_sj) orderDAO.get(new Orders_sj(Integer.parseInt(order_id)),"order_id");



        Ship_address ship = (Ship_address) orderDAO.get(new Ship_address(orders_sj.getShip_id()), "ship_id");



        req.setAttribute("ship_id",orders_sj.getShip_id());

        req.setAttribute("order_id",order_id);

        req.setAttribute("da",ship.getShip_da());

        req.setAttribute("address",ship.getShip_address());
        req.setAttribute("state",orders_sj.getState());
//        req.setAttribute("sta",sta);

        return "order_update.jsp";
    }
    //修改
    public String update(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String ship_id = req.getParameter("ship_id");

        String order_id = req.getParameter("order_id");
        String sheng = req.getParameter("sheng");
        String shi = req.getParameter("shi");
        String qu = req.getParameter("qu");
        String da = req.getParameter("da");

        String state = req.getParameter("state");

        String address =sheng+"-"+shi+"-"+qu;
        Orders_sj order= (Orders_sj) orderDAO.get(new Orders_sj(Integer.parseInt(order_id)), "order_id");
        order.setState(state);
        orderDAO.update(order,"order_id");

        Ship_address ship = (Ship_address) orderDAO.get(new Ship_address(Integer.parseInt(ship_id)), "ship_id");
        ship.setShip_address(address);
        ship.setShip_da(da);
        orderDAO.update(ship,"ship_id");

        return "redirect:order?method=show";
    }


}
