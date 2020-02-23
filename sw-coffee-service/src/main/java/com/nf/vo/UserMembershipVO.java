package com.nf.vo;

import com.nf.entity.MembershipGrade;
import com.nf.entity.MembershipTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author Alex
 */
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class UserMembershipVO {

    MembershipGrade membershipGrade;
    MembershipTime membershipTime;

}
