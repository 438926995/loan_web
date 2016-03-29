package com.eleme.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

  @RequestMapping(value="/login")
  public ModelAndView login() {
    ModelAndView mav = new ModelAndView("index");
    List<String> list = new ArrayList<>();
    list.add("aaaaa");
    list.add("bbbb");
    list.add("ccc");
    list.add("ddd");
    list.add("eee");
    list.add("fff");
    mav.addObject("list", list);
    mav.addObject("user", "wen");
    return mav;
  }

}
