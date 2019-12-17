package com.nf.service;

import com.nf.entity.User;
import org.apache.ibatis.annotations.Param;

/**
 * @author Alex
 */
public interface UserService {

    /**
     * 根据账户查询有多少个
     * @param accountNumber
     * @return
     */
    Boolean userCountAccountNumber(@Param("accountNumber") String accountNumber);

    /**
     * 根据账户查询有多少个
     * @param accountNumber
     * @param password
     * @return
     */
    User userCountUserLogin(@Param("accountNumber") String accountNumber, @Param("password") String password);

    /**
     * 根据账号查询绑定手机号
     * @param accountNumber
     * @return
     */
    String userGetPhoneByAccountNumber(@Param("accountNumber") String accountNumber);

    /**
     * 修改密码
     * @param accountNumber
     * @param password
     * @return
     */
    Boolean updatePassword(@Param("accountNumber") String accountNumber, @Param("password") String password);

    /**
     * 根据电话号码查询记录
     * @param phone
     * @return
     */
    Boolean userGetByPhone(@Param("phone") String phone);

    /**
     * 添加
     * @param user
     * @return
     */
    Boolean registerUser(User user);
}
