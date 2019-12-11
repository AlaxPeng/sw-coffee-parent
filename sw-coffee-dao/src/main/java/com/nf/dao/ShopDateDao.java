package com.nf.dao;

import com.nf.entity.ShopDate;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Alex
 */
public interface ShopDateDao {

    /**
     * 根据shopId查询
     * @param shopId
     * @return
     */
    List<ShopDate> getByShopId(@Param("shopId") Integer shopId);
}
