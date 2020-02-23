package com.nf.dao;

import com.nf.entity.MembershipGifts;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 会员礼卷
 * @author Alex
 */
public interface MembershipGiftsDao {

    /**
     * 查询所有的会员礼卷
     * @param pageNum
     * @param pageSize
     * @return
     */
    List<MembershipGifts> select(@Param("pageNum") Integer pageNum, @Param("pageSize") Integer pageSize);

}
