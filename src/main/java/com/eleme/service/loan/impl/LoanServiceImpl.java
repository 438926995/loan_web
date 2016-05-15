package com.eleme.service.loan.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.eleme.domain.loan.TApplyLoan;
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

  @Override
  public int applyLoan(TApplyLoan loan) {
    loan.setAppStatus("P");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date date = new Date();
    String format = sdf.format(date);
    int random = (int) Math.random() * 1000;
    loan.setDocNo(format + random + loan.getUserId());
    loan.setSubmitTime(date);
    return loanMapper.insertIntoApplyLoan(loan);
  }

}
