package com.SC.Servlet;

import com.SC.lei.*;
import com.SC.util.DBUtil;
import com.SC.util.GoodsDao;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Random;



@WebServlet("/goods")
public class GoodsServlet extends BaseServlet {
    private GoodsDao dao = new GoodsDao();
    private Random random = new Random();

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        return null;
    }



    //    进去详情界面  推荐  商品评价

    public String showInfo(HttpServletRequest req, HttpServletResponse resp) {

        String g_id = req.getParameter("g_id");

        if(req.getSession().getAttribute("good")!=null){
            req.getSession().removeAttribute("good");
        }
//        点击之后+热度
        Goods good = (Goods) dao.get(new Goods(Integer.parseInt(g_id)), "g_id");
        good.setG_hot(good.getG_hot()+1);
        dao.update(good,"g_id");
//         根据商品类型推荐热度高的

//        此商品的类型
        String g_bigtype = good.getG_bigtype();

        ArrayList<Goods> tuijianGood = dao.listType(Goods.class, "g_bigtype", g_bigtype);

        tuijianGood.sort(new Comparator<Goods>() {
            @Override
            public int compare(Goods o1, Goods o2) {
                int num= o1.getG_hot();
                int num2= o2.getG_hot();

                return num2-num;
            }
        });

//        商品评价此商品
//        String sql="select g_id evaluate,e_url,grade,headimg,name from evaluates e INNER JOIN user u on e.u_id=u.u_id";
//        ArrayList<showSPPJ> arrayList = DBUtil.queryForList(sql,showSPPJ.class);
//        System.out.println(arrayList.size());
//        商品id
        
        String g_id1 = Integer.toString(good.getG_id());
        
        ArrayList<evaluates> pjlist = dao.list(evaluates.class);

        ArrayList<evaluates>  pjlist2=new ArrayList<>();
        for(evaluates e:pjlist){
            if(e.getG_id().contains(",")){
                String[] gid = e.getG_id().split(",");
                for (int i = 0; i <gid.length; i++) {
                    if(gid[i].equals(g_id1)){
                        pjlist2.add(e);
                    }
                }
            }else{
                if(e.getG_id().equals(g_id1)){
                        pjlist2.add(e);
                }
            }
        }
//该商品的所有评价
//        pjlist2
//        评价展示数据的集合
        ArrayList<showSPPJ> pjZslist = new ArrayList<>();

        for(evaluates ee:pjlist2){
            user u_id = (user) dao.get(new user(ee.getU_id()), "u_id");
            showSPPJ showSPPJ = new showSPPJ(ee.getEvaluate(), ee.getE_url(), ee.getGrade(), u_id.getHeadimg(), u_id.getName());
            pjZslist.add(showSPPJ);
        }

//        返回评价展示
        req.setAttribute("pjZslist",pjZslist);

//        返回推荐商品
        req.setAttribute("tuijianGood",tuijianGood);

        req.getSession().setAttribute("good", good);

        return "proDetail.jsp";

    }

    //    通过商品详情购买，和购物车购买
    public String buyGood(HttpServletRequest req, HttpServletResponse resp) {
//    多个商品的id用，隔开
        String g_id = req.getParameter("g_id");

        String c_type = req.getParameter("c_type");

        String c_id = req.getParameter("c_id");

        String count = req.getParameter("count");

        String u_name = req.getParameter("u_name");
        //获取用户id
        String id = req.getParameter("id");
//        System.out.println(id.equals(""));
        if(id.equals("")){
            return "redirect:/order.jsp";

        }

        if(u_name!=null){
        if(u_name.equals("")){
            req.setAttribute("msg1","请先完善个人信息~~");
            return "mygrxx.jsp";
        }
      }


        ArrayList<CartInfo> cartInfosList = new ArrayList<>();
        if (c_id != null) {
            if (c_id.contains(",")) {

                String[] split = g_id.split(",");
                String[] cid = c_id.split(",");
                String[] ctype = c_type.split(",");
                for (int i = 0; i < split.length; i++) {

                    Goods good = (Goods) dao.get(new Goods(Integer.parseInt(split[i].trim())), "g_id");

                    CartInfo cartInfo = new CartInfo(Integer.parseInt(cid[i].trim()), ctype[i].trim(), Integer.parseInt(count.split(",")[i].trim()), good);

                    cartInfosList.add(cartInfo);
                }
            }else {
                Goods good = (Goods) dao.get(new Goods(Integer.parseInt(g_id)), "g_id");
                CartInfo cartInfo = new CartInfo(Integer.parseInt(c_id),c_type, Integer.parseInt(count), good);
                cartInfosList.add(cartInfo);
            }
        }else{
            Goods good = (Goods) dao.get(new Goods(Integer.parseInt(g_id)), "g_id");
            CartInfo cartInfo = new CartInfo(0, c_type,Integer.parseInt(count), good);
            cartInfosList.add(cartInfo);;
        }
        //       获取用户表信息
        ArrayList<ship_address> Slist1 = dao.list(ship_address.class);
        ArrayList<ship_address> Slist = new ArrayList<>();

        for (ship_address s : Slist1) {
            if (s.getU_id() == Integer.parseInt(id)) {
                Slist.add(s);
            }
        }
//        防止后台数据库没有地址信息的时候前端一直发送请求
        req.setAttribute("Slist", Slist);

//       订单展示商品集合
        req.getSession().setAttribute("cartInfosList", cartInfosList);

        return "order.jsp";
    }


    //    加入购物车
    public String addCart(HttpServletRequest req, HttpServletResponse resp) {
        String u_id = req.getParameter("id");

        if(u_id.equals("")){
            return "redirect:/order.jsp";
        }
        String g_id = req.getParameter("g_id");
        String count = req.getParameter("count");
        String c_type=req.getParameter("c_type");
        dao.save(new cart(Integer.parseInt(count), Integer.parseInt(g_id), Integer.parseInt(u_id),c_type));

        return "cart.jsp";
    }


    //        购物车删除商品
    public String deleteCart(HttpServletRequest req, HttpServletResponse resp) {
        String c_id = req.getParameter("c_id");
//        用户id
        String id = req.getParameter("u_id");
        if (c_id.contains(",")) {
            String[] split = c_id.split(",");
            for (String s : split) {
                dao.delete(new cart(Integer.parseInt(s)), "c_id");

            }

        } else {
            dao.delete(new cart(Integer.parseInt(c_id)), "c_id");

        }
        ArrayList<cart> list = dao.list(cart.class);
        ArrayList<CartInfo> cartList = new ArrayList<>();

        for (cart c : list) {
            if (c.getU_id() == Integer.parseInt(id)) {
                Goods good = (Goods) dao.get(new Goods(c.getG_id()), "g_id");
                new CartInfo(c.getC_id(),c.getC_type(), c.getC_count(), good);
                cartList.add(new CartInfo(c.getC_id(),c.getC_type(), c.getC_count(), good));
            }
        }


        req.setAttribute("cartList", cartList);

        return "cart.jsp";

    }


    //    产生订单
    public String addOrder(HttpServletRequest req, HttpServletResponse resp) {
        String u_id = req.getParameter("u_id");
        String g_id = req.getParameter("g_id");

//        商品类型
        String c_type = req.getParameter("c_type");
        String ship_id = req.getParameter("ship_id");
        String paytype = req.getParameter("paytype");
        String fastmail = req.getParameter("fastmail");
        String count = req.getParameter("count");
        String money = req.getParameter("money");
        String date = req.getParameter("date");
        int l1 = random.nextInt(900) + 100;
        int l2 = random.nextInt(89999) + 10000;
        int ordernum = l1 + l2;

//        如果时从购物车进去  获取购物车信息id
        String c_id = req.getParameter("c_id");

//        判断订单号是否唯一
        while (true) {
            ArrayList<orders> list = dao.list(orders.class);
//            list不为空
            if (!list.isEmpty()) {
                boolean flag = false;
                for (orders o : list) {
                    if (o.getOrdernum().equals(Integer.toString(ordernum))) {
                        flag = true;
                        break;
                    }
                }
                if (flag) {
                    l1 = random.nextInt(900) + 100;
                    l2 = random.nextInt(89999) + 10000;
                    ordernum = l1 + l2;
                } else {
                    break;
                }
            } else {
                break;
            }

        }
//        添加到数据库
        if (!c_id.equals("")) {
            if (c_id.contains(",")) {
                String[] cid = c_id.split(",");
//                String[] ctype = c_type.split(",");

                for (int i = 0; i < cid.length; i++) {
//                    结算之后删除购物车的商品
                    dao.delete(new cart(Integer.parseInt(cid[i])), "c_id");
                }
            } else {
                dao.delete(new cart(Integer.parseInt(c_id)), "c_id");
            }
        }

        dao.save(new orders(Integer.parseInt(u_id), g_id, date, Integer.toString(ordernum), "1", Integer.parseInt(ship_id), fastmail, paytype, count, Double.parseDouble(money),c_type));
        dao.save(new orders_sj(Integer.parseInt(u_id), g_id, date, Integer.toString(ordernum), "1", Integer.parseInt(ship_id), fastmail, paytype, count, Double.parseDouble(money),c_type));

        return "ok.jsp";

    }
