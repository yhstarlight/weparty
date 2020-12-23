package com.weparty.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class CalDateUtil {

	public static int calDateBetween(String endday) throws ParseException{
		
		SimpleDateFormat origin_format = new SimpleDateFormat ("yyyy/MM/dd");
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd");
		
		Calendar todayCal = Calendar.getInstance();
		
		String today = format.format(todayCal.getTime());
		Date firstDay = origin_format.parse("20"+endday);
		endday = format.format(firstDay);
		
		firstDay = format.parse(endday);
		Date secondDay = format.parse(today);
		
		long calDate = firstDay.getTime() - secondDay.getTime(); 

        long calDateDays = calDate / ( 24*60*60*1000); 
 
        calDateDays = Math.abs(calDateDays);
        
        return (int)calDateDays;

	}
}
