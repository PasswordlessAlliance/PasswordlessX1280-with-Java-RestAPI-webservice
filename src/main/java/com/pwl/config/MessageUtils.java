package com.pwl.config;

import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Component;

/**
 * Utility for delivering message information
 * Messages are categorized by code (for multilingual support)
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
