package com.nf.service.impl;

import com.nf.dao.MembershipGiftsDao;
import com.nf.entity.MembershipGifts;
import com.nf.service.MembershipGiftsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Alex
 */
@Service
public class MembershipGiftServiceImpl implements MembershipGiftsService {

    @Autowired
    private MembershipGiftsDao membershipGiftsDao;

    @Override
    public List<MembershipGifts> select(Integer pageNumber,Integer pageSize) {
        return membershipGiftsDao.select(pageNumber,pageSize);
    }
}
