package com.eleme.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/loan")
public class LoanController {
  
  @RequestMapping(value="/apply/{fpId}")
  public ModelAndView goToLoanPage(HttpServletRequest request, HttpServletResponse response,
      @PathVariable Integer fpId){
    ModelAndView mav = new ModelAndView("/loan/apply");
    return mav;
  }

}
