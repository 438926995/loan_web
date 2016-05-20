package com.eleme.service.loan;

import java.util.List;

import com.eleme.domain.loan.TApplyLoan;

public interface ILoanService {
  
  public int getTotalNumber();
  
  public int applyLoan(TApplyLoan loan);
  
  public String getAppStatusByUserId(Integer userId);
  
  public List<TApplyLoan> getApplyLoanInfoByUserId(Integer userId);

  public int revokeLoan(Integer slId);

  /**
   * 判断是否可以撤单,正常返回slId
   * @param userId
   * @return 返回null不能撤单
   */
  public Integer judgeIfCanRevoke(Integer userId);

}
