package com.sh.app.menu.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.app.menu.model.dao.MenuDao;
import com.sh.app.menu.model.dto.Menu;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDao menuDao;

	
	//전체조회 
	@Override
	public List<Menu> findAll() {
		// TODO Auto-generated method stub
		return menuDao.findAll();
	}


	//타입으로 찾아오기
	@Override
	public List<Menu> findByType(String type) {
		// TODO Auto-generated method stub
		return menuDao.findByType(type);
	}


	@Override
	public List<Menu> findByTypeAndTaste(String type, String taste) {
		// TODO Auto-generated method stub
		return menuDao.findByTypeAndTaste(type, taste);
	}
	
}
