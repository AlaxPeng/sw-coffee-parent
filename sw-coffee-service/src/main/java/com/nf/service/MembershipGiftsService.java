package com.nf.service;

import com.nf.entity.MembershipGifts;

import java.util.List;

/**
 * @author Alex
 */
public interface MembershipGiftsService {

    /**
     * 查询所有的会员礼卷
     * @param pageNumber
     * @param pageSize
     * @return
     */
    List<MembershipGifts> select(Integer pageNumber,Integer pageSize);

}
