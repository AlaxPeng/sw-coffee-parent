package com.nf.dao;

import com.nf.entity.CommodityType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Alex
 */
public interface CommodityTypeDao {

    /**
     * 查询一级标题
     * @return
     */
    List<CommodityType> selectByStair();

    /**
     * 根据Id查询
     * @param commodityTypeNo
     * @return
     */
    CommodityType selectById(@Param("commodityTypeNo") Integer commodityTypeNo);

    /**
     * 根据外键查询
     * @param commodityTypeSelfId
     * @param commodityTypeId
     * @return
     */
    List<CommodityType> selectBySelfId(@Param("commodityTypeSelfId") Integer commodityTypeSelfId,
                                       @Param("commodityTypeId") Integer commodityTypeId);

}
