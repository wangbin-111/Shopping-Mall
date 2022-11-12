package com.SC.Servlet;

import com.SC.lei.ship_address;
import com.SC.lei.*;
import com.SC.util.UserDao;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/user")
public class UserServlet extends BaseServlet {
    private UserDao dao = new UserDao();

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        return null;
    }

    public String add(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

//        先导入用户名和密码
        dao.save(new user(email, password, null, null, null, null, null));

        return "redirect:/login.jsp";
    }
    public String login(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String email = req.getParameter("username");
        String password = req.getParameter("password");
//        创建一个标识，判断是否存在该用户
//
        ArrayList<user> list = dao.list(user.class);
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getEmail().equals(email) && list.get(i).getPassword().equals(password)) {
//                存在该用户则加入session  标明用户登陆状态
                req.getSession().setAttribute("user", list.get(i));
//                flag=true;
                return "redirect:/index.jsp";
            }
        }
        req.setAttribute("msg", "用户名或密码错误");
        return "login.jsp";
    }
//      修改地区
//    update contry

    public String updateContry(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String contry = req.getParameter("contry");
        String id = req.getParameter("id");
        System.out.println(contry);
        user u = (user) dao.get(new user(Integer.parseInt(id)), "u_id");
        u.setAddress(contry);
        dao.update(u, "u_id");
        req.getSession().setAttribute("user", u);
        return "redirect:/mygrxx.jsp";
    }
//      完善信息
//    update contry

    public String updateUserInfo(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String name = req.getParameter("name");
        String birthday = req.getParameter("birthday");
        String gender = req.getParameter("gender");

        String id = req.getParameter("id");

        user u = (user) dao.get(new user(Integer.parseInt(id)), "u_id");
        u.setName(name);
        u.setBirthday(birthday);
        u.setGender(gender);
        dao.update(u, "u_id");
        req.getSession().setAttribute("user", u);
        return "redirect:/mygrxx.jsp";
    }

    //    上传头像
    public String uploadHeadImg(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String id = req.getParameter("id");
//        判断文件是否上传
        boolean multipartContent = ServletFileUpload.isMultipartContent(req);

        if (multipartContent) {
//                创建工厂
            DiskFileItemFactory factory = new DiskFileItemFactory(1024 * 1024, new File("/"));

//                创建文件上传解析器
            ServletFileUpload fileUpload = new ServletFileUpload(factory);

            List<FileItem> list = fileUpload.parseRequest(req);
            for (FileItem l : list) {
                if (l.getFieldName().equals("headimg")) {
                    String realPath = req.getRealPath("/");

                    File file = new File(realPath+"/img/qq");

                    if (!file.exists()) {
                        file.mkdirs();
                    }
                    String name = l.getName();
                    File url=new File(file,name);
                    if(!url.exists()){
                        url.createNewFile();
                    }
//          数据库储存的路径
            String headimg="img/qq/"+name;
//          图片地址加入数据库
            user u = (user) dao.get(new user(Integer.parseInt(id)), "u_id");
            u.setHeadimg(headimg);
            dao.update(u,"u_id");
            req.getSession().setAttribute("user",u);

                    l.write(url);
//                    删除临时文件
                    l.delete();
                }

            }


        }
        return "redirect:/mygrxx.jsp";
    }


    //    退出登录
    public String deleteUserSession(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String id = req.getParameter("id");
        user u = (user) dao.get(new user(Integer.parseInt(id)), "u_id");
        HttpSession session = req.getSession();
    //    dao.update(u, "u_id");
        session.removeAttribute("user");
        session.removeAttribute("Slist");
        session.removeAttribute("updateship");
        session.removeAttribute("orderList");
        session.removeAttribute("good");
        session.removeAttribute("orderList2");
        session.removeAttribute("cartInfosList");
        return "redirect:/index.jsp";
    }
