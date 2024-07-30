package com.pwl.domain.Login;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserInfo {
	private String id;
	private String pw;
	private String email;
	private Date regdate;
}
