package com.eleme.mapper.loan;

import com.eleme.domain.loan.TApplyLoan;

public interface LoanMapper {

  /**
   * 查询申请总人数
   * 
   * @return
   */
  public int selectAppLoanTotalNumber();
  
  public int insertIntoApplyLoan(TApplyLoan loan);

}
