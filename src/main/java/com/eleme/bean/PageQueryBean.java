package com.eleme.bean;

/**
 * 分页查询
 * 
 *
 */
public class PageQueryBean {

  /**
   * 当前页码
   */
  private int currentPage = 0;

  /**
   * 每页分页条数 默认10条
   */
  private int pageSize = 10;

  /**
   * 开始条目
   */
  private int startItem = 0;
  private int startRecord;

  public int getCurrentPage() {
    return currentPage;
  }

  public void setCurrentPage(int currentPage) {
    this.currentPage = currentPage;
  }

  public int getPageSize() {
    return pageSize;
  }

  public void setPageSize(int pageSize) {
    this.pageSize = pageSize;
  }

  public int getStartItem() {
    return startItem;
  }

  public void setStartItem(int startItem) {
    this.startItem = startItem;
  }

  public int getStartRecord() {
    startRecord = currentPage * pageSize;
    return startRecord;
  }

  public void setStartRecord(int startRecord) {
    this.startRecord = startRecord;
  }

}
