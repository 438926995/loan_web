package com.eleme.service.user;

import com.eleme.domain.user.MartUser;

public interface IUserService {
  
  public MartUser getMartUserInfoByUserName(String userName);
  
  public boolean judgeUserNameIsExist(String userName);
  
  public int insertMartUser(MartUser mu);

}
