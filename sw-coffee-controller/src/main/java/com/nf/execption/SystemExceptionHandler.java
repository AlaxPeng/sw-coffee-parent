package com.nf.execption;

import com.nf.vo.ResponseVO;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author cj
 * @date 2019/11/25
 */
@ControllerAdvice
public class SystemExceptionHandler {

    @ExceptionHandler(RuntimeException.class)
    @ResponseBody
    public ResponseVO handleRuntimeException(RuntimeException e){
        exception(e);
        return ResponseVO.newBuilder().code("500").msg("failed").build();
    }

    public void exception(RuntimeException e){
        throw new RuntimeException(e);
    }

}
