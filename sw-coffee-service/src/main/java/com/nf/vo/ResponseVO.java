package com.nf.vo;

import lombok.Data;

/**
 * @author Alex
 */
@Data
public class ResponseVO<T> {

    private String code;
    private String msg;
    private T data;

    private ResponseVO(Builder<T> builder) {
        setCode(builder.code);
        setMsg(builder.msg);
        setData(builder.data);
    }

    public static Builder newBuilder() {
        return new Builder();
    }

    public static Builder newBuilder(ResponseVO copy) {
        Builder builder = new Builder();
        builder.code = copy.getCode();
        builder.msg = copy.getMsg();
        builder.data = copy.getData();
        return builder;
    }

    public static final class Builder<T> {
        private String code;
        private String msg;
        private T data;

        private Builder() {
        }

        public Builder code(String val) {
            code = val;
            return this;
        }

        public Builder msg(String val) {
            msg = val;
            return this;
        }

        public Builder data(T val) {
            data = val;
            return this;
        }

        public ResponseVO build() {
            return new ResponseVO(this);
        }
    }

}
