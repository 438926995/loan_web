package com.eleme.domain.user;

import com.eleme.util.DateUtil;

import java.util.Date;

/**
 * Created by huwenwen on 16/5/19.
 */
public class UserFeedback {

  private Integer id;
  private Integer userId;
  private String userName;
  private Date feedbackTime;
  private String feedbackTimeStr;
  private String feedbackContent;
  private Date replyTime;
  private String replyTimeStr;
  private String replyContent;
  private Integer isReply;

  public String getFeedbackTimeStr() {
    feedbackTimeStr = DateUtil.dateFormatDateTimeString(feedbackTime);
    return feedbackTimeStr;
  }

  public void setFeedbackTimeStr(String feedbackTimeStr) {
    this.feedbackTimeStr = feedbackTimeStr;
  }

  public String getReplyTimeStr() {
    if(replyTime != null){
      replyTimeStr = DateUtil.dateFormatDateTimeString(replyTime);
    }
    return replyTimeStr;
  }

  public void setReplyTimeStr(String replyTimeStr) {
    this.replyTimeStr = replyTimeStr;
  }

  public Integer getIsReply() {
    return isReply;
  }

  public void setIsReply(Integer isReply) {
    this.isReply = isReply;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public Integer getUserId() {
    return userId;
  }

  public void setUserId(Integer userId) {
    this.userId = userId;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public Date getFeedbackTime() {
    return feedbackTime;
  }

  public void setFeedbackTime(Date feedbackTime) {
    this.feedbackTime = feedbackTime;
  }

  public String getFeedbackContent() {
    return feedbackContent;
  }

  public void setFeedbackContent(String feedbackContent) {
    this.feedbackContent = feedbackContent;
  }

  public Date getReplyTime() {
    return replyTime;
  }

  public void setReplyTime(Date replyTime) {
    this.replyTime = replyTime;
  }

  public String getReplyContent() {
    return replyContent;
  }

  public void setReplyContent(String replyContent) {
    this.replyContent = replyContent;
  }
}
