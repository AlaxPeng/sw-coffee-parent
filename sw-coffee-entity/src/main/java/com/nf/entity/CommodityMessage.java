package com.nf.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author Alex
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommodityMessage {

    private Integer commodityMessageNo;
    private String commodityMessageName;
    private Date commodityStartTime;
    private String commodityMessageImg;
    private String commodityMessageSynopsis;
    private BigDecimal commodityMessageMoney;
    private BigDecimal commodityMessageNumber;
    private Integer commodityTypeNo;

}
