package com.nf.controller;

import com.github.pagehelper.PageInfo;
import com.nf.vo.ResponseVO;
import com.nf.entity.MembershipGrade;
import com.nf.entity.User;
import com.nf.service.MembershipGiftsService;
import com.nf.service.UserMembershipService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;

/**
 * @author Alex
 */
@Controller
@Api(tags = "account")
public class AccountController {

    private final Integer PAGE_SIZE = 4;
    private final String USER = "user";

    @Autowired
    private MembershipGiftsService membershipGiftsService;

    @Autowired
    private UserMembershipService userMembershipService;

    @ApiOperation("登录")
    @GetMapping({"","/","/account"})
    public ModelAndView index(HttpSession session){
        User user = (User) session.getAttribute(USER);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("user",user);
        modelAndView.addObject("userMembershipVo",
                userMembershipService.selectMembershipByAccountNumber(user.getAccountNumber()));
        modelAndView.addObject("membershipGiftsPageInfo",
                new PageInfo(membershipGiftsService.select(0,PAGE_SIZE)));
        modelAndView.setViewName("account/account");
        return modelAndView;
    }

    @ApiOperation("返回会员好礼的分业结果")
    @GetMapping("/account/membershipGiftsPageInfo/page/{pageNumber}")
    @ResponseBody
    public ResponseVO membershipGiftsList(@PathVariable Integer pageNumber){
        return ResponseVO.newBuilder().data(
                new PageInfo(membershipGiftsService.select(pageNumber,PAGE_SIZE)))
                .code("200").msg("成功").build();
    }

    @GetMapping("/account/userMembershipDTO")
    @ResponseBody
    public ResponseVO userMembershipDTO(HttpSession session){
        User user = (User) session.getAttribute(USER);
        return ResponseVO.newBuilder().data(
                userMembershipService.selectMembershipByAccountNumber(user.getAccountNumber()))
                .code("200").msg("成功").build();
    }

    @ModelAttribute("membershipGradeList")
    public List<MembershipGrade> membershipGradeList(){
        return userMembershipService.select();
    }

    @ModelAttribute("membershipStarMax")
    public Integer membershipStarMax(){
        return userMembershipService.selectStarMax();
    }

    @GetMapping("/account/profile")
    public ModelAndView profile(HttpSession session){
        User user = (User) session.getAttribute(USER);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject(USER,user);
        modelAndView.setViewName("account/profile");
        return modelAndView;
    }


    @GetMapping("/account/profile/personal")
    public ModelAndView personal(HttpSession session){
        User user = (User) session.getAttribute(USER);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject(USER,user);
        modelAndView.setViewName("/account/profile/personal");
        return modelAndView;
    }

    @PutMapping("/account/profile/updateUser")
    @ResponseBody
    public ResponseVO updateUser(@RequestBody User user, MultipartFile file, HttpSession session){
        user.setAccountNumber(((User)session.getAttribute(USER)).getAccountNumber());
        System.out.println(file);
        return ResponseVO.newBuilder().code("200").build();
    }

}