//    展示订单
        public String showOrder(HttpServletRequest req, HttpServletResponse resp) {
            String u_id = req.getParameter("u_id");

//            获取页数
            String page=req.getParameter("page");

            if(req.getSession().getAttribute("orderList")!=null){
                req.getSession().removeAttribute("orderList");
            }
//            用户所有的订单
            ArrayList<orders> orderList2 = dao.list(orders.class);

            ArrayList<orders> orderList1 = dao.list2(orders.class, "u_id", u_id, Integer.parseInt(page), 4);

//            返回订单展示的集合
            ArrayList<orderInfo> orderList=new ArrayList<>();

            orderList2.removeIf(c -> c.getU_id() != Integer.parseInt(u_id));

//            商品集合 和数量集合 类型集合
            ArrayList<Goods> g=null;
            ArrayList<Integer> c=null;
            ArrayList<String> t=null;

            for(orders o:orderList1){
                if(o.getG_id().contains(",")){
                    g=new ArrayList<>();
                    c=new ArrayList<>();
                    t=new ArrayList<>();
                    String[] g_id = o.getG_id().split(",");
                    String[] count = o.getCount().split(",");
                    System.out.println(o.getType());
                    String[] type = o.getType().split(",");

                    for (int i = 0; i < g_id.length; i++) {
                        Goods good = (Goods) dao.get(new Goods(Integer.parseInt(g_id[i])), "g_id");
                        c.add(Integer.parseInt(count[i]));
                        t.add(type[i]);
                        g.add(good);
                    }
                    orderInfo orderInfo = new orderInfo(o, g, c,t);
                    orderList.add(orderInfo);
                }else {
                    g=new ArrayList<>();
                    c=new ArrayList<>();
                    t=new ArrayList<>();

                    Goods good = (Goods) dao.get(new Goods(Integer.parseInt(o.getG_id())), "g_id");
                        c.add(Integer.parseInt(o.getCount()));
                        g.add(good);
                        t.add(o.getType());
                    orderInfo orderInfo = new orderInfo(o, g, c,t);
                    orderList.add(orderInfo);
                }
            }
//            返回页码数
            req.setAttribute("allpage",(orderList2.size()%4)==0? (orderList2.size()/4):(orderList2.size()/4+1));
//            返回当前页数
            req.setAttribute("page",page);


            req.getSession().setAttribute("orderList2",orderList2);

            req.getSession().setAttribute("orderList",orderList);
            req.setAttribute("orderList",orderList);
            req.setAttribute("msg","ok");
            return "myorderq.jsp";
        }
