package com.nf.service.impl;

import com.nf.dao.CommodityTypeDao;
import com.nf.entity.CommodityType;
import com.nf.service.CommodityTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Alex
 */
@Service
public class CommodityTypeServiceImpl implements CommodityTypeService {

    @Autowired
    private CommodityTypeDao commodityTypeDao;

    @Override
    public List<CommodityType> selectByStair() {
        return commodityTypeDao.selectByStair();
    }

    @Override
    public CommodityType selectById(Integer id) {
        return commodityTypeDao.selectById(id);
    }
}
