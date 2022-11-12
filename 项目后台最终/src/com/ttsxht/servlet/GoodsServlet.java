package com.ttsxht.servlet;

import com.ttsxht.dao.GoodsDAO;
import com.ttsxht.dao.OldgoodsDAO;
import com.ttsxht.entity.*;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet("/goods")
public class GoodsServlet extends BaseServlet {

    private static GoodsDAO goodsDAO = new GoodsDAO();
    private OldgoodsDAO oldgoodsDAO = new OldgoodsDAO();
    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        return null;
    }

    //查询 分页
    public String list(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        //获取当前显示第几页
        String page= (String) req.getAttribute("page");
        String keyword = (String) req.getAttribute("keyword");
        String searchtype = (String) req.getAttribute("searchtype");
        ArrayList<Goods> list = (ArrayList<Goods>) req.getAttribute("list");
        if(page==null) {
            page="1";
        }
        Pager pager=new Pager();
        pager.setSize(10);
        pager.setPage(Integer.parseInt(page));
        String text = null;
        if(list.size()==0 && keyword.equals("")) {
            pager.setList(goodsDAO.list(Goods.class,pager.getPage(),pager.getSize()));//封装分页集合
            pager.setTotal(goodsDAO.getTotal("goods",pager.getSize()));//封装总页数
        }else if(list.size()==0 && keyword.length()!=0) {
            text = "没找到你要的商品呢，请输入正确的商品编号或名字";
        }
        else {
            pager.setTotal(list.size()%pager.getSize()==0?list.size()/pager.getSize():list.size()/pager.getSize()+1);
            pager.setList(GoodsServlet.pagelist(list, pager.getPage(), pager.getSize(), pager.getTotal()));
        }
        req.setAttribute("pager",pager);
        req.setAttribute("text",text);
        req.setAttribute("keyword",keyword);
        req.setAttribute("searchtype",searchtype);
        //转发
        return "goods_list.jsp";

    }
    //查询单个
    public String searchs(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        Goods g = (Goods) goodsDAO.get(new Goods(Integer.parseInt(req.getParameter("g_id"))),"g_id");
        req.setAttribute("g",g);
        req.setAttribute("style","goods");
        return "goods_remark.jsp";
    }

    //单个下架
    public String delete(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String id = req.getParameter("id");
        String keyword = req.getParameter("keyword");
        String searchtype = req.getParameter("searchtype");
        String page = req.getParameter("page");

        //获得点击下架时间
        Date d = new Date();
        //日期格式化
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日HH时mm分ss秒");
        //通过日期拼接文件名称(保存文件唯一性,上传名称重复的文件时不会被覆盖)
        String datename = sdf.format(d);

        //获取原数据库中数据
        Goods goods = (Goods) goodsDAO.get(new Goods(Integer.parseInt(id)),"g_id");
        Oldgoods oldgoods=new Oldgoods(goods.getG_id(),goods.getG_name(),goods.getG_smalltype(),goods.getG_bigtype(),goods.getG_url(),goods.getG_typeurl(),
                goods.getG_url2(),goods.getG_price(),goods.getG_hot(),goods.getG_remark(),goods.getG_num(),datename);

        //删除原商品在数据库
        goodsDAO.delete(new Goods(Integer.parseInt(id)),"g_id");
        //保存至下架商品表oldgoods
        oldgoodsDAO.save(oldgoods);

        req.setAttribute("page",page);
        req.setAttribute("keyword",keyword);
        req.setAttribute("searchtype",searchtype);

        return "goods?method=keyWord&m=m";
    }
    //批量下架
    public String deletes(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String[] ids = req.getParameterValues("ids");
        String keyword = req.getParameter("keyword");
        String searchtype = req.getParameter("searchtype");
        String page = req.getParameter("page");

        for(String id : ids){
            //获得点击下架时间
            Date d = new Date();
            //日期格式化
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日HH时mm分ss秒");
            //通过日期拼接文件名称(保存文件唯一性,上传名称重复的文件时不会被覆盖)
            String datename = sdf.format(d);
            //获取原数据库中数据
            Goods goods = (Goods) goodsDAO.get(new Goods(Integer.parseInt(id)),"g_id");
            Oldgoods oldgoods=new Oldgoods(goods.getG_id(),goods.getG_name(),goods.getG_smalltype(),goods.getG_bigtype(),goods.getG_url(),goods.getG_typeurl(),
                    goods.getG_url2(),goods.getG_price(),goods.getG_hot(),goods.getG_remark(),goods.getG_num(),datename);
            //删除原商品在数据库
            goodsDAO.delete(new Goods(Integer.parseInt(id)),"g_id");
            //保存至下架商品表oldgoods
            oldgoodsDAO.save(oldgoods);
        }
        req.setAttribute("page",page);
        req.setAttribute("keyword",keyword);
        req.setAttribute("searchtype",searchtype);
        return "goods?method=keyWord&m=m";
    }
    //初始化修改
    public String init(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        req.setAttribute("g",goodsDAO.get(new Goods(Integer.parseInt(req.getParameter("g_id"))),"g_id"));
        return "goods_update.jsp";
    }
    //修改
    public String update(HttpServletRequest req, HttpServletResponse resp){
    String id = req.getParameter("id");
    try {
        Goods g = (Goods) goodsDAO.get(new Goods(Integer.parseInt(id)),"g_id");
        boolean flag = ServletFileUpload.isMultipartContent(req);
        if (flag){
            DiskFileItemFactory factory = new DiskFileItemFactory(1024*1024,new File("/"));
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setHeaderEncoding("UTF-8");
            List<FileItem> list = upload.parseRequest(req);
            //w文件集合
            ArrayList<String> string=new ArrayList<>();
            //非文件
            ArrayList<String> Ss=new ArrayList<>();
            Date d = new Date();
            //日期格式化
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
            //通过日期拼接文件名称(保存文件唯一性,上传名称重复的文件时不会被覆盖)
            String datename = sdf.format(d);
            for(FileItem item : list){
                String filedName = item.getFieldName();
                if(!item.isFormField()){
                    String name = item.getName();
                    if(name.equals("")){
                        string.add("");
                        continue;
                    }
                    if(name.indexOf("\\")!=-1){
                        //文件名称截取
                        name = name.substring(name.lastIndexOf("\\")+1);
                    }
                    //获取服务器根目录地址
                    String path = req.getSession().getServletContext().getRealPath("/");
                    //创建保存文件目录
                    File dir = new File(path+"img/image/"+g.getG_name()+"/"+filedName);
                    //文件目录不存在则创建
                    if(!dir.exists()){
                        dir.mkdirs();
                    }

                    //保存目标文件
                    File file = new File(dir,name);
                    string.add("img/image/"+g.getG_name()+"/"+filedName+"/"+name);

                    //上传文件
                    item.write(file);
                    //删除临时文件
                    item.delete();

                }else {//非文件
                    String string1 = item.getString("utf-8");
                    Ss.add(string1);
                }

            }
            for(int i = 0;i<string.size();i++){
                System.out.println(string.get(i));
            }for(int i=0;i<Ss.size();i++){
                System.out.println(Ss.get(i));
            }
            if(string.get(0).equals("")){
                string.set(0,Ss.get(2));
            }
            for(int i = 1;i < 5;i++){
                if(string.get(i).equals("")){
                    string.set(i,Ss.get(i+7));
                }
            }
            int k = 12;
            for(int i = 5;i < string.size();i++){

                if(string.get(i).equals("")){
                    string.set(i,Ss.get(k));
                }
                k+=2;
            }
            String g_url2= string.get(1)+","+string.get(2)+","+string.get(3)+","+string.get(4);
            String g_typeurl = "";
            int s = 13;
            for (int i = 5; i < string.size(); i++) {
                g_typeurl+=string.get(i)+":"+Ss.get(s)+",";
                s+=2;
            }

//  S0id S1name S2主图隐藏 S3big S4small S5price S6num S7remark S8附图1隐藏 S9附图2隐藏 S10附图3隐藏 S11附图4隐藏 S12类型图1隐藏 S13文本...
// s0url   s1附图1 s2附图2 s3附图3 s4附图4  s5 类型图...
            Smalltype s1 = (Smalltype) goodsDAO.get(new Smalltype(Ss.get(4)),"st_name");
            Bigtype b = (Bigtype) goodsDAO.get(new Bigtype(Ss.get(3)),"bt_name");;
            System.out.println(Ss.get(3));
            System.out.println(Ss.get(2));
            g.setG_name(Ss.get(1));
            g.setG_bigtype(s1.getSt_id()+"");
            g.setG_smalltype(b.getBt_id()+"");
            g.setG_url(string.get(0));
            g.setG_typeurl(g_typeurl);
            g.setG_url2(g_url2);
            g.setG_price(Double.parseDouble(Ss.get(5)));
            g.setG_remark(Ss.get(7));
            g.setG_num(Integer.parseInt(Ss.get(6)));
            goodsDAO.update(g,"g_id");
        }
    } catch (Exception e) {
        throw new RuntimeException(e);
    }
    return "goods?method=init&g_id="+id;
}

    //查关键字  分页
    public String keyWord(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String m = req.getParameter("m");
        String page="";
        String keyword="";
        String searchtype="";
        if(m.equals("del")){
            page= (String) req.getAttribute("page");
             keyword = (String) req.getAttribute("keyword");
             searchtype = (String) req.getAttribute("searchtype");
        }else {
             keyword = req.getParameter("keyword");
            if(keyword.equals("null")){
                keyword="";
            }
             searchtype = req.getParameter("searchtype");
             page = req.getParameter("page");
        }


        ArrayList<Goods> list = null;
        if(searchtype.equals("g_id")){

            list =goodsDAO.keyWord(new Goods(Integer.parseInt(keyword)),searchtype,keyword);
        }else {
            list = goodsDAO.keyWord(new Goods(keyword),searchtype,keyword);
        }
        for(int i = 0;i< list.size();i++){
            list.get(i).setG_smalltype(GoodsServlet.smallname( list.get(i).getG_smalltype(),"st_id"));
            list.get(i).setG_bigtype(GoodsServlet.bigname( list.get(i).getG_bigtype(),"bt_id"));
        }
        req.setAttribute("list",list);
        req.setAttribute("page",page);
        req.setAttribute("keyword",keyword);
        req.setAttribute("searchtype",searchtype);
        return "goods?method=list";

    }
    //集合分页遍历
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
    //新增
    public String upload(HttpServletRequest req,HttpServletResponse resp) throws Exception{
        try {
            Goods goods = new Goods();
            boolean flag = ServletFileUpload.isMultipartContent(req);
            if (flag){
                DiskFileItemFactory factory = new DiskFileItemFactory(1024*1024,new File("/"));
                ServletFileUpload upload = new ServletFileUpload(factory);
                upload.setHeaderEncoding("UTF-8");
                List<FileItem> list = upload.parseRequest(req);

                //w文件集合
                ArrayList<String> string=new ArrayList<>();
                //非文件
                ArrayList<String> Ss=new ArrayList<>();
                Date d = new Date();
                //日期格式化
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
                //通过日期拼接文件名称(保存文件唯一性,上传名称重复的文件时不会被覆盖)
                String datename = sdf.format(d);
                for(FileItem item : list){
                    String filedName = item.getFieldName();
                    if(!item.isFormField()){
                        String name = item.getName();
                        if(name.indexOf("\\")!=-1){
                            //文件名称截取
                            name = name.substring(name.lastIndexOf("\\")+1);
                        }
                        //获取服务器根目录地址
                        String path = req.getSession().getServletContext().getRealPath("/");
                        //创建保存文件目录
                        File dir = new File(path+"img/image/"+datename+"_"+goods.getG_name()+"/"+filedName);
                        //文件目录不存在则创建
                        if(!dir.exists()){
                            dir.mkdirs();
                        }

                        //保存目标文件
                        File file = new File(dir,name);
                        string.add("img/image/"+datename+"_"+goods.getG_name()+"/"+filedName+"/"+name);

                        //上传文件
                        item.write(file);
                        //删除临时文件
                        item.delete();

                    }else {//非文件
                        String string1 = item.getString("utf-8");
                        Ss.add(string1);
                        goods.setG_name(Ss.get(0));
                    }

                }
                String g_url2= string.get(1)+","+string.get(2)+","+string.get(3)+","+string.get(4);
                String g_typeurl = "";
                for (int i = 5; i < string.size(); i++) {
                    g_typeurl+=string.get(i)+":"+Ss.get(i+1)+",";

                }
                Smalltype s = (Smalltype) goodsDAO.get(new Smalltype(Ss.get(2)),"st_name");
                Bigtype b = (Bigtype) goodsDAO.get(new Bigtype(Ss.get(1)),"bt_name");
                goods.setG_smalltype(s.getSt_id()+"");
                goods.setG_bigtype(b.getBt_id()+"");
                goods.setG_url(string.get(0));
                goods.setG_typeurl(g_typeurl);
                goods.setG_url2(g_url2);
                goods.setG_price(Double.parseDouble(Ss.get(3)));
                goods.setG_hot(0);
                goods.setG_remark(Ss.get(5));
                goods.setG_date(datename);
                goods.setG_num(Integer.parseInt(Ss.get(4)));
                goodsDAO.save(goods);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("msg","新增成功");
        return "goods_add.jsp";
    }


    //根据类型编号查相应的表提取名称
    //小类型
    private static String smallname(String num,String pk){
        Smalltype s = (Smalltype) goodsDAO.get(new Smalltype(Integer.parseInt(num)),pk);

       return  s.getSt_name();
    }
    //大类型
    private static String bigname(String num,String pk){
        Bigtype b = (Bigtype) goodsDAO.get(new Bigtype(Integer.parseInt(num)),pk);
        return b.getBt_name() ;
    }

//    //小类型修改
//    private String smallname(HttpServletRequest req,HttpServletResponse resp) throws Exception{
//        ArrayList<Smalltype> list =goodsDAO.list(Smalltype.class);
//        req.setAttribute("small",list);
//        return "goods_update.jsp";
//    }
//    //大类型修改
//    private String bigname(HttpServletRequest req,HttpServletResponse resp) throws Exception{
//        ArrayList<Bigtype> list =goodsDAO.list(Bigtype.class);
//        req.setAttribute("big",list);
//        return "goods_update.jsp";
//    }
//    //小类型add
//    private String small(HttpServletRequest req,HttpServletResponse resp) throws Exception{
//        ArrayList<Smalltype> list =goodsDAO.list(Smalltype.class);
//        req.setAttribute("small",list);
//        return "goods_add.jsp";
//    }
//    //大类型add
//    private String big(HttpServletRequest req,HttpServletResponse resp) throws Exception{
//        ArrayList<Bigtype> list =goodsDAO.list(Bigtype.class);
//        req.setAttribute("big",list);
//        return "goods_add.jsp";
//    }
}
