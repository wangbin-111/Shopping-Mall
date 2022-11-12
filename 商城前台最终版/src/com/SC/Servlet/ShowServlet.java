package com.SC.Servlet;
import com.SC.lei.Goods;
import com.SC.util.GoodsDao;
import com.SC.util.Pager;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Comparator;

@WebServlet("/show")
public class ShowServlet extends BaseServlet {
    private GoodsDao goodsDAO = new GoodsDao();
    //查询
    public String list(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        ArrayList<Goods> list = goodsDAO.list(Goods.class);
        list.sort(new Comparator<Goods>() {
            @Override
            public int compare(Goods o1, Goods o2) {
                return o2.getG_hot()-o1.getG_hot();
            }
        });
        ArrayList<Goods> listBar=new ArrayList<>();

        for (int i = 0; i < 3; i++) {
            listBar.add(list.get(i));
        }

//电子商品
        ArrayList<Goods> listds = goodsDAO.list2(Goods.class,"g_bigtype","1",1,12);
//香薰
        ArrayList<Goods> listxx = goodsDAO.list2(Goods.class,"g_bigtype","4",1,8);
//美妆
        ArrayList<Goods> listmz = goodsDAO.list2(Goods.class,"g_bigtype","5",1,6);



        req.setAttribute("msg","ok");
        req.setAttribute("listds",listds);
        req.setAttribute("listxx",listxx);
        req.setAttribute("listmz",listmz);
        req.setAttribute("listBar",listBar);

        return "index.jsp";




    }

    //查关键字
    public String keyWord(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String searchtext = req.getParameter("searchtext");
        String text = null;
        String page = req.getParameter("page");
        ArrayList<Goods> list = goodsDAO.keyWord(Goods.class,searchtext);
        if(list.size()==0) {
           text = "没找到你要的商品呢，试着看看下面这些";
            searchtext = "辣";
            list = goodsDAO.keyWord(Goods.class,searchtext);
        }
        req.setAttribute("text",text);
        req.setAttribute("searchtext",searchtext);
        req.setAttribute("list",list);
        req.setAttribute("page",page);
        return "show?method=page";

    }

    //分页
public String page(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    String page= (String) req.getAttribute("page");
    String searchtext = (String) req.getAttribute("searchtext");
    String text = (String) req.getAttribute("text");
    ArrayList<Goods> list = (ArrayList<Goods>) req.getAttribute("list");
    if(page==null) {
        page="1";
    }
    Pager pager=new Pager();
    pager.setSize(16);
    pager.setPage(Integer.parseInt(page));
    pager.setTotal(list.size()%pager.getSize()==0?list.size()/pager.getSize():list.size()/pager.getSize()+1);
    pager.setList(ShowServlet.pagelist(list, pager.getPage(), pager.getSize(), pager.getTotal()));
    req.setAttribute("pager",pager);
    req.setAttribute("searchtext",searchtext);
    req.setAttribute("text",text);
    return "search.jsp";
}
    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        return null;
    }
    public static ArrayList pagelist(ArrayList list,int page,int size,int total) {
        ArrayList<Object> pagelist = null;
        Goods goods = new Goods();
        if(total==page) {
            pagelist = new ArrayList<>();
            for(int i = (page-1)*size;i< list.size();i++) {
                goods = (Goods) list.get(i);
                pagelist.add(goods);
            }
            return  pagelist;
        }else {
            pagelist = new ArrayList<>();
            for(int i = (page-1)*size;i< page*size;i++) {
                goods = (Goods) list.get(i);
                pagelist.add(goods);
            }
            return  pagelist;
        }

    }
}
