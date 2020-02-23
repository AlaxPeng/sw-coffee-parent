package com.nf.controller;

import com.nf.entity.User;
import com.nf.service.UserService;
import com.nf.util.LoginAndRegisterUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @author Alex
 */
@Controller
@RequestMapping("/login")
public class LoginController {

    private final String ACCOUNT_NUMBER = "accountNumber";
    private final String USER = "user";
    private final String CODE = "code";

    @Autowired
    private UserService userService;

    @GetMapping({"","/"})
    public String index(){
        return "login/login";
    }

    @GetMapping("/usernameKeyup")
    @ResponseBody
    public Boolean usernameKeyup(String accountNumber){
        return userService.userCountAccountNumber(accountNumber) != null;
    }

    @GetMapping("/landing")
    @ResponseBody
    public Boolean landing(String accountNumber, String password, HttpSession session){
        session.setAttribute(ACCOUNT_NUMBER,accountNumber);
        User user = userService.userCountUserLogin(accountNumber,password);
        if(user != null){
            session.setAttribute(USER,user);
            session.removeAttribute(ACCOUNT_NUMBER);
            return true;
        }
        return false;
    }

    @GetMapping("/gainCode")
    @ResponseBody
    public String gainCode(String phone,HttpSession session){
        if(phone.equals(userService.userGetPhoneByAccountNumber((String) session.getAttribute(ACCOUNT_NUMBER)))){
            session.setAttribute(CODE, LoginAndRegisterUtils.sendSms(LoginAndRegisterUtils.code(),phone));
            return "1";
        }else {
            return "0";
        }
    }

    @GetMapping("/modalCode")
    @ResponseBody
    public Boolean modalCode(String code,HttpSession session){
        return code.equals(session.getAttribute(CODE));
    }

    @RequestMapping("/updatePassword")
    @ResponseBody
    public Boolean updatePassword(String password,HttpSession session){
        return userService.updatePassword((String) session.getAttribute(ACCOUNT_NUMBER),password);
    }

}
