package com.eleme.service.user.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.eleme.domain.user.MartUser;
import com.eleme.mapper.user.UserMapper;
import com.eleme.service.user.IUserService;

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

}
