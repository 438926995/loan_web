package com.eleme.service.loan;

import com.eleme.domain.loan.TApplyLoan;

public interface ILoanService {
  
  public int getTotalNumber();
  
  public int applyLoan(TApplyLoan loan);

}
