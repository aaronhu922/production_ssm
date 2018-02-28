package org.hqu.production_ms.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * 各种id生成策略
 * <p>
 * Title: IDUtils
 * </p>
 * <p>
 * Description:
 * </p>
 */
public class IDUtils {

	private static AtomicInteger aid = new AtomicInteger(new Random().nextInt(9999));
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");


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
	public static String genStringId() {
		// 取当前时间的长整形值包含毫秒
		long millis = System.currentTimeMillis();
		// long millis = System.nanoTime();
		// 加上两位随机数
		Random random = new Random();
		int end2 = random.nextInt(99);
		// 如果不足两位前面补0
		String id = millis + String.format("%02d", end2);
		return id;
	}

	/**
	 * long型id生成
	 */
	public static long genLongId() {
		// 取当前时间的长整形值包含毫秒
		long millis = System.currentTimeMillis();
		// long millis = System.nanoTime();
		// 加上两位随机数
		Random random = new Random();
		int end2 = random.nextInt(99);
		// 如果不足两位前面补0
		String str = millis + String.format("%02d", end2);
		long id = new Long(str);
		return id;
	}

	/**
	 * long型id生成
	 * 
	 * @throws ParseException
	 */
	public static String genOrderId() throws ParseException {
		String sToday = sdf.format(new Date());
		int newId = aid.incrementAndGet()%10000;
		String str = sToday + newId;
		return str;
	}

	public static void main(String[] args) {
		for (int i = 0; i < 100; i++)
			try {
				System.out.println(IDUtils.genOrderId());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}
}
