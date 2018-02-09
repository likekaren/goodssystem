package cn.karen.ssm.util;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

public class DateUtil {

	// 获取 月日日
	public static String getNowDate() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		String dateTime = df.format(new Date());
		return dateTime;
	}

	public static String getNowDateTime() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式

		String dateTime = df.format(new Date());

		return dateTime;
	}

	// 获取 格式 为 201702211001 年月日 时分
	public static String getFormatDateTime() {
		SimpleDateFormat df = new SimpleDateFormat("yyMMddHHmmss");// 设置日期格式
		String dateTime = df.format(new Date());
		return dateTime;
	}

	/**
	 * 获取 集合中的 最小时间
	 * 
	 * @param list
	 * @return
	 */
	public static String getMinDate(List<String> list) {
		if (list.size() == 0) {
			return null;
		}
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Date minDate = df.parse(list.get(0));
			for (String date : list) {
				Date date_i = df.parse(date);
				if (minDate.getTime() > date_i.getTime()) {
					minDate = date_i;
				}
				// System.out.println(date);
			}
			return df.format(minDate);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	/**
	 * 获取 集合中的 最大时间
	 * 
	 * @param list
	 * @return
	 */
	public static String getMaxDate(List<String> list) {
		if (list.size() == 0) {
			return null;
		}
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Date maxDate = df.parse(list.get(0));
			for (String date : list) {
				Date date_i = df.parse(date);
				if (maxDate.getTime() < date_i.getTime()) {
					maxDate = date_i;
				}
				// System.out.println(date);
			}
			return df.format(maxDate);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	/**
	 * 字符串的日期格式的计算
	 */
	public static int getDaysBetween(String smdate, String bdate)
			throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		cal.setTime(sdf.parse(smdate));
		long time1 = cal.getTimeInMillis();
		cal.setTime(sdf.parse(bdate));
		long time2 = cal.getTimeInMillis();
		long between_days = (time2 - time1) / (1000 * 3600 * 24);

		return Integer.parseInt(String.valueOf(between_days));
	}

	public String getTodayStartTime() {
		long current = System.currentTimeMillis();// 当前时间毫秒数
		long zero = current / (1000 * 3600 * 24) * (1000 * 3600 * 24)
				- TimeZone.getDefault().getRawOffset();// 今天零点零分零秒的毫秒数
		long twelve = zero + 24 * 60 * 60 * 1000 - 1;// 今天23点59分59秒的毫秒数
		long yesterday = System.currentTimeMillis() - 24 * 60 * 60 * 1000;// 昨天的这一时间的毫秒数

		String startTime = String.valueOf(new Timestamp(zero));
		int index = startTime.lastIndexOf(".");
		String time = startTime.substring(0, index);
		return time;
	}

	public String getTodayEndTime() {
		long current = System.currentTimeMillis();// 当前时间毫秒数
		long zero = current / (1000 * 3600 * 24) * (1000 * 3600 * 24)
				- TimeZone.getDefault().getRawOffset();// 今天零点零分零秒的毫秒数
		long twelve = zero + 24 * 60 * 60 * 1000 - 1;// 今天23点59分59秒的毫秒数
		long yesterday = System.currentTimeMillis() - 24 * 60 * 60 * 1000;// 昨天的这一时间的毫秒数
		String startTime = String.valueOf(new Timestamp(twelve));
		int index = startTime.lastIndexOf(".");
		String time = startTime.substring(0, index);
		return time;
	}

	public static void main(String[] args) throws Exception {
		/*
		 * List<String> list = new ArrayList<>();
		 * list.add("2017-09-05 15:20:21");
		 */
		/*
		 * list.add("2017-07-05 15:20:21"); list.add("2017-02-18 15:32:12");
		 * list.add("2017-06-05 15:20:21"); list.add("2017-03-18 15:32:12");
		 */
		/*
		 * System.out.println("MAX:" + new DateUtil().getMaxDate(list));
		 * System.out.println("Min:" + new DateUtil().getMinDate(list));
		 */
		/*
		 * System.out.println(DateUtil.getDaysBetween("2017-03-18 15:25:30",
		 * "2017-03-20 17:25:30"));
		 */
		/*
		 * System.out.println(new DateUtil().getTodayStartTime());
		 * System.out.println(new DateUtil().getTodayEndTime()); }
		 */
		System.out.println(new DateUtil().getFormatDateTime());
	}
}
