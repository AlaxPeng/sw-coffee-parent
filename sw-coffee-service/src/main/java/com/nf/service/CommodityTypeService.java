package com.nf.service;

import com.nf.entity.CommodityType;
import com.nf.vo.CommodityTypeVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Alex
 */
public interface CommodityTypeService {

    /**
     * 查询一级标题
     * @return
     */
    List<CommodityType> selectByStair();

    /**
     * 根据Id查询
     * @param id
     * @return
     */
    CommodityType selectById(@Param("commodityTypeNo") Integer id);

    /**
     * 根据外键查询
     * @param commodityTypeSelfId
     * @param commodityTypeId
     * @return
     */
    List<CommodityTypeVO> selectBySelfId(@Param("commodityTypeSelfId") Integer commodityTypeSelfId,
                                         @Param("commodityTypeId") Integer commodityTypeId);
}
