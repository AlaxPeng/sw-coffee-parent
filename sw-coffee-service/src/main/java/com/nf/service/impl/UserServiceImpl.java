package com.nf.service.impl;

import com.nf.dao.UserDao;
import com.nf.entity.User;
import com.nf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Alex
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User userCountAccountNumber(String accountNumber) {
        return userDao.userCountAccountNumber(accountNumber);
    }

    @Override
    public User userCountUserLogin(String accountNumber, String password) {
        return userDao.userCountUserLogin(accountNumber,password);
    }

    @Override
    public String userGetPhoneByAccountNumber(String accountNumber) {
        return userDao.userGetPhoneByAccountNumber(accountNumber);
    }

    @Override
    public Boolean updatePassword(String accountNumber, String password) {
        return userDao.updatePassword(accountNumber,password);
    }

    @Override
    public Boolean userGetByPhone(String phone) {
        return userDao.userGetByPhone(phone)>0;
    }

    @Override
    public Boolean registerUser(User user) {
        return userDao.registerUser(user);
    }

    @Override
    public Boolean updateUser(User user) {
        return userDao.updateUser(user);
    }
}
