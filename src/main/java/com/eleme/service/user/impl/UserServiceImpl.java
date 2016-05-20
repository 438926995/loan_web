package com.eleme.service.user.impl;

import javax.inject.Inject;

import com.eleme.bean.ChangePasswordBean;
import com.eleme.bean.FeedbackQueryBean;
import com.eleme.bean.PageResData;
import com.eleme.domain.user.UserFeedback;
import org.springframework.stereotype.Service;

import com.eleme.domain.user.MartUser;
import com.eleme.mapper.user.UserMapper;
import com.eleme.service.user.IUserService;

import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements IUserService {

  @Inject
  private UserMapper userMapper;

  @Override
  public MartUser getMartUserInfoByUserName(String userName) {
    return userMapper.selectMartUserByUserName(userName);
  }

  @Override
  public boolean judgeUserNameIsExist(String userName) {
    return userMapper.selectMartUserByUserName(userName) == null ? false : true;
  }

  @Override
  public int insertMartUser(MartUser mu) {
    return userMapper.insertMartUser(mu);
  }

  @Override
  public int updateMartUser(MartUser mu) {
    return userMapper.updateMartUser(mu);
  }

  @Override
  public int saveUserFeedback(UserFeedback feedback) {
    feedback.setFeedbackTime(new Date());
    return userMapper.insertUserFeedback(feedback);
  }

  @Override
  public PageResData<UserFeedback> getUserFeedBackList(FeedbackQueryBean fqb) {
    List<UserFeedback> userFeedbackList = userMapper.selectUserFeedbackList(fqb);
    int count = userMapper.selectUserFeedbackListCount(fqb);
    PageResData<UserFeedback> result = new PageResData<>();
    result.setTotal(count);
    result.setRows(userFeedbackList);
    return result;
  }

  @Override
  public int changeUserPassword(ChangePasswordBean changePasswordBean) {
    return userMapper.updateMartUserToChangePassword(changePasswordBean);
  }

}
