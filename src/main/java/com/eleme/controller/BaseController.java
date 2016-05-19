package com.eleme.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class BaseController {
  
  /**
   * 从session中获得用户名
   * @param request
   * @return 不存在返回null
   */
  public String getUserName(HttpServletRequest request){
    HttpSession session = request.getSession();
    Object user = session.getAttribute("user");
    if(user != null){
      return user.toString();
    }
    return null;
  }

}
