package com.eleme.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 时间格式化工具类
 * Created by huwenwen on 16/5/20.
 */

public class DateUtil {

  /**
   * 时间格式化为yyyy-MM-dd HH:mm:ss
   * @param time
   * @return
   */
  public static String dateFormatDateTimeString(Date time){
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    return sdf.format(time);
  }

  /**
   * 时间格式化为yyyy-MM-dd
   * @param time
   * @return
   */
  public static String dateFormatDateString(Date time){
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    return sdf.format(time);
  }
}
