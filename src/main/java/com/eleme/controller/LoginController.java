package com.eleme.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eleme.bean.JSONMessage;
import com.eleme.bean.LoginBean;
import com.eleme.domain.product.MFinanceProduct;
import com.eleme.domain.user.MartUser;
import com.eleme.service.loan.ILoanService;
import com.eleme.service.product.IProductService;
import com.eleme.service.user.IUserService;

@Controller
public class LoginController {

  @Inject
  private ILoanService loanService;

  @Inject
  private IProductService productService;

  @Inject
  private Md5PasswordEncoder md5PasswordEncoder;

  @Inject
  private IUserService userService;

  /**
   * 初始页面
   * 
   * @return
   */
  @RequestMapping(value = "/index")
  public ModelAndView index() {
    ModelAndView mav = new ModelAndView("index");
    // 读取用户 TODO

    // 读取人数
    int number = loanService.getTotalNumber();
    // 读取产品信息
    List<MFinanceProduct> productList = productService.getProductInfo();
    mav.addObject("productList", productList);
    mav.addObject("number", number);
    return mav;
  }

  /**
   * 用户登录
   * 
   * @param request
   * @param response
   * @param loginBean
   * @return
   */
  @RequestMapping(value = "/user/login")
  public JSONMessage login(HttpServletRequest request, HttpServletResponse response,
      LoginBean loginBean) {
    HttpSession session = request.getSession();
    String encodePassword =
        md5PasswordEncoder.encodePassword(loginBean.getUserName(), loginBean.getUserPswd());
    MartUser user = userService.getMartUserInfoByUserName(loginBean.getUserName());
    if (user == null) {
      return new JSONMessage(false, "用户名不存在");
    }
    if (user.getUserPswd().equals(encodePassword)) {
      session.setAttribute("user", loginBean.getUserName());
      return new JSONMessage(true, "登录成功");
    }
    return new JSONMessage(false, "密码错误");
  }

  /**
   * 判断用户名是否存在
   * 
   * @param userName
   * @return
   */
  @RequestMapping(value = "/user/judgeUerNameSame")
  public JSONMessage judgeUerNameSame(String userName) {
    boolean isExist = userService.judgeUserNameIsExist(userName);
    return new JSONMessage(!isExist);
  }

  /**
   * 用户注册
   * 
   * @param request
   * @param response
   * @param MartUser
   * @return
   */
  @RequestMapping(value = "/user/regist")
  public ModelAndView regiset(HttpServletRequest request, HttpServletResponse response,
      MartUser martUser) {
    ModelAndView mav = new ModelAndView("/index");
    // 加密密码
    String encodePassword =
        md5PasswordEncoder.encodePassword(martUser.getUserName(), martUser.getUserPswd());
    martUser.setUserPswd(encodePassword);
    userService.insertMartUser(martUser);
    // 用户信息加入session
    HttpSession session = request.getSession();
    session.setAttribute("user", martUser.getUserName());
    return mav;
  }
}
