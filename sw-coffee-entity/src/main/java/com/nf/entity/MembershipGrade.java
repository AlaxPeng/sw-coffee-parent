package com.nf.entity;

import lombok.Data;

/**
 * 会员等级表
 * @author Alex
 */
@Data
public class MembershipGrade {

    private Integer gradeNo;
    private String gradeName;
    private Double gradeStarNumber;

}
