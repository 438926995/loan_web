package com.eleme.bean;

import java.io.Serializable;

/**
 * JSON消息封装.
 * 
 *
 */
public class JSONMessage implements Serializable {

  /**
   * 序列化
   */
  private static final long serialVersionUID = 1309523950863504847L;
  /**
   * 是否成功
   */
  private Boolean isSuccess;
  /**
   * 成功信息
   */
  private String message;
  /**
   * 失败原因
   */
  private String failReason;

  /**
   * 仅支持json字符串(如果验证失败，设置回传参数。参照提交贷款验证失败的代码)
   */
  private String params;

  /**
   * 返回数据
   */
  private Object datas;

  /**
   * 错误码（四位数字即可）
   */
  private String errorCode;

  public JSONMessage() {}

  public JSONMessage(Boolean isSuccess) {
    this.isSuccess = isSuccess;
  }

  public JSONMessage(Boolean isSuccess, String message) {
    this.isSuccess = isSuccess;
    if (isSuccess) {
      this.message = message;
    } else {
      this.failReason = message;
    }
  }

  public JSONMessage(Boolean isSuccess, String message, String params) {
    this.isSuccess = isSuccess;
    if (isSuccess) {
      this.message = message;
    } else {
      this.failReason = message;
    }
    this.params = params;
  }

  public JSONMessage(Boolean isSuccess, Exception error) {
    this.isSuccess = isSuccess;
    this.failReason = error.getMessage();
  }

  /**
   * @return the isSuccess
   */
  public Boolean getIsSuccess() {
    return isSuccess;
  }

  /**
   * @param isSuccess the isSuccess to set
   */
  public void setIsSuccess(Boolean isSuccess) {
    this.isSuccess = isSuccess;
  }

  /**
   * @return the message
   */
  public String getMessage() {
    return message;
  }

  /**
   * @param message the message to set
   */
  public void setMessage(String message) {
    this.message = message;
  }

  /**
   * @return the failReason
   */
  public String getFailReason() {
    return failReason;
  }

  /**
   * @param failReason the failReason to set
   */
  public void setFailReason(String failReason) {
    this.failReason = failReason;
  }

  public String getParams() {
    return params;
  }

  public void setParams(String params) {
    this.params = params;
  }

  public Object getDatas() {
    return datas;
  }

  public void setDatas(Object datas) {
    this.datas = datas;
  }

  public String getErrorCode() {
    return errorCode;
  }

  public void setErrorCode(String errorCode) {
    this.errorCode = errorCode;
  }

}
