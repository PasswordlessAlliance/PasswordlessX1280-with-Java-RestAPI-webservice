package com.pwl.mapper.Login;

import org.apache.ibatis.annotations.Mapper;
import com.pwl.domain.Login.UserInfo;

@Mapper
public interface LoginMapper {

    // Login Check
    UserInfo checkPassword(UserInfo userinfo);
    
    // Search for User Information
    UserInfo getUserInfo(UserInfo userinfo);
    
    // Password Update
    void updatePassword(UserInfo userinfo);
    
    // User Registration
    void createUserInfo(UserInfo userinfo);
    
    // User Deletion
    void withdrawUserInfo(UserInfo userinfo);
    
    // Password Change
    void changepw(UserInfo userinfo);
}
