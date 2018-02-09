package cn.karen.ssm.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * 各种id生成策略
 * <p>
 * Title: IDUtils
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Company: www.itcast.com
 * </p>
 * 
 * @author 入云龙
 * @date 2015年7月22日下午2:32:10
 * @version 1.0
 */
public class IDUtils {

	/**
	 * 图片名生成
	 */
	public static String genImageName() {
		// 取当前时间的长整形值包含毫秒
		long millis = System.currentTimeMillis();
		// long millis = System.nanoTime();
		// 加上三位随机数
		Random random = new Random();
		int end3 = random.nextInt(999);
		// 如果不足三位前面补0
		String str = millis + String.format("%03d", end3);

		return str;
	}

	/**
	 * 商品id生成
	 */
	public static long genItemId() {
		// 取当前时间的长整形值包含毫秒
		Date date = new Date();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date);
		String string1 = time.substring(0, 4);
		String string2 = time.substring(5, 7);
		String string3 = time.substring(8, 10);
		String string4 = time.substring(11, 13);
		String string5 = time.substring(14, 16);
		String string6 = time.substring(17, 19);
		// long millis = System.currentTimeMillis();
		// long millis = System.nanoTime();
		// 加上两位随机数
		Random random = new Random();
		int end2 = random.nextInt(9999);
		// 如果不足两位前面补0
		String str = string1 + string2 + string3 + string4 + string5 + string6
				+ String.format("%02d", end2);
		long id = new Long(str);
		return id;
	}

	public static void main(String[] args) {
		for (int i = 0; i < 100; i++)
			System.out.println(genItemId());
	}
}
