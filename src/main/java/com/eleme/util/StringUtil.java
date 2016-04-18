package com.eleme.util;

public class StringUtil {

  /**
   * 根据身份证号码得到男女
   * 
   * @param sid
   * @return
   */
  public static Integer getSexBySid(String sid) {
    int flag;
    if (sid.length() == 15) {
      flag = Integer.parseInt(sid.substring(14));
    } else {
      flag = Integer.parseInt(sid.substring(16, 17));
    }
    return (flag & 1) == 1 ? 1 : 2;
  }

}
