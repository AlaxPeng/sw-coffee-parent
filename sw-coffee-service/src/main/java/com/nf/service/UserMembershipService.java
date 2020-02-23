package com.nf.service;

import com.nf.entity.MembershipGrade;
import com.nf.vo.UserMembershipVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Alex
 */
public interface UserMembershipService {

    /**
     * 查询会员等级表，会员时间表，根据用户主键查询
     * @param accountNumber
     * @return
     */
    UserMembershipVO selectMembershipByAccountNumber(@Param("accountNumber") String accountNumber);

    /**
     * 查询所有的会员等级
     * @return
     */
    List<MembershipGrade> select();

    /**
     * 最大的星星数量
     * @return
     */
    Integer selectStarMax();

}
