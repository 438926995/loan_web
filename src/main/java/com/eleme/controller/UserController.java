package com.eleme.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.eleme.domain.loan.TApplyLoan;
import com.eleme.domain.user.MartUser;
import com.eleme.service.loan.ILoanService;
import com.eleme.service.user.IUserService;

/**
 * 个人中心
 * @author huwenwen
 *
 */
@Controller
@RequestMapping(value="/user")
public class UserController extends BaseController {
  
  @Inject
  private IUserService userService;
  
  @Inject ILoanService loanService;
  
  @RequestMapping(value="/center", method = RequestMethod.GET)
  public ModelAndView center(HttpServletRequest request){
    ModelAndView mav = new ModelAndView("user/center");
    String userName = getUserName(request);
    if(userName == null){
      mav.setViewName("index");
      return mav;
    }
    // 获得个人信息,贷款信息
    MartUser martUser = userService.getMartUserInfoByUserName(userName);
    List<TApplyLoan> loan = loanService.getApplyLoanInfoByUserId(martUser.getUserId());
    TApplyLoan nowProcess = null;
    if(!loan.isEmpty()){
      nowProcess = loan.get(0);
    }
    mav.addObject("martUser", martUser);
    mav.addObject("loan", loan);
    mav.addObject("nowProcess", nowProcess);
    return mav;
  }

}
