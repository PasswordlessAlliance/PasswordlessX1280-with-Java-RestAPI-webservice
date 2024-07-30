package com.pwl.config;

import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Component;

/**
 * 메시지 정보를 전달하는 유틸
 * 메시지는 코드로 구분 (다국어)
 */

@Component
public class MessageUtils {
    private MessageSource messageSource;

    public  MessageUtils(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    public String getMessage(String code) {
        return messageSource.getMessage(code, null, LocaleContextHolder.getLocale());
    }

    public String getMessage(String code, String[] strs) {
        return messageSource.getMessage(code, strs, LocaleContextHolder.getLocale());
    }

}
