package com.eleme.mapper.user;

import com.eleme.bean.ChangePasswordBean;
import com.eleme.bean.FeedbackQueryBean;
import com.eleme.domain.user.MartUser;
import com.eleme.domain.user.UserFeedback;

import java.util.List;

public interface UserMapper {
  
  public MartUser selectMartUserByUserName(String userName);
  
  public int insertMartUser(MartUser mu);

  public int updateMartUser(MartUser mu);

  public int insertUserFeedback(UserFeedback feedback);

  public List<UserFeedback> selectUserFeedbackList(FeedbackQueryBean fqb);

  public int selectUserFeedbackListCount(FeedbackQueryBean fqb);

  public int updateMartUserToChangePassword(ChangePasswordBean changePasswordBean);
  
}
