package com.ttsxht.servlet;

import com.ttsxht.dao.GoodsDAO;
import com.ttsxht.dao.OldgoodsDAO;
import com.ttsxht.entity.Goods;
import com.ttsxht.entity.Oldgoods;
import com.ttsxht.entity.Pager;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
@WebServlet("/oldgoods")
public class OldGoodsServlet extends BaseServlet {

        private OldgoodsDAO oldgoodsDAO = new OldgoodsDAO();

        //查询 分页
        public String list(HttpServletRequest req, HttpServletResponse resp) throws Exception {
            //获取当前显示第几页
            String page= (String) req.getAttribute("page");
            String keyword = (String) req.getAttribute("keyword");
            String searchtype = (String) req.getAttribute("searchtype");
            ArrayList<Oldgoods> list = (ArrayList<Oldgoods>) req.getAttribute("list");
            if(page==null) {
                page="1";
            }
            Pager pager=new Pager();
            pager.setSize(10);
            pager.setPage(Integer.parseInt(page));
            String text = null;
            if(list.size()==0 && keyword.equals("")) {
                pager.setList(oldgoodsDAO.list(Oldgoods.class,pager.getPage(),pager.getSize()));//封装分页集合
                pager.setTotal(oldgoodsDAO.getTotal("oldgoods",pager.getSize()));//封装总页数
            }else if(list.size()==0 && keyword.length()!=0) {
                text = "没找到你要的商品呢，请输入正确的商品编号或名字";
            }
            else {
                pager.setTotal(list.size()%pager.getSize()==0?list.size()/pager.getSize():list.size()/pager.getSize()+1);
                pager.setList(com.ttsxht.servlet.OldGoodsServlet.pagelist(list, pager.getPage(), pager.getSize(), pager.getTotal()));
            }
            req.setAttribute("pager",pager);
            req.setAttribute("text",text);
            req.setAttribute("keyword",keyword);
            req.setAttribute("searchtype",searchtype);
            //转发
            return "oldgoods_list.jsp";

        }
        //查询单个
        public String searchs(HttpServletRequest req, HttpServletResponse resp) throws Exception {
            Oldgoods g = (Oldgoods) oldgoodsDAO.get(new Oldgoods(Integer.parseInt(req.getParameter("g_id"))),"g_id");
            req.setAttribute("g",g);
            req.setAttribute("style","oldgoods");
            return "goods_remark.jsp";
        }

        @Override
        public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
            return null;
        }
        //查关键字  分页
        public String keyWord(HttpServletRequest req, HttpServletResponse resp) throws Exception {
            String keyword = req.getParameter("keyword");
                if(keyword.equals("null")){
                    keyword="";
                }

            String  searchtype = req.getParameter("searchtype");
            String  page = req.getParameter("page");



            ArrayList<Goods> list = null;
            if(searchtype.equals("g_id")){
                list =oldgoodsDAO.keyWord(new Oldgoods(Integer.parseInt(keyword)),searchtype,keyword);
            }else {
                list = oldgoodsDAO.keyWord(new Oldgoods(keyword),searchtype,keyword);
            }
            req.setAttribute("list",list);
            req.setAttribute("page",page);
            req.setAttribute("keyword",keyword);
            req.setAttribute("searchtype",searchtype);
            return "oldgoods?method=list";

        }
        //集合分页遍历
        public static ArrayList pagelist(ArrayList list,int page,int size,int total) {
            ArrayList<Object> pagelist = null;
            Oldgoods goods = new Oldgoods();
            if(total==page) {
                pagelist = new ArrayList<>();
                for(int i = (page-1)*size;i< list.size();i++) {
                    goods = (Oldgoods) list.get(i);
                    pagelist.add(goods);
                }
                return  pagelist;
            }else {
                pagelist = new ArrayList<>();
                for(int i = (page-1)*size;i< page*size;i++) {
                    goods = (Oldgoods) list.get(i);
                    pagelist.add(goods);
                }
                return  pagelist;
            }

        }
}

