package com.nf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author Alex
 */
@Controller
public class AccountController {

    @RequestMapping({"","/","/account"})
    public String index(){
        return "account/account";
    }

}
