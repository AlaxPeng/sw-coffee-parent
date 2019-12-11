package com.nf.dao;

import com.nf.entity.CommodityMessage;
import com.nf.entity.CommodityType;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * @author Alex
 */
public interface CommodityMessageDao {

    /**
     * 查询最新发表的
     * @return
     */
    List<CommodityMessage> selectByTime();

    /**
     * 根据类型查询
     * @param typeId
     * @return
     */
    List<CommodityMessage> selectByTypeId(@Param("typeId") Integer typeId);

    /**
     * 修改
     * @param messageNo
     * @return
     */
    Integer updateNumber(@Param("messageNo") Integer messageNo);

    /**
     * 根据ID
     * @param messageNo
     * @return
     */
    CommodityMessage selectById(@Param("messageNo") Integer messageNo);

}
