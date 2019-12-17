package com.nf.util;

import com.aliyuncs.CommonRequest;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;

import java.util.Random;

/**
 * @author Alex
 */
public class LoginAndRegisterUtils {
    private static final int CODE_LENGTH = 4;
    public static String sendSms(String code,String phone){

        DefaultProfile profile =
                DefaultProfile.getProfile
                        ("default", "LTAIpyZABf0JWDJP", "WNlilgdZN01VzRMDx1SkaaSezCIa2I");
        IAcsClient client = new DefaultAcsClient(profile);

        CommonRequest request = new CommonRequest();
        request.setMethod(MethodType.POST);
        request.setDomain("dysmsapi.aliyuncs.com");
        request.setVersion("2017-05-25");
        request.setAction("SendSms");
        request.putQueryParameter("RegionId", "default");
        request.putQueryParameter("PhoneNumbers", phone);
        request.putQueryParameter("SignName", "gdnf150");
        request.putQueryParameter("TemplateCode", "SMS_171353237");
        request.putQueryParameter("TemplateParam", "{\"code\":\""+code+"\"}");
        try {
            client.getCommonResponse(request);
        } catch (ClientException e) {
            throw new RuntimeException(e);
        }
        return code;
    }

    public static String code() {
        Random random = new Random();
        String code = "";
        for(int i=0;i<CODE_LENGTH;i++) {
            code+=random.nextInt(10);
        }
        return code;
    }

    public static String accountNumber(String phone) {
        Random random = new Random();
        String accountNumber = "";
        accountNumber += (char) (Math.random() * 26 + 'a');
        accountNumber += (char) (Math.random() * 26 + 'a');
        accountNumber += phone;
        return accountNumber;
    }

}
