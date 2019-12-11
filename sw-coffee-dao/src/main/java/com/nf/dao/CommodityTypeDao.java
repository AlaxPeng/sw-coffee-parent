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
     * @param id
     * @return
     */
    CommodityType selectById(@Param("commodityTypeNo") Integer id);

}
