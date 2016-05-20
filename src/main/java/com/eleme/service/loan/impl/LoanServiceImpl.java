package com.eleme.service.loan.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
    Date date = new Date();
    String format = sdf.format(date);
    loan.setDocNo(format + loan.getUserId());
    loan.setSubmitTime(date);
    return loanMapper.insertIntoApplyLoan(loan);
  }

  @Override
  public String getAppStatusByUserId(Integer userId) {
    TApplyLoan al = loanMapper.selectAppStatus(userId);
    if(al == null){
      return "";
    }
    return al.getAppStatus();
  }

  @Override
  public List<TApplyLoan> getApplyLoanInfoByUserId(Integer userId) {
    return loanMapper.selectApplyLoanByUserId(userId);
  }

  @Override
  public int revokeLoan(Integer slId) {
    return loanMapper.updateApplyLoanToRevoke(slId);
  }

  @Override
  public Integer judgeIfCanRevoke(Integer userId) {
    TApplyLoan loan = loanMapper.selectNewApplyLoan(userId);
    if(loan == null){
      return null;
    }
    // 只有审核中可以撤单
    if("P".equals(loan.getAppStatus())){
      return loan.getSlId();
    }
    return null;
  }

}
