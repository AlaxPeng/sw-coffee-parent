package com.nf.vo;

import com.nf.entity.CommodityMessage;
import com.nf.entity.CommodityType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author Alex
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommodityTypeVO {

    CommodityType commodityParentType;
    CommodityType commodityType;
    List<CommodityMessage> commodityMessages;

}
