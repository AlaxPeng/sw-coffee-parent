package com.nf.dao;

import com.nf.entity.MembershipTime;
import org.apache.ibatis.annotations.Param;

/**
 * @author Alex
 */
public interface MembershipTimeDao {

    /**
     * 跟用户主键查询
     * @param accountNumber
     * @return
     */
    MembershipTime selectByAccountNumber(@Param("accountNumber") String accountNumber);

}
