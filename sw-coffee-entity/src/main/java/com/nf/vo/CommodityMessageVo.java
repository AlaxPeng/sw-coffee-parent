package com.nf.vo;

import com.nf.entity.CommodityMessage;
import com.nf.entity.CommodityType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Alex
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommodityMessageVo {

    private CommodityMessage commodityMessage;
    private CommodityType commodityType;

}