//        展示待收货订单
public String showDai(HttpServletRequest req, HttpServletResponse resp) {

    ArrayList<orderInfo> orderList=new ArrayList<>();

    ArrayList<orders> orderList2 = (ArrayList<orders>) req.getSession().getAttribute("orderList2");
    ArrayList<Goods> g=null;
    ArrayList<Integer> c=null;
    ArrayList<String> t=null;

    for(orders o:orderList2){
       if(o.getState().equals("1")){
           if(o.getG_id().contains(",")){
               g=new ArrayList<>();
               c=new ArrayList<>();
               t=new ArrayList<>();
               String[] g_id = o.getG_id().split(",");
               String[] count = o.getCount().split(",");
               System.out.println(o.getType());
               String[] type = o.getType().split(",");

               for (int i = 0; i < g_id.length; i++) {
                   Goods good = (Goods) dao.get(new Goods(Integer.parseInt(g_id[i])), "g_id");
                   c.add(Integer.parseInt(count[i]));
                   t.add(type[i]);
                   g.add(good);
               }
               orderInfo orderInfo = new orderInfo(o, g, c,t);
               orderList.add(orderInfo);
           }else {
               g=new ArrayList<>();
               c=new ArrayList<>();
               t=new ArrayList<>();

               Goods good = (Goods) dao.get(new Goods(Integer.parseInt(o.getG_id())), "g_id");
               c.add(Integer.parseInt(o.getCount()));
               g.add(good);
               t.add(o.getType());
               orderInfo orderInfo = new orderInfo(o, g, c,t);
               orderList.add(orderInfo);
           }
       }
    }
    req.setAttribute("msg","ok");

    req.setAttribute("orderList",orderList);
    return "myorderq.jsp";

}
//展示订单数量界面

    public String showOrderCount(HttpServletRequest req, HttpServletResponse resp) {
        String u_id = req.getParameter("u_id");
//            用户所有的订单
        ArrayList<orders> orderList2 = dao.list(orders.class);

        ArrayList<orders> orderListdai = new ArrayList<>();
        ArrayList<orders> orderListyi =new ArrayList<>();

        orderList2.removeIf(c -> c.getU_id() != Integer.parseInt(u_id));


        for(orders o:orderList2){
            if(o.getState().equals("1")){
                orderListdai.add(o);
            }

            if(o.getState().equals("2")){
                orderListyi.add(o);
            }
        }
//        待收货数量
        req.setAttribute("daicount",orderListdai.size());
        //        已收货数量
        req.setAttribute("yicount",orderListyi.size());
//        该用户所有订单
        req.getSession().setAttribute("orderList2",orderList2);

        req.setAttribute("msg","ok");
        return "mygxin.jsp";
    }


