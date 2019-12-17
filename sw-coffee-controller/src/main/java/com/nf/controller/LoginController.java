package com.nf.controller;

import com.nf.entity.User;
import com.nf.service.UserService;
import com.nf.util.LoginAndRegisterUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @author Alex
 */
@Controller
@RequestMapping("/login")
public class LoginController {

    private String accountNumber;
    private final String CODE = "code";

    @Autowired
    private UserService userService;

    @RequestMapping({"","/"})
    public String index(){
        return "login/login";
    }

    @RequestMapping("/usernameKeyup")
    @ResponseBody
    public Boolean usernameKeyup(String accountNumber){
        return userService.userCountAccountNumber(accountNumber);
    }

    @RequestMapping("/landing")
    @ResponseBody
    public Boolean landing(String accountNumber, String password, HttpSession session){
        this.accountNumber = accountNumber;
        User user = userService.userCountUserLogin(accountNumber,password);
        if(user != null){
            session.setAttribute("user",user);
            return true;
        }
        return false;

    }

    @RequestMapping("/gainCode")
    @ResponseBody
    public String gainCode(String phone,HttpSession session){
        System.out.println("accountNumber = " + accountNumber);
        if(phone.equals(userService.userGetPhoneByAccountNumber(accountNumber))){
            session.setAttribute("code", LoginAndRegisterUtils.sendSms(LoginAndRegisterUtils.code(),phone));
            return "1";
        }else {
            return "0";
        }
    }

    @RequestMapping("/modalCode")
    @ResponseBody
    public Boolean modalCode(String code,HttpSession session){
        return code.equals(session.getAttribute(CODE));
    }

    @RequestMapping("/updatePassword")
    @ResponseBody
    public Boolean updatePassword(String password){
        return userService.updatePassword(accountNumber,password);
    }

}
