package com.nf.service.impl;

import com.nf.dao.CommodityMessageDao;
import com.nf.dao.CommodityTypeDao;
import com.nf.entity.CommodityType;
import com.nf.service.CommodityTypeService;
import com.nf.vo.CommodityTypeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Alex
 */
@Service
public class CommodityTypeServiceImpl implements CommodityTypeService {

    @Autowired
    private CommodityTypeDao commodityTypeDao;
    @Autowired
    private CommodityMessageDao commodityMessageDao;

    @Override
    public List<CommodityType> selectByStair() {
        return commodityTypeDao.selectByStair();
    }

    @Override
    public CommodityType selectById(Integer id) {
        return commodityTypeDao.selectById(id);
    }

    @Override
    public List<CommodityTypeVo> selectBySelfId(Integer commodityTypeSelfId,Integer commodityTypeId) {
        List<CommodityTypeVo> commodityTypeVos = new ArrayList<>();
        List<CommodityType> commodityTypes = commodityTypeDao.selectBySelfId(commodityTypeSelfId,commodityTypeId);
        for (CommodityType commodityType : commodityTypes) {
            commodityTypeVos.add(new CommodityTypeVo(commodityTypeDao.selectById(commodityTypeSelfId),commodityType,
                    commodityMessageDao.selectByTypeId(commodityType.getCommodityTypeNo())));
        }
        return commodityTypeVos;
    }
}
