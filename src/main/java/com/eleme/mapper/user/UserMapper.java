package com.eleme.mapper.user;

import com.eleme.domain.user.MartUser;

public interface UserMapper {
  
  public MartUser selectMartUserByUserName(String userName);
  
  public int insertMartUser(MartUser mu);
  
}
