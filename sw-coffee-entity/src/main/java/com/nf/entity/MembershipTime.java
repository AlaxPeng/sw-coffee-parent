package com.nf.entity;

import lombok.Data;

import java.util.Date;

/**
 * @author Alex
 */

@Data
public class MembershipTime {

    private Integer membershipTimeNo;
    private Date membershipTimeStart;
    private Date memberShipTimeEnd;
    private String userAccountNumber;
    private Integer membershipGradeNo;

}
