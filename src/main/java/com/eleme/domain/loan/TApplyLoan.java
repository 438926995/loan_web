package com.eleme.domain.loan;

import java.util.Date;

import constants.AppStatusEnum;

/**
 * 贷款申请表实体类
 * 
 * @author huwenwen
 *
 */
public class TApplyLoan {
  private Integer slId;
  private Integer fpId;
  private String fpName;
  private Integer loanAmount;
  private Integer userId;
  private Date submitTime;
  private String appStatus;
  private String appStatusName;
  private String docNo;
  private String apvRemark;
  private Date apvTime;

  public String getAppStatusName() {
    if(AppStatusEnum.PASS.getAppStauts().equals(appStatus)){
      appStatusName = AppStatusEnum.PASS.getName();
    } else if(AppStatusEnum.DIS_PASS.getAppStauts().equals(appStatus)){
      appStatusName = AppStatusEnum.DIS_PASS.getName();
    } else if(AppStatusEnum.AUDIT.getAppStauts().equals(appStatus)){
      appStatusName = AppStatusEnum.AUDIT.getName();
    } else {
      appStatusName = AppStatusEnum.REVOKE.getName();
    }
    return appStatusName;
  }

  public String getFpName() {
    return fpName;
  }


  public void setFpName(String fpName) {
    this.fpName = fpName;
  }


  public String getApvRemark() {
    return apvRemark;
  }


  public void setApvRemark(String apvRemark) {
    this.apvRemark = apvRemark;
  }


  public Date getApvTime() {
    return apvTime;
  }


  public void setApvTime(Date apvTime) {
    this.apvTime = apvTime;
  }


  public void setAppStatusName(String appStatusName) {
    this.appStatusName = appStatusName;
  }

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
