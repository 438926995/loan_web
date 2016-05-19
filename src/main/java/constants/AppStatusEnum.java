package constants;

/**
 * 审核状态枚举
 * 
 * @author huwenwen
 *
 */
public enum AppStatusEnum {

  PASS("C", "通过"), DIS_PASS("D", "未通过"), AUDIT("P", "审核中"), REVOKE("R", "撤销");

  private String appStauts;
  private String name;

  private AppStatusEnum(String appStauts, String name) {
    this.appStauts = appStauts;
    this.name = name;
  }

  public String getAppStauts() {
    return appStauts;
  }

  public void setAppStauts(String appStauts) {
    this.appStauts = appStauts;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

}
