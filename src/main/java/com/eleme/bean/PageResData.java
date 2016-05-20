package com.eleme.bean;

import java.util.List;

/**
 * 分页返回数据
 * 
 * @author sunwei
 * @since 2015年12月27日
 * @param <T>
 */
public class PageResData<T> {

  /**
   * 数据总数
   */
  private int total;
  /**
   * 数据list
   */
  private List<T> rows;

  public int getTotal() {
    return total;
  }

  public void setTotal(int total) {
    this.total = total;
  }

  public List<T> getRows() {
    return rows;
  }

  public void setRows(List<T> rows) {
    this.rows = rows;
  }



}
