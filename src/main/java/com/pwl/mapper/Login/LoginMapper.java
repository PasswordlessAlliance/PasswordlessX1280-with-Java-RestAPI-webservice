package com.pwl.mapper.Login;

import org.apache.ibatis.annotations.Mapper;
import com.pwl.domain.Login.UserInfo;

@Mapper
public interface LoginMapper {

    // 로그인 체크
    UserInfo checkPassword(UserInfo userinfo);
    
    // 회원정보 검색
    UserInfo getUserInfo(UserInfo userinfo);
    
    // 패스워드 업데이트
    void updatePassword(UserInfo userinfo);
    
    // 회원가입
    void createUserInfo(UserInfo userinfo);
    
    // 회원탈퇴
    void withdrawUserInfo(UserInfo userinfo);
    
    // 비밀번호 변경
    void changepw(UserInfo userinfo);
}