//    用户收货地址信息
    public String shipAddress(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String id = req.getParameter("id");

        String add=req.getParameter("href");
//       获取用户表信息
        String name = req.getParameter("name");
        String number = req.getParameter("number");
        String sheng = req.getParameter("sheng");
        String shi = req.getParameter("shi");
        String qu = req.getParameter("qu");
        String XXaddress=req.getParameter("XXaddress");
        String code=req.getParameter("code");

        dao.save(new ship_address(name,number,sheng+"-"+shi+"-"+qu,XXaddress,code,Integer.parseInt(id)));
        ArrayList<ship_address> Slist1 = dao.list(ship_address.class);
        ArrayList<ship_address> Slist =new ArrayList<>();


        for(ship_address s:Slist1){
            if(s.getU_id()==Integer.parseInt(id)){
                Slist.add(s);
            }
        }
        req.getSession().setAttribute("Slist",Slist);
        req.setAttribute("Slist",Slist);


        if(add==null){
        return "redirect:/address.jsp";

        }else{
            return "redirect:/"+add;

        }
    }

    //    用户收货地址信息开始的时候展示

    public String showAddress(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String id = req.getParameter("id");
        String add=req.getParameter("href");
//       获取用户表信息
        ArrayList<ship_address> Slist1 = dao.list(ship_address.class);
        ArrayList<ship_address> Slist =new ArrayList<>();

        for(ship_address s:Slist1){
            if(s.getU_id()==Integer.parseInt(id)){
                Slist.add(s);
            }
        }
//        防止后台数据库没有地址信息的时候前端一直发送请求

        req.setAttribute("msg","ok");
        req.getSession().setAttribute("Slist",Slist);

        if(add==null){
            return "address.jsp";
        }else {
            return add;

        }
    }

    //    删除用户收货地址

    public String deleteAddress(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String ship_id = req.getParameter("ship_id");

        String id = req.getParameter("id");

//        区分那个界面的修改地址
        String add=req.getParameter("href");
//        删除地址信息
        dao.delete(new ship_address(Integer.parseInt(ship_id)),"ship_id");
        //       获取用户表信息
        ArrayList<ship_address> Slist1 = dao.list(ship_address.class);
        ArrayList<ship_address> Slist =new ArrayList<>();

        for(ship_address s:Slist1){
            if(s.getU_id()==Integer.parseInt(id)){
                Slist.add(s);
            }
        }

        req.getSession().setAttribute("Slist",Slist);
        if(add==null){
            return "redirect:/address.jsp";
        }else{
            return "redirect:/"+add;

        }

    }
//    修改用户收货地址1
public String updateAddress1(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    String ship_id = req.getParameter("ship_id");
//        区分那个界面的修改地址
    String add=req.getParameter("href");
    if(req.getSession().getAttribute("updateship")!=null){
        req.getSession().removeAttribute("updateship");
    }
    ship_address updateship = (ship_address) dao.get(new ship_address(Integer.parseInt(ship_id)), "ship_id");

    req.getSession().setAttribute("updateship",updateship);
    if(add==null){
        return "redirect:/addressupdate.jsp";

    }else{
        return "redirect:/"+add;
    }
}
    //    修改用户收货地址2
    public String updateAddress2(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String ship_id = req.getParameter("ship_id");
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String number = req.getParameter("number");
        String sheng = req.getParameter("sheng");
        String shi = req.getParameter("shi");
        String qu = req.getParameter("qu");
        String XXaddress=req.getParameter("XXaddress");
        String code=req.getParameter("code");

//        区分那个界面的修改地址
        String add=req.getParameter("href");

//        查询地址信息
        ship_address ship = (ship_address) dao.get(new ship_address(Integer.parseInt(ship_id)), "ship_id");
        ship.setShip_name(name);
        ship.setShip_num(number);
        ship.setShip_address(sheng+"-"+shi+"-"+qu);
        ship.setShip_da(XXaddress);
        ship.setShip_code(code);
        dao.update(ship,"ship_id");
        //       获取用户表信息
        ArrayList<ship_address> Slist1 = dao.list(ship_address.class);
        ArrayList<ship_address> Slist =new ArrayList<>();
        for(ship_address s:Slist1){
            if(s.getU_id()==Integer.parseInt(id)){
                Slist.add(s);
            }
        }
        req.getSession().setAttribute("Slist",Slist);
        if(add==null){
            return "redirect:/address.jsp";
        }else{
            return "redirect:/"+add;
        }
    }


//    用户修改密码

    public String updateUserPwd(HttpServletRequest req, HttpServletResponse resp) throws Exception {


        String id = req.getParameter("id");

        String oldpassword = req.getParameter("oldpassword");
        String password = req.getParameter("password");

//        通过id查询用户密码是否错误
        user user = (user) dao.get(new user(Integer.parseInt(id)), "u_id");

        if(user.getPassword().equals(oldpassword)){
            user.setPassword(password);
            dao.update(user, "u_id");
            req.getSession().setAttribute("user",user);
            req.setAttribute("msg","密码已修改");

        }else{
            req.setAttribute("msg","密码不正确");
        }
        return "remima.jsp";
    }

//开始查找购物车信息
    public String FindCart(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String id = req.getParameter("id");

//        查询所有购物车信息
        ArrayList<cart> list = dao.list(cart.class);
        ArrayList<CartInfo> cartList =new ArrayList<>();

        for(cart c:list){
            if(c.getU_id()==Integer.parseInt(id)){
                Goods good = (Goods) dao.get(new Goods(c.getG_id()), "g_id");
                CartInfo cartInfo = new CartInfo(c.getC_id(), c.getC_type(), c.getC_count(), good);
                cartList.add(cartInfo);
            }
        }

//        避免一直查询
        req.setAttribute("msg","ok");

        req.setAttribute("cartList",cartList);

        return "cart.jsp";
    }



}
