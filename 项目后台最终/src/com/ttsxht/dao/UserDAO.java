package com.ttsxht.dao;

import com.ttsxht.entity.User;

import java.util.ArrayList;

public class UserDAO extends BaseDAO {

    public static void main(String[] args) {
         UserDAO userDAO = new UserDAO();
       ArrayList list = userDAO.list(User.class);
        System.out.println(list);
    }
}
