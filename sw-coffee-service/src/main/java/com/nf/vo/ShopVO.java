package com.nf.vo;

import com.nf.entity.Shop;
import com.nf.entity.ShopDate;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author Alex
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShopVO {
    private Shop shop;
    private List<ShopDate> shopDates;
}
