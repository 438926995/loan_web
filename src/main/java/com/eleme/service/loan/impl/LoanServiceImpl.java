package com.eleme.service.loan.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.eleme.mapper.loan.LoanMapper;
import com.eleme.service.loan.ILoanService;

@Service
public class LoanServiceImpl implements ILoanService {
  
  @Inject
  private LoanMapper loanMapper;
  
  @Override
  public int getTotalNumber() {
    return loanMapper.selectAppLoanTotalNumber();
  }

}