//        展示已收货订单
    public String showYi(HttpServletRequest req, HttpServletResponse resp) {

    ArrayList<orderInfo> orderList=new ArrayList<>();

    ArrayList<orders> orderList2 = (ArrayList<orders>) req.getSession().getAttribute("orderList2");
    ArrayList<Goods> g=null;
    ArrayList<Integer> c=null;
    ArrayList<String> t=null;

    for(orders o:orderList2){
        if(o.getState().equals("2")){
            if(o.getG_id().contains(",")){
                g=new ArrayList<>();
                c=new ArrayList<>();
                t=new ArrayList<>();
                String[] g_id = o.getG_id().split(",");
                String[] count = o.getCount().split(",");
                System.out.println(o.getType());
                String[] type = o.getType().split(",");

                for (int i = 0; i < g_id.length; i++) {
                    Goods good = (Goods) dao.get(new Goods(Integer.parseInt(g_id[i])), "g_id");
                    c.add(Integer.parseInt(count[i]));
                    t.add(type[i]);
                    g.add(good);
                }
                orderInfo orderInfo = new orderInfo(o, g, c,t);
                orderList.add(orderInfo);
            }else {
                g=new ArrayList<>();
                c=new ArrayList<>();
                t=new ArrayList<>();

                Goods good = (Goods) dao.get(new Goods(Integer.parseInt(o.getG_id())), "g_id");
                c.add(Integer.parseInt(o.getCount()));
                g.add(good);
                t.add(o.getType());
                orderInfo orderInfo = new orderInfo(o, g, c,t);
                orderList.add(orderInfo);
            }
        }
    }
    req.setAttribute("msg","ok");

    req.setAttribute("orderList",orderList);
    return "myorderq.jsp";

}


    //    确认收货 改变订单状态
    public String updateState(HttpServletRequest req, HttpServletResponse resp) {
        String o_id = req.getParameter("o_id");

        ArrayList<orders> orderList2 = (ArrayList<orders>) req.getSession().getAttribute("orderList2");

//            获取页数
        String page=req.getParameter("page");

        ArrayList<orderInfo> orderList = (ArrayList<orderInfo>) req.getSession().getAttribute("orderList");

//        改变数据库中的状态
        orders order = (orders) dao.get(new orders(Integer.parseInt(o_id)), "order_id");
        order.setState("2");
        dao.update(order,"order_id");
        orders_sj orders_sj = (orders_sj) dao.get(new orders_sj(Integer.parseInt(o_id)), "order_id");
        orders_sj.setState("2");
        dao.update(orders_sj,"order_id");
        for(orderInfo o:orderList){
            if(o.getOrders().getOrder_id()==Integer.parseInt(o_id)){
                o.getOrders().setState("2");
            }
        }
//        req.getSession().setAttribute("orderList",orderList);
        req.setAttribute("orderList",orderList);

//            返回页码数
        req.setAttribute("allpage",(orderList2.size()%4)==0? (orderList2.size()/4):(orderList2.size()/4+1));
//            返回当前页数
        req.setAttribute("Page",page);

        req.setAttribute("msg","ok");
        return "myorderq.jsp";
    }

