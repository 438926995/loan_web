package com.eleme.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eleme.bean.JSONMessage;
import com.eleme.domain.loan.TApplyLoan;
import com.eleme.domain.product.MFinanceProduct;
import com.eleme.domain.user.MartUser;
import com.eleme.service.loan.ILoanService;
import com.eleme.service.product.IProductService;
import com.eleme.service.user.IUserService;

@Controller
@RequestMapping(value="/loan")
public class LoanController extends BaseController {
  
  @Inject
  private IProductService productService;
  
  @Inject
  private IUserService userService;
  
  @Inject
  private ILoanService loanService;
  
//  @RequestMapping(value="/apply/{fpId}")
//  public ModelAndView goToLoanPage(HttpServletRequest request, HttpServletResponse response,
//      @PathVariable Integer fpId){
//    ModelAndView mav = new ModelAndView("/loan/apply");
//    // 判断是否登录
//    Object user = request.getSession().getAttribute("user");
//    if(user == null){
//      
//    }
//    mav.addObject("product", productService.getProductInfoByFpId(fpId));
//    return mav;
//  }
  
  @RequestMapping(value="/getProductInfo/{fpId}", method = RequestMethod.GET)
  @ResponseBody
  public MFinanceProduct getProductInfo(HttpServletRequest request, HttpServletResponse response, 
      @PathVariable("fpId") Integer fpId){
    MFinanceProduct mfp = productService.getProductInfoByFpId(fpId);
    return mfp;
  }
  
  @RequestMapping(value="/appLoan", method = RequestMethod.POST)
  @ResponseBody
  public JSONMessage appLoan(HttpServletRequest request, HttpServletResponse response,TApplyLoan loan){
    HttpSession session = request.getSession();
    Object user = session.getAttribute("user");
    if(user == null){
      return new JSONMessage(false, "贷款前请先登录");
    }
    MartUser mUser = userService.getMartUserInfoByUserName(user.toString());
    // 是否可以贷款判断 处于审核中不可贷款
    String appStatus = loanService.getAppStatusByUserId(mUser.getUserId());
    if("P".equals(appStatus)){
      return new JSONMessage(false, "您的申请正在审核中, 不可再次提交申请");
    }
    loan.setUserId(mUser.getUserId());
    int line = loanService.applyLoan(loan);
    if(line == 0){
      return new JSONMessage(false, "申请失败, 请重试");
    }
    return new JSONMessage(true, "恭喜您贷款成功!!!");
  }

  @RequestMapping(value="/revokeLoan", method = RequestMethod.POST)
  @ResponseBody
  public JSONMessage revokeLoan(HttpServletRequest request){
    String userName = getUserName(request);
    MartUser mu = userService.getMartUserInfoByUserName(userName);
    Integer slId = loanService.judgeIfCanRevoke(mu.getUserId());
    if(slId == null){
      return new JSONMessage(false, "当前订单已处理, 不可撤单");
    }
    int line = loanService.revokeLoan(slId);
    if(line > 0){
      return new JSONMessage(true, "撤单成功");
    }
    return new JSONMessage(false, "撤销失败,请重试!");
  }

}
