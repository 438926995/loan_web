package com.eleme.service.loan;

import java.util.List;

import com.eleme.domain.loan.TApplyLoan;

public interface ILoanService {
  
  public int getTotalNumber();
  
  public int applyLoan(TApplyLoan loan);
  
  public String getAppStatusByUserId(Integer userId);
  
  public List<TApplyLoan> getApplyLoanInfoByUserId(Integer userId);

}
