package com.nf.dao;

import com.nf.entity.MembershipGrade;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 会员等级dao
 * @author Alex
 */
public interface MembershipGradeDao {

    /**
     * 查询所有的会员等级
     * @return
     */
    List<MembershipGrade> select();

    /**
     * 根据主键查询
     * @param gradeNo
     * @return
     */
    MembershipGrade selectById(@Param("gradeNo") Integer gradeNo);

    /**
     * 最大的星星数量
     * @return
     */
    Integer selectStarMax();
}
