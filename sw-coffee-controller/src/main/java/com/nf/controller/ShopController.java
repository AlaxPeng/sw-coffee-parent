package com.nf.controller;

import com.nf.entity.Shop;
import com.nf.service.ShopService;
import com.nf.vo.ShopVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.List;

/**
 * @author Alex
 */
@Controller
@RequestMapping("/shop")
public class ShopController {

    @Autowired
    private ShopService shopService;

    @RequestMapping("")
    public String index(){
        return "shop/shop";
    }

    @RequestMapping("/")
    public String indexChild(){
        return "shop/shop";
    }


    @RequestMapping("/map")
    @ResponseBody
    public List<Shop> map(BigDecimal xmin,BigDecimal xmax,BigDecimal ymin,BigDecimal ymax){
        return shopService.getAll(xmax,xmin,ymax,ymin);
    }

    @RequestMapping("/msg")
    @ResponseBody
    public ShopVo msg(HttpServletRequest request){
        ShopVo shopVo = shopService.getByIdAndTime(Integer.parseInt(request.getParameter("shopId")));
        request.getSession().setAttribute("shop",shopVo.getShop());
        return shopVo;
    }

}
