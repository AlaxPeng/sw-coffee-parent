package com.nf.service;

import com.nf.entity.Shop;
import com.nf.vo.ShopVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author Alex
 */
public interface ShopService {
    /**
     * 根据地图大小查询
     * @param xMax
     * @param xMin
     * @param yMax
     * @param yMin
     * @return
     */
    List<Shop> getAll(BigDecimal xMax, BigDecimal xMin, BigDecimal yMax, BigDecimal yMin);

    /**
     * 根据ID查询
     * @param shopId
     * @return
     */
    @Transactional(rollbackFor = RuntimeException.class)
    ShopVo getByIdAndTime(@Param("shopId") Integer shopId);
}
