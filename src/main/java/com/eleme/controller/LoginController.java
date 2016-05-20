package com.eleme.controller;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.eleme.bean.LoginBean;
import com.eleme.domain.product.MFinanceProduct;
import com.eleme.domain.user.MartUser;
import com.eleme.service.loan.ILoanService;
import com.eleme.service.product.IProductService;
import com.eleme.service.user.IUserService;
import com.eleme.util.StringUtil;

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
  @RequestMapping(value = "/index", method = RequestMethod.GET)
  public ModelAndView index(Integer open) {
    ModelAndView mav = new ModelAndView("index");
    // 读取人数
    int number = loanService.getTotalNumber();
    // 读取产品信息
    List<MFinanceProduct> productList = productService.getProductInfo();
    mav.addObject("productList", productList);
    mav.addObject("number", number);
    mav.addObject("open", open);
    return mav;
  }

  /**
   * 用户登录
   * 
   * @param request
   * @param response
   * @param loginBean
   * @return
   * @throws IOException
   */
  @RequestMapping(value = "/user/login", method = RequestMethod.POST)
  public void login(HttpServletRequest request, HttpServletResponse response, LoginBean loginBean)
      throws IOException {
    response.setContentType("application/json; charset=UTF-8");
    HttpSession session = request.getSession();
    String encodePassword =
        md5PasswordEncoder.encodePassword(loginBean.getUserName(), loginBean.getUserPswd());
    MartUser user = userService.getMartUserInfoByUserName(loginBean.getUserName());
    if (user == null) {
      response.getWriter().println("{\"isSuccess\" : false}");
      return;
      // return new JSONMessage(false, "用户名不存在");
    }
    if (user.getUserPswd().equals(encodePassword)) {
      session.setAttribute("user", loginBean.getUserName());
      response.getWriter().println("{\"isSuccess\" : true}");
      // return new JSONMessage(true, "登录成功");
    } else {
      response.getWriter().println("{\"isSuccess\" : false}");
    }
    // return new JSONMessage(false, "密码错误");
  }

  /**
   * 判断用户名是否存在
   * 
   * @param userName
   * @return
   * @throws IOException 
   */
  @RequestMapping(value = "/user/judgeUerNameSame", method = RequestMethod.POST)
  public void judgeUerNameSame(HttpServletRequest request, HttpServletResponse response, String userName) throws IOException {
    response.setContentType("application/json; charset=UTF-8");
    boolean isExist = userService.judgeUserNameIsExist(userName);
    response.getWriter().print("{\"isSuccess\" : "+ !isExist + "}");
  }

  /**
   * 用户注册
   * 
   * @param request
   * @param response
   * @param MartUser
   * @return
   * @throws IOException 
   */
  @RequestMapping(value = "/user/regist", method = RequestMethod.POST)
  public void regiset(HttpServletRequest request, HttpServletResponse response,
      MartUser martUser) throws IOException {
    // 加密密码
    String encodePassword =
        md5PasswordEncoder.encodePassword(martUser.getUserName(), martUser.getUserPswd());
    martUser.setUserPswd(encodePassword);
    martUser.setUserSex(StringUtil.getSexBySid(martUser.getUserSid()));
    userService.insertMartUser(martUser);
    // 用户信息加入session
    HttpSession session = request.getSession();
    session.setAttribute("user", martUser.getUserName());
    // 重定向到主页面
    response.sendRedirect("../index");
  }

  /**
   * 退出
   * 
   * @param request
   * @param response
   */
  @RequestMapping(value = "/user/logout", method = RequestMethod.POST)
  public void logout(HttpServletRequest request, HttpServletResponse response) {
    HttpSession session = request.getSession();
    session.invalidate();
  }
}
