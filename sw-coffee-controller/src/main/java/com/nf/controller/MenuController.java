package com.nf.controller;

import com.nf.entity.CommodityMessage;
import com.nf.entity.CommodityType;
import com.nf.service.CommodityMessageService;
import com.nf.service.CommodityTypeService;
import com.nf.vo.CommodityMessageVo;
import com.nf.vo.CommodityTypeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author Alex
 */
@Controller
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private CommodityTypeService commodityTypeService;

    @Autowired
    private CommodityMessageService commodityMessageService;

    @ModelAttribute("commodityTypeList")
    public List<CommodityType> commodityTypeList(){
        return commodityTypeService.selectByStair();
    }

    @ModelAttribute("commodityMessageList")
    public List<CommodityMessage> commodityMessageList(){
        return commodityMessageService.selectByNumber();
    }

    @ModelAttribute("commodityMessageVoList")
    public List<CommodityMessageVo> CommodityMessageVoList(){
        return commodityMessageService.selectByTime();
    }

    @RequestMapping({"","/"})
    public String index(){
        return "menu/menu";
    }

    @RequestMapping("/details")
    public ModelAndView details(Integer commodityMessageNo){
        ModelAndView modelAndView = new ModelAndView();
        CommodityMessageVo commodityMessageVo = commodityMessageService.selectByMessageNo(commodityMessageNo);
        Integer typeId = commodityMessageVo.getCommodityType().getCommodityTypeNo();
        commodityMessageService.updateNumber(commodityMessageNo);
        List<CommodityMessage> commodityMessages = commodityMessageService.selectByTypeId(typeId);
        modelAndView.addObject("commodityMessageVo",commodityMessageVo);
        modelAndView.addObject("commodityMessages",commodityMessages);
        modelAndView.setViewName("/menu/details");
        return modelAndView;
    }

    @RequestMapping("/msg")
    public ModelAndView msg(Integer commodityTypeSelfNo,Integer commodityTypeNo){
        ModelAndView modelAndView = new ModelAndView();
        List<CommodityTypeVo> commodityTypeVos = commodityTypeService.selectBySelfId(commodityTypeSelfNo,commodityTypeNo);
        modelAndView.addObject("commodityTypeVos",commodityTypeVos);
        modelAndView.setViewName("/menu/msg");
        return modelAndView;
    }

    @RequestMapping("/recommend")
    @ResponseBody
    public List<CommodityMessage> recommend(){
        return commodityMessageService.selectByNumber();
    }

    @RequestMapping("/search")
    @ResponseBody
    public List<CommodityMessage> search(String messageName){
        return commodityMessageService.selectByName(messageName);
    }

}