//    展示订单详细

    public String showDetail(HttpServletRequest req, HttpServletResponse resp) {
        String o_id = req.getParameter("o_id");

        orders o = (orders) dao.get(new orders(Integer.parseInt(o_id)), "order_id");

        ship_address ship = (ship_address) dao.get(new ship_address(o.getShip_id()), "ship_id");

//            商品集合 和数量集合
        ArrayList<Goods> g=null;
        ArrayList<Integer> c=null;
        ArrayList<String> t=null;
        orderInfo orderInfo=null;
        if(o.getG_id().contains(",")){
            g=new ArrayList<>();
            c=new ArrayList<>();
            t=new ArrayList<>();

            String[] g_id = o.getG_id().split(",");
            String[] count = o.getCount().split(",");
            String[] type = o.getType().split(",");

            for (int i = 0; i < g_id.length; i++) {
                Goods good = (Goods) dao.get(new Goods(Integer.parseInt(g_id[i])), "g_id");
                c.add(Integer.parseInt(count[i]));
                t.add(type[i]);
                g.add(good);
            }
            orderInfo = new orderInfo(o, g, c,t);
        }else {
            g=new ArrayList<>();
            c=new ArrayList<>();
            t=new ArrayList<>();

            Goods good = (Goods) dao.get(new Goods(Integer.parseInt(o.getG_id())), "g_id");
            c.add(Integer.parseInt(o.getCount()));
            g.add(good);
            t.add(o.getType());
            orderInfo = new orderInfo(o, g, c,t);
        }


        req.setAttribute("ship",ship);
        req.setAttribute("orderInfo",orderInfo);

        return "orderxq.jsp";
    }
//删除单个订单记录

    public String deleteDD(HttpServletRequest req, HttpServletResponse resp){
        String page = req.getParameter("page");
        String order_id=req.getParameter("order_id");
        if(page==null) {
            page = "1";
        }

        dao.delete(new orders(Integer.parseInt(order_id)),"order_id");

        req.setAttribute("page",page);
        return "myorderq.jsp";
    }

