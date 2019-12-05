package com.cos.blog.repository;

import java.util.List;

import com.cos.blog.model.Post;

public interface PostRepository {
	List<Post> findAll();
	List<Post> findByPage(int page);//페이지에 제한보이기
	void save(Post post); //글쓰기
	void update(Post post); // 수정
	Post findById(int id); //상세보기
	void delete(int id); // 삭제하기
	
}
