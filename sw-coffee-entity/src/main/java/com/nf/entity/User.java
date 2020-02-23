package com.nf.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author Alex
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private String accountNumber;
    private String emailAddress;
    private String phone;
    private String password;
    private Date registrationTime;
    private String surname;
    private String name;
    private Boolean sex;
    private Date birthday;
    private BigDecimal starsNumber;
    private String portrait;
    
}