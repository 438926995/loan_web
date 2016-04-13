package com.eleme.domain.product;

/**
 * 产品规则表实体类
 * 
 * @author huwenwen
 *
 */
public class ProductRule {
  private Integer prId;
  private Integer fpId;
  private String ruleName;
  private String ruleContent;
  private Integer ruleType;

  public Integer getPrId() {
    return prId;
  }

  public void setPrId(Integer prId) {
    this.prId = prId;
  }

  public Integer getFpId() {
    return fpId;
  }

  public void setFpId(Integer fpId) {
    this.fpId = fpId;
  }

  public String getRuleName() {
    return ruleName;
  }

  public void setRuleName(String ruleName) {
    this.ruleName = ruleName;
  }

  public String getRuleContent() {
    return ruleContent;
  }

  public void setRuleContent(String ruleContent) {
    this.ruleContent = ruleContent;
  }

  public Integer getRuleType() {
    return ruleType;
  }

  public void setRuleType(Integer ruleType) {
    this.ruleType = ruleType;
  }

}
