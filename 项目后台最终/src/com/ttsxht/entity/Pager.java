package com.ttsxht.entity;

import java.util.ArrayList;

/**
 * 分页对象
 */
public class Pager {

    private ArrayList list;//分页集合
    private int page;//当前页
    private int size;//每页行数
    private int total;//总页数

    public ArrayList getList() {
        return list;
    }

    public void setList(ArrayList list) {
        this.list = list;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}
