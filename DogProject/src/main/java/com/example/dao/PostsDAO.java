package com.example.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.PostsDTO;

@Repository
public class PostsDAO {
	@Autowired
	SqlSessionTemplate session;

	public List<PostsDTO> selectList() {
		return session.selectList("PostsMapper.selectList");
	}
	
	public List<PostsDTO> selectList2(String userID) {
		return session.selectList("PostsMapper.selectList2", userID);
	}

	public List<PostsDTO> selectgetList(String userID) {
		return session.selectList("PostsMapper.selectgetList", userID);
	}
	
	public List<PostsDTO> popular() {
		// TODO Auto-generated method stub
		return session.selectList("PostsMapper.popular");
	}
	
	public void addPost(PostsDTO post) {
		// TODO Auto-generated method stub
		session.insert("PostsMapper.addPost",post);
	}
	
	public int updateContent(PostsDTO post) {
		int n = session.update("PostsMapper.updateContent", post);
		return n;
	}
	
	public PostsDTO read(int PostID){
		return session.selectOne("PostsMapper.Posts_read", PostID);
	}
	
	public void hitadd(int PostID) {
		session.update("PostsMapper.Posts_hitadd", PostID);
		
	}
	
	//컬럼타입만 변경update -> db에 남아있음
	public int delete_column(PostsDTO DTO) {
		return session.update("PostsMapper.Posts_delete", DTO);
			
	}

	public void likeUpdate(String Likes, String postID) {
		Map<String, String> map = new HashMap<>();
		map.put("Likes", Likes);
		map.put("PostID", postID);
		int n = session.update("PostsMapper.likeUpdate",map);
	}
	
} // end