//去评价
public String pingjia(HttpServletRequest req, HttpServletResponse resp){
    String o_id = req.getParameter("o_id");

//    改变订单状态
    orders order1 = (orders) dao.get(new orders(Integer.parseInt(o_id)), "order_id");
    order1.setState("3");
    dao.update(order1,"order_id");
    orders_sj orders_sj = (orders_sj) dao.get(new orders_sj(Integer.parseInt(o_id)), "order_id");
    orders_sj.setState("3");
    dao.update(orders_sj,"order_id");

//    获取订单
    orders order = (orders) dao.get(new orders(Integer.parseInt(o_id)), "order_id");

    ArrayList<Goods> goodd=null;
    if(order.getG_id().contains(",")){
        goodd=new ArrayList<>();
        String[] grd = order.getG_id().split(",");
        for (int i = 0; i < grd.length; i++) {
//            查找商品
            Goods g= (Goods) dao.get(new Goods(Integer.parseInt(grd[i])), "g_id");
            goodd.add(g);
        }

    }else{
        goodd=new ArrayList<>();
//            查找商品
        System.out.println(order.getG_id()+"商品id");
            Goods g= (Goods) dao.get(new Goods(Integer.parseInt(order.getG_id())), "g_id");
        System.out.println(g);
//        System.out.println(g.getG_name());
            goodd.add(g);
    }

    System.out.println(goodd.size());

    req.setAttribute("gooddlist",goodd);
//    传递订单id
    req.setAttribute("o_id",o_id);
    return "pingjia.jsp";
}

//产生评价
public String addPingjia(HttpServletRequest req, HttpServletResponse resp) throws Exception {

    boolean multipartContent = ServletFileUpload.isMultipartContent(req);

    if (multipartContent) {
//                创建工厂
        DiskFileItemFactory factory = new DiskFileItemFactory(1024 * 1024, new File("/"));

//                创建文件上传解析器
        ServletFileUpload fileUpload = new ServletFileUpload(factory);

//        图片地址的集合
        ArrayList<String> img=new ArrayList<>();
//        非文件
        ArrayList<String> fwj=new ArrayList<>();


        List<FileItem> list = fileUpload.parseRequest(req);
        for (FileItem l : list) {
            if (!l.isFormField()) {
                String realPath = req.getRealPath("/");

                File file = new File(realPath + "/img/pingjia");

                if (!file.exists()) {
                    file.mkdirs();
                }
                String name = l.getName();
                if(name==null|name.equals("")){
                    continue;
                }
                File url = new File(file, name);
                if (!url.exists()) {
                    url.createNewFile();
                }
//          数据库储存的路径
                String pingjiaimg = "img/pingjia/" + name;
//          图片地址加入数据库
                img.add(pingjiaimg);

                l.write(url);
//                    删除临时文件
                l.delete();
            }else{
                String feiwenjian = l.getString("utf-8");
                fwj.add(feiwenjian);
            }

        }
//插入数据库
//        拼接图片地址

        String imgurl="";
        String g_id="";

//        标识是否上传了图片
        boolean flag=false;
        for (int i = 0; i <img.size() ; i++) {
            imgurl+=img.get(i)+",";
            flag=true;
//
        }
//        用户id
        String u_id=fwj.get(0);
//        评价类型
        String grade=fwj.get(1);
        String o_id=fwj.get(2);

        for (int i = 3; i <fwj.size()-1 ; i++) {
            g_id+=fwj.get(i)+",";
        }
//        评价内容
        String evaluate=fwj.get(fwj.size()-1);
//      图片路径
        String imgurl2= !flag ? "":imgurl.substring(0,imgurl.length()-1);

        evaluates evaluates = new evaluates(Integer.parseInt(o_id), evaluate, Integer.parseInt(u_id), imgurl2, grade, g_id.substring(0,g_id.length()-1));
        dao.save(evaluates);

    }

        return "myorderq.jsp";
}



    //    李兵代码
//调取数码产品页面的数据方法
public String findAll(HttpServletRequest req, HttpServletResponse resp){
    String page = req.getParameter("page");
    if(page==null) {
        page = "1";
    }
    ArrayList<Goods> goodsList = dao.list2(Goods.class,"g_bigtype","1",Integer.parseInt(page),8);
    System.out.println(goodsList.size());
    req.setAttribute("goodsList",goodsList);

    req.setAttribute("msg","ok");
    req.setAttribute("page",page);
    return "flowerDer.jsp";
}

    //调取潮服安利页面的数据方法
    public String findAll1(HttpServletRequest req, HttpServletResponse resp){
        String page = req.getParameter("page");
        ArrayList<Goods> goodsList = dao.list2(Goods.class,"g_bigtype","2",Integer.parseInt(page),8);
        System.out.println(goodsList.size());
        req.setAttribute("goodsList",goodsList);

        req.setAttribute("page",page);
        return "decoration.jsp";
    }

