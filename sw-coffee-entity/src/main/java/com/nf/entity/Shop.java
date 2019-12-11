package com.nf.entity;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author Alex
 */
@Data
public class Shop {
    private String shopName;
    private Integer shopNo;
    private Date startTime;
    private String province;
    private String city;
    private String zipCode;
    private String detailedAddress;
    private String phone;
    private BigDecimal coordinateX;
    private BigDecimal coordinateY;
}
