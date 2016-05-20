package com.eleme.bean;

/**
 * Created by huwenwen on 16/5/20.
 */
public class ChangePasswordBean {

  private String oldPwd;
  private String newPwd;
  private Integer userId;

  public String getOldPwd() {
    return oldPwd;
  }

  public void setOldPwd(String oldPwd) {
    this.oldPwd = oldPwd;
  }

  public String getNewPwd() {
    return newPwd;
  }

  public void setNewPwd(String newPwd) {
    this.newPwd = newPwd;
  }

  public Integer getUserId() {
    return userId;
  }

  public void setUserId(Integer userId) {
    this.userId = userId;
  }
}
