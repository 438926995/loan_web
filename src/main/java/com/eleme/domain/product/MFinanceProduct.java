package com.eleme.domain.product;

import java.util.List;

/**
 * 产品表实体类
 * 
 * @author huwenwen
 *
 */
public class MFinanceProduct {
  private Integer fpId;
  private String fpName;
  private Integer minLoanAmount;
  private Integer maxLoanAmount;
  private String payLimit;
  private double minRaitRatio;
  private double maxRaitRatio;
  private String imageUrl;
  private List<ProductRule> productRuleList;

  public String getImageUrl() {
    return imageUrl;
  }

  public void setImageUrl(String imageUrl) {
    this.imageUrl = imageUrl;
  }

  public Integer getFpId() {
    return fpId;
  }

  public void setFpId(Integer fpId) {
    this.fpId = fpId;
  }

  public String getFpName() {
    return fpName;
  }

  public void setFpName(String fpName) {
    this.fpName = fpName;
  }

  public Integer getMinLoanAmount() {
    return minLoanAmount;
  }

  public void setMinLoanAmount(Integer minLoanAmount) {
    this.minLoanAmount = minLoanAmount;
  }

  public Integer getMaxLoanAmount() {
    return maxLoanAmount;
  }

  public void setMaxLoanAmount(Integer maxLoanAmount) {
    this.maxLoanAmount = maxLoanAmount;
  }

  public String getPayLimit() {
    return payLimit;
  }

  public void setPayLimit(String payLimit) {
    this.payLimit = payLimit;
  }

  public double getMinRaitRatio() {
    return minRaitRatio;
  }

  public void setMinRaitRatio(double minRaitRatio) {
    this.minRaitRatio = minRaitRatio;
  }

  public double getMaxRaitRatio() {
    return maxRaitRatio;
  }

  public void setMaxRaitRatio(double maxRaitRatio) {
    this.maxRaitRatio = maxRaitRatio;
  }

  public List<ProductRule> getProductRuleList() {
    return productRuleList;
  }

  public void setProductRuleList(List<ProductRule> productRuleList) {
    this.productRuleList = productRuleList;
  }

}
