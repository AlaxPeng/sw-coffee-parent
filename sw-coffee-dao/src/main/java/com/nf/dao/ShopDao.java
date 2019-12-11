package com.nf.dao;

import com.nf.entity.Shop;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author Alex
 */
public interface ShopDao {

    /**
     * 根据地图大小查询
     * @param xMax
     * @param xMin
     * @param yMax
     * @param yMin
     * @return
     */
    List<Shop> getAll(@Param("xMax") BigDecimal xMax, @Param("xMin") BigDecimal xMin, @Param("yMax") BigDecimal yMax, @Param("yMin") BigDecimal yMin);

    /**
     * 根据ID查询
     * @param shopId
     * @return
     */
    Shop getById(@Param("shopId") Integer shopId);
}
