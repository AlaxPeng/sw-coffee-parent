package com.nf.util;

import com.nf.entity.ShopDate;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @author Alex
 */
public class GetDayOfWeek {
    private static final String[] DAT_NAMES = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
    private static final Integer WEEK_NUMBER = 7;
    private static final String TODAY = "今天";
    private static final String TOMORROW = "明天";
    public static List<ShopDate> getDayOfWeek(List<ShopDate> shopDates) {
        List<ShopDate> shopDateList = new ArrayList<>();
        Calendar calendar = Calendar.getInstance();
        Date date = new Date();
        calendar.setTime(date);
        int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK) - 1;
        int i = 0;
        int end = 0;
        for (ShopDate shopDate : shopDates) {
            if(dayOfWeek == Integer.parseInt(shopDate.getWed())) {
                shopDate.setWed(TODAY);
                shopDateList.add(shopDate);
                ShopDate shopDateTwo = shopDates.get(i+1);
                shopDateTwo.setWed(TOMORROW);
                shopDateList.add(shopDateTwo);
                end = i;
                break;
            }
            i++;
        }
        if(i == 5){
            i = 0;
        } else if(i == 6){
            i = 1;
        }else {
            i += 2;
        }
        for (;i<WEEK_NUMBER;i++) {
            if(i == end){
                break;
            }
            ShopDate shopDate = shopDates.get(i);
            shopDate.setWed(DAT_NAMES[i]);
            shopDateList.add(shopDate);
            if(i==6){
                i=-1;
            }
        }
        return shopDateList;
    }
}