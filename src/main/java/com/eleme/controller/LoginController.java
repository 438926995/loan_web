package com.eleme.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eleme.service.loan.ILoanService;

@Controller
public class LoginController {
  
  @Inject
  private ILoanService loanService;
  
  @RequestMapping(value="/login")
  public ModelAndView login() {
    ModelAndView mav = new ModelAndView("index");
    // 读取用户
    // 读取人数
    int number = loanService.getTotalNumber();
    // 读取产品信息
//    mav.addObject("list", list);
    mav.addObject("user", "wen");
    mav.addObject("number", number);
    return mav;
  }

}
