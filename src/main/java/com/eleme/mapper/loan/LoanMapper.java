package com.eleme.mapper.loan;

import java.util.List;

import com.eleme.domain.loan.TApplyLoan;

public interface LoanMapper {

  /**
   * 查询申请总人数
   * 
   * @return
   */
  public int selectAppLoanTotalNumber();
  
  public int insertIntoApplyLoan(TApplyLoan loan);
  
  public TApplyLoan selectAppStatus(Integer userId);
  
  public List<TApplyLoan> selectApplyLoanByUserId(Integer userId);

  public int updateApplyLoanToRevoke(Integer slId);

  public TApplyLoan selectNewApplyLoan(Integer userId);

}
