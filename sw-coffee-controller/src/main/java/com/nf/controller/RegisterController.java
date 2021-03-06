package com.nf.controller;

import com.nf.vo.ResponseVO;
import com.nf.entity.User;
import com.nf.service.UserService;
import com.nf.util.LoginAndRegisterUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * @author Alex
 */

@Controller
@RequestMapping("/register")
public class RegisterController {

    private final String CODE = "code";

    @Autowired
    private UserService userService;

    @RequestMapping({"","/"})
    public String index(){
        return "register/register";
    }

    @RequestMapping("/phoneKeyUp")
    @ResponseBody
    public Boolean phoneKeyUp(String phone){
        return userService.userGetByPhone(phone);
    }

    @RequestMapping("/begin")
    @ResponseBody
    public String begin(String phone, String code,HttpSession session){
        if(phone.trim() != null && !phone.trim().equals("") ){
            if(code.equals(session.getAttribute(CODE))){
                session.setAttribute("phone",phone);
                return LoginAndRegisterUtils.accountNumber(phone);
            }else {
                return "0";
            }
        }else {
            if(code.equals(session.getAttribute(CODE))){
                return "1";
            }
            return "0";
        }
    }

    @RequestMapping("/gainCode")
    @ResponseBody
    public Boolean gainCode(String phone,HttpSession session){
        String code = LoginAndRegisterUtils.sendSms(LoginAndRegisterUtils.code(),phone);
        session.setAttribute("code",code);
        return true;
    }

    @RequestMapping("/end")
    @ResponseBody
    public ModelAndView end(String accountNumber){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("register/endRegister");
        modelAndView.addObject("accountNumber",accountNumber);
        return modelAndView;
    }

    @PostMapping("insert")
    @ResponseBody
    public ResponseVO insert(User user, HttpSession session){
        user.setPhone((String) session.getAttribute("phone"));
        if (userService.registerUser(user)){
            session.setAttribute("user",user);
            return ResponseVO.newBuilder().code("200").build();
        }else {
            return ResponseVO.newBuilder().code("500").msg("添加数据异常").build();
        }
    }

}
