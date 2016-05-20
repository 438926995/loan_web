package com.eleme.service.user;

import com.eleme.bean.ChangePasswordBean;
import com.eleme.bean.FeedbackQueryBean;
import com.eleme.bean.PageResData;
import com.eleme.domain.user.MartUser;
import com.eleme.domain.user.UserFeedback;

import java.util.List;

public interface IUserService {
  
  public MartUser getMartUserInfoByUserName(String userName);
  
  public boolean judgeUserNameIsExist(String userName);
  
  public int insertMartUser(MartUser mu);

  public int updateMartUser(MartUser mu);

  public int saveUserFeedback(UserFeedback feedback);

  public PageResData<UserFeedback> getUserFeedBackList(FeedbackQueryBean fqb);

  public int changeUserPassword(ChangePasswordBean changePasswordBean);

}
