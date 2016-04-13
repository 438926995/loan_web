package com.eleme.domain.loan;

import java.util.Date;

/**
 * 贷款申请表实体类
 * 
 * @author huwenwen
 *
 */
public class TApplyLoan {
  private Integer slId;
  private Integer fpId;
  private Integer loanAmount;
  private Integer userId;
  private Date submitTime;
  private String appStatus;
  private String docNo;

  public Integer getSlId() {
    return slId;
  }

  public void setSlId(Integer slId) {
    this.slId = slId;
  }

  public Integer getFpId() {
    return fpId;
  }

  public void setFpId(Integer fpId) {
    this.fpId = fpId;
  }

  public Integer getLoanAmount() {
    return loanAmount;
  }

  public void setLoanAmount(Integer loanAmount) {
    this.loanAmount = loanAmount;
  }

  public Integer getUserId() {
    return userId;
  }

  public void setUserId(Integer userId) {
    this.userId = userId;
  }

  public Date getSubmitTime() {
    return submitTime;
  }

  public void setSubmitTime(Date submitTime) {
    this.submitTime = submitTime;
  }

  public String getAppStatus() {
    return appStatus;
  }

  public void setAppStatus(String appStatus) {
    this.appStatus = appStatus;
  }

  public String getDocNo() {
    return docNo;
  }

  public void setDocNo(String docNo) {
    this.docNo = docNo;
  }

}
