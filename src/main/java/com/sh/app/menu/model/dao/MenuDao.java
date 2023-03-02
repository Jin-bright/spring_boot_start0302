package com.sh.app.menu.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sh.app.menu.model.dto.Menu;

@Mapper
public interface MenuDao {

	List<Menu> findAll();

	//타입으로찾기
	List<Menu> findByType(String type);

	//타입 + 맛찾기
	List<Menu> findByTypeAndTaste(String type, String taste);

}
