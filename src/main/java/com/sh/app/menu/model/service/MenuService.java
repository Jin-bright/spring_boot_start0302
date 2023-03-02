package com.sh.app.menu.model.service;

import java.util.List;

import com.sh.app.menu.model.dto.Menu;

public interface MenuService {

	List<Menu> findAll();

	//타입으로 찾아오기 
	List<Menu> findByType(String type);

	List<Menu> findByTypeAndTaste(String type, String taste);

}
