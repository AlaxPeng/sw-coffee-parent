package com.nf.service.impl;

import com.nf.dao.MembershipGradeDao;
import com.nf.dao.MembershipTimeDao;
import com.nf.entity.MembershipGrade;
import com.nf.entity.MembershipTime;
import com.nf.service.UserMembershipService;
import com.nf.vo.UserMembershipVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Alex
 */
@Service
public class UserMembershipServiceImpl implements UserMembershipService {

    @Autowired
    private MembershipGradeDao membershipGradeDao;
    @Autowired
    private MembershipTimeDao membershipTimeDao;

    @Transactional(rollbackFor = RuntimeException.class)
    @Override
    public UserMembershipVO selectMembershipByAccountNumber(String accountNumber) {
        MembershipTime membershipTime = membershipTimeDao.selectByAccountNumber(accountNumber);
        if(membershipTime == null) {
            return null;
        }
        MembershipGrade membershipGrade = membershipGradeDao.selectById(membershipTime.getMembershipGradeNo());
        UserMembershipVO userMembershipVo = new UserMembershipVO(membershipGrade, membershipTime);
        return userMembershipVo;
    }

    @Override
    public List<MembershipGrade> select() {
        return membershipGradeDao.select();
    }

    @Override
    public Integer selectStarMax() {
        return membershipGradeDao.selectStarMax();
    }
}
