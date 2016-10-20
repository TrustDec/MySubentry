package com.insframework.common.utils;




import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *	日期处理工具类
 */
public class DateUtil {

    // 格式：年－月－日 小时：分钟：秒
    public static final String yyyyMMddHHmmss = "yyyy-MM-dd HH:mm:ss";

    // 格式：年－月－日 小时：分钟
    public static final String yyyyMMddHHmm = "yyyy-MM-dd HH:mm";

    // 格式：年－月－日
    public static final String yyyyMMdd = "yyyy-MM-dd";

    // 格式：年－月－日(中间没有分割符号)
    public static final String yyyyMMdd_NO = "yyyyMMdd";
    
    @SuppressWarnings("unused")
    private static final SimpleDateFormat timeFormat = new SimpleDateFormat(
            "yyyy-MM-dd HH:mm:ss");

    public DateUtil() {
    }

    /**
     * 把符合日期格式的字符串转换为日期类型
     * 
     * @param dateStr
     * @return
     */
    public static java.util.Date stringtoDate(String dateStr, String format) {
        Date d = null;
        SimpleDateFormat formater = new SimpleDateFormat(format);
        try {
            formater.setLenient(false);
            d = formater.parse(dateStr);
        } catch (Exception e) {
            e.printStackTrace();
            d = null;
        }
        return d;
    }

  
    /**
     * 把日期转换为字符串
     * 
     * @param date
     * @return
     */
    public static String dateToString(java.util.Date date, String format) {
        String result = "";
        SimpleDateFormat formater = new SimpleDateFormat(format);
        try {
            result = formater.format(date);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 获取当前时间的指定格式
     * 
     * @param format
     * @return
     */
    public static String getCurrDate(String format) {
        return dateToString(new Date(), format);
    }

   
    /**
     * 两个日期相减
     * 
     * @param firstTime
     * @param secTime
     * @return 相减得到的秒数
     */
    public static long timeSub(String firstTime, String secTime) {
        long first = stringtoDate(firstTime, yyyyMMddHHmmss).getTime();
        long second = stringtoDate(secTime, yyyyMMddHHmmss).getTime();
        return (second - first) / 1000;
    }

    
    /**
     * 获取某年某月的天数
     * 
     * @param year
     *          int
     * @param month
     *          int 月份[1-12]
     * @return int
     */
    public static int getDaysOfMonth(int year, int month) {
        Calendar calendar = Calendar.getInstance();
        calendar.set(year, month - 1, 1);
        return calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
    }

    /**
     * 获得当前日期
     * 
     * @return int
     */
    public static int getToday() {
        Calendar calendar = Calendar.getInstance();
        return calendar.get(Calendar.DATE);
    }

    /**
     * 获得当前月份
     * 
     * @return int
     */
    public static int getToMonth() {
        Calendar calendar = Calendar.getInstance();
        return calendar.get(Calendar.MONTH) + 1;
    }

    /**
     * 获得当前年份
     * 
     * @return int
     */
    public static int getToYear() {
        Calendar calendar = Calendar.getInstance();
        return calendar.get(Calendar.YEAR);
    }

    /**
     * 返回日期的天
     * 
     * @param date
     *          Date
     * @return int
     */
    public static int getDay(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return calendar.get(Calendar.DATE);
    }

    /**
     * 返回日期的年
     * 
     * @param date
     *          Date
     * @return int
     */
    public static int getYear(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return calendar.get(Calendar.YEAR);
    }

    /**
     * 返回日期的月份，1-12
     * 
     * @param date
     *          Date
     * @return int
     */
    public static int getMonth(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return calendar.get(Calendar.MONTH) + 1;
    }

    /**
     * 计算两个日期相差的天数，如果date2 > date1 返回正数，否则返回负数
     * 
     * @param date1
     *          Date
     * @param date2
     *          Date
     * @return long
     */
    public static long dayDiff(Date date1, Date date2) {
        return (date2.getTime() - date1.getTime()) / 86400000;
    }

    /**
     * 比较两个日期的年差
     * 
     * @param befor
     * @param after
     * @return
     */
    public static int yearDiff(String before, String after) {
        Date beforeDay = stringtoDate(before, yyyyMMdd);
        Date afterDay = stringtoDate(after, yyyyMMdd);
        return getYear(afterDay) - getYear(beforeDay);
    }
   

 
}
