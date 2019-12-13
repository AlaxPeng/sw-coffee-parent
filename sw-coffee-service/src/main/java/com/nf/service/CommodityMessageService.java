package com.nf.service;

import com.nf.entity.CommodityMessage;
import com.nf.vo.CommodityMessageVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Alex
 */
public interface CommodityMessageService {

    /**
     * 查询最新产品
     * @return
     */
    List<CommodityMessageVo> selectByTime();
    /**
     * 根据类型查询查询点击量最多的前4条
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
     * 根据messageNo查询数据
     * @param messageNo
     * @return
     */
    CommodityMessageVo selectByMessageNo(Integer messageNo);

    /**
     * 根据点击量查询前5
     * @return
     */
    List<CommodityMessage> selectByNumber();

    /**
     * 根据名字右模糊查询
     * @param messageName
     * @return
     */
    List<CommodityMessage> selectByName(@Param("messageName") String messageName);
}
