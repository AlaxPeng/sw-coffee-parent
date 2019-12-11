package com.nf.service.impl;

import com.nf.dao.ShopDao;
import com.nf.dao.ShopDateDao;
import com.nf.entity.Shop;
import com.nf.entity.ShopDate;
import com.nf.service.ShopService;
import com.nf.util.GetDayOfWeek;
import com.nf.vo.ShopVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author Alex
 */
@Service
public class ShopServiceImpl implements ShopService {

    @Autowired
    private ShopDao shopDao;
    @Autowired
    private ShopDateDao shopDateDao;

    @Override
    public List<Shop> getAll(BigDecimal xMax, BigDecimal xMin, BigDecimal yMax, BigDecimal yMin) {
        return shopDao.getAll(xMax,xMin,yMax,yMin);
    }

    @Override
    public ShopVo getByIdAndTime(Integer shopId) {
        List<ShopDate> shopDates = shopDateDao.getByShopId(shopId);
        shopDates = GetDayOfWeek.getDayOfWeek(shopDates);
        return new ShopVo(shopDao.getById(shopId),shopDates);
    }

}