//    零食饮料展示
    public String findBigua(HttpServletRequest req, HttpServletResponse resp){

        ArrayList<Goods> goodsList = dao.list(Goods.class);

//        现代
        ArrayList<Goods> xdgoodsList = new ArrayList<>();
//        欧式
        ArrayList<Goods> osgoodsList = new ArrayList<>();
//        美式
        ArrayList<Goods> msgoodsList = new ArrayList<>();
//        中式
        ArrayList<Goods> zsgoodsList = new ArrayList<>();

//        筛选所有
        goodsList.removeIf(g -> !g.getG_bigtype().equals("3"));

        System.out.println(goodsList.size()+"总");
        for (Goods g:goodsList){
            if(g.getG_smalltype().equals("6")){
                xdgoodsList.add(g);
            }else if(g.getG_smalltype().equals("8")){
                osgoodsList.add(g);
            }else if(g.getG_smalltype().equals("7")){
                msgoodsList.add(g);
            }else if(g.getG_smalltype().equals("9")){
                zsgoodsList.add(g);
            }
        }
//        System.out.println(xdgoodsList.size()+"xx式");
//
//        System.out.println(osgoodsList.size()+"欧式");
//        System.out.println(msgoodsList.size()+"欧式1");
//        System.out.println(zsgoodsList.size()+"欧式2");

        req.setAttribute("xdgoodsList",xdgoodsList);
        req.setAttribute("osgoodsList",osgoodsList);
        req.setAttribute("msgoodsList",msgoodsList);
        req.setAttribute("zsgoodsList",zsgoodsList);
        req.setAttribute("msg","ok");
        return "paint.jsp";
    }

    //    香薰页面展示
    public String findXX(HttpServletRequest req, HttpServletResponse resp){

        ArrayList<Goods> goodsList = dao.list(Goods.class);

//        复古
        ArrayList<Goods> fgoodsList = new ArrayList<>();
//        精油
        ArrayList<Goods> jgoodsList = new ArrayList<>();


//        筛选所有香薰
        goodsList.removeIf(g -> !g.getG_bigtype().equals("4"));

        for (Goods g:goodsList){
            if(g.getG_smalltype().equals("10")){
                fgoodsList.add(g);
            }else if(g.getG_smalltype().equals("11")){
                jgoodsList.add(g);
            }
        }
        req.setAttribute("fgoodsList",fgoodsList);
        req.setAttribute("jgoodsList",jgoodsList);
        req.setAttribute("msg","ok");
        return "perfume.jsp";
    }
    //    美妆展示
    public String findJJ(HttpServletRequest req, HttpServletResponse resp){

        ArrayList<Goods> goodsList = dao.list(Goods.class);

//        彩妆
        ArrayList<Goods> cygoodsList = new ArrayList<>();
//        护肤
        ArrayList<Goods> fggoodsList = new ArrayList<>();
//        香水
        ArrayList<Goods> shgoodsList = new ArrayList<>();
//        筛选所有
        goodsList.removeIf(g -> !g.getG_bigtype().equals("5"));

        for (Goods g:goodsList){
            if(g.getG_smalltype().equals("13")){
                cygoodsList.add(g);
            }else if(g.getG_smalltype().equals("12")){
                fggoodsList.add(g);
            }else if(g.getG_smalltype().equals("14")){
                shgoodsList.add(g);
            }
        }
        req.setAttribute("cygoodsList",cygoodsList);
        req.setAttribute("fggoodsList",fggoodsList);
        req.setAttribute("shgoodsList",shgoodsList);

        req.setAttribute("msg","ok");
        return "idea.jsp";
    }
}


