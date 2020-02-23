package com.nf.service.impl;

import com.nf.dao.CommodityMessageDao;
import com.nf.dao.CommodityTypeDao;
import com.nf.entity.CommodityMessage;
import com.nf.entity.CommodityType;
import com.nf.service.CommodityMessageService;
import com.nf.vo.CommodityMessageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Alex
 */
@Service
public class CommodityMessageServiceImpl implements CommodityMessageService {

    @Autowired
    private CommodityMessageDao commodityMessageDao;
    @Autowired
    private CommodityTypeDao commodityTypeDao;

    @Transactional(rollbackFor = RuntimeException.class)
    @Override
    public List<CommodityMessageVO> selectByTime() {
        List<CommodityMessageVO> list = new ArrayList();
        for (CommodityMessage commodityMessage : commodityMessageDao.selectByTime()) {
            list.add(new CommodityMessageVO(commodityMessage,
                    commodityTypeDao.selectById(commodityMessage.getCommodityTypeNo())));
        }
        return list;
    }




    @Override
    public List<CommodityMessage> selectByTypeId(Integer typeId) {
        return commodityMessageDao.selectByTypeId(typeId);
    }

    @Override
    public Integer updateNumber(Integer messageNo) {
        return commodityMessageDao.updateNumber(messageNo);
    }

    @Transactional(rollbackFor = RuntimeException.class)
    @Override
    public CommodityMessageVO selectByMessageNo(Integer messageNo) {
        CommodityMessage commodityMessage = commodityMessageDao.selectById(messageNo);
        CommodityType commodityType = commodityTypeDao.selectById(commodityMessage.getCommodityTypeNo());
        return new CommodityMessageVO(commodityMessage,commodityType);
    }

    @Override
    public List<CommodityMessage> selectByNumber() {
        return commodityMessageDao.selectByNumber();
    }

    @Override
    public List<CommodityMessage> selectByName(String messageName) {
        return commodityMessageDao.selectByName(messageName);
    }
}
