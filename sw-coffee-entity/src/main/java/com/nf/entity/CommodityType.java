package com.nf.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Alex
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommodityType {
    private Integer commodityTypeNo;
    private String commodityTypeName;
    private String commodityTypeSynopsis;
    private Boolean commodityTypeStair;
    private Integer commodityTypeSelfNo;
}
