package com.eleme.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eleme.bean.ChangePasswordBean;
import com.eleme.bean.FeedbackQueryBean;
import com.eleme.bean.JSONMessage;
import com.eleme.bean.PageQueryBean;
import com.eleme.bean.PageResData;
import com.eleme.domain.user.UserFeedback;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eleme.domain.loan.TApplyLoan;
import com.eleme.domain.user.MartUser;
import com.eleme.service.loan.ILoanService;
import com.eleme.service.user.IUserService;

/**
 * 个人中心
 *
 * @author huwenwen
 */
@Controller
@RequestMapping(value = "/user")
public class UserController extends BaseController {

  @Inject
  private IUserService userService;

  @Inject
  private ILoanService loanService;

  @Inject
  private Md5PasswordEncoder md5PasswordEncoder;


  @RequestMapping(value = "/center", method = RequestMethod.GET)
  public ModelAndView center(HttpServletRequest request) {
    ModelAndView mav = new ModelAndView("user/center");
    String userName = getUserName(request);
    if (userName == null) {
      mav.setViewName("index");
      return mav;
    }
    // 获得个人信息,贷款信息
    MartUser martUser = userService.getMartUserInfoByUserName(userName);
    List<TApplyLoan> loan = loanService.getApplyLoanInfoByUserId(martUser.getUserId());
    TApplyLoan nowProcess = null;
    if (!loan.isEmpty()) {
      nowProcess = loan.get(0);
    }
    mav.addObject("martUser", martUser);
    mav.addObject("loan", loan);
    mav.addObject("nowProcess", nowProcess);
    return mav;
  }

  @RequestMapping(value = "/editUser", method = RequestMethod.POST)
  public ModelAndView editUser(HttpServletRequest request, MartUser mu) {
    ModelAndView mav = new ModelAndView();
    String userName = getUserName(request);
    if (userName == null) {
      mav.setViewName("index");
      return mav;
    }
    MartUser oldMu = userService.getMartUserInfoByUserName(userName);
    mu.setUserId(oldMu.getUserId());
    userService.updateMartUser(mu);
    mav.setViewName("redirect:center");
    return mav;
  }

  @RequestMapping(value = "/saveUserFeedback", method = RequestMethod.POST)
  @ResponseBody
  public JSONMessage saveUserFeedback(HttpServletRequest request, HttpServletResponse response,
      UserFeedback feedback) {
    String userName = getUserName(request);
    MartUser mu = userService.getMartUserInfoByUserName(userName);
    feedback.setUserId(mu.getUserId());
    feedback.setUserName(mu.getUserName());
    int line = userService.saveUserFeedback(feedback);
    if (line > 0) {
      return new JSONMessage(true, "反馈成功");
    }
    return new JSONMessage(false, "反馈失败, 请稍后再试");
  }

  @RequestMapping(value = "/getUserFeedbackHistory", method = RequestMethod.GET)
  @ResponseBody
  public JSONMessage getUserFeedbackHistory(HttpServletRequest request, FeedbackQueryBean fqb) {
    String userName = getUserName(request);
    MartUser mu = userService.getMartUserInfoByUserName(userName);
    fqb.setUserId(mu.getUserId());
    PageResData<UserFeedback> result = userService.getUserFeedBackList(fqb);
    JSONMessage json = new JSONMessage();
    json.setDatas(result);
    json.setIsSuccess(true);
    return json;
  }

  /**
   * 修改密码
   * @param request
   * @param cpb
   * @return
   */
  @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
  @ResponseBody
  public JSONMessage changePassword(HttpServletRequest request, ChangePasswordBean cpb) {
    MartUser mu = userService.getMartUserInfoByUserName(getUserName(request));
    // 判断老密码是否正确
    String encodePassword = md5PasswordEncoder.encodePassword(mu.getUserName(), cpb.getOldPwd());
    if(!mu.getUserPswd().equals(encodePassword)){
      return new JSONMessage(false, "旧密码不正确");
    }
    // 可以修改密码
    String newEncodePassword = md5PasswordEncoder.encodePassword(mu.getUserName(), cpb.getNewPwd());
    cpb.setNewPwd(newEncodePassword);
    cpb.setUserId(mu.getUserId());
    int line = userService.changeUserPassword(cpb);
    if(line > 0){
      HttpSession session = request.getSession();
      session.invalidate();
      return new JSONMessage(true, "修改密码成功, 请重新登录");
    }
    return new JSONMessage(false, "修改密码失败, 请重试");
  }

}
