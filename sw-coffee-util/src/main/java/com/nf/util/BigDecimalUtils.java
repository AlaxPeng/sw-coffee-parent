package com.nf.util;

import java.math.BigDecimal;

/**
 * @author Alex
 */
public class BigDecimalUtils {
    public static BigDecimal bigDecimal(String number) {
        BigDecimal bigDecimal = null;
        if(number != null && number.length()>0){
            bigDecimal = new BigDecimal(number);
        }
        bigDecimal = bigDecimal.setScale(6,BigDecimal.ROUND_HALF_UP);
        return bigDecimal;
    }
}
