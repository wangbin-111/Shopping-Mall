package com.SC.lei;

import java.util.ArrayList;

public class orderInfo {
       private orders orders;
        private ArrayList<Goods> goods;
        private ArrayList<Integer> count;
        private ArrayList<String> type  ;

    public orderInfo() {
    }


    public orderInfo(com.SC.lei.orders orders, ArrayList<Goods> goods, ArrayList<Integer> count, ArrayList<String> type) {
        this.orders = orders;
        this.goods = goods;
        this.count = count;
        this.type = type;
    }

    public ArrayList<String> getType() {
        return type;
    }

    public void setType(ArrayList<String> type) {
        this.type = type;
    }

    public com.SC.lei.orders getOrders() {
        return orders;
    }

    public void setOrders(com.SC.lei.orders orders) {
        this.orders = orders;
    }

    public ArrayList<Goods> getGoods() {
        return goods;
    }

    public void setGoods(ArrayList<Goods> goods) {
        this.goods = goods;
    }

    public ArrayList<Integer> getCount() {
        return count;
    }

    public void setCount(ArrayList<Integer> count) {
        this.count = count;
    }
}
