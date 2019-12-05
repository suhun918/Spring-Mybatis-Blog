package com.cos.blog.repository;

import java.util.List;

import com.cos.blog.model.User;

public interface UserRepository {
	List<User> findAll();
	void save(User user); // join
	User findByUsernameAndPassword(String username, String password);//login
	void upload(User user);//프로필 업데이트
}
