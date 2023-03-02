package com.sh.app.menu.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sh.app.menu.model.dto.Menu;
import com.sh.app.menu.model.service.MenuService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController // 모든 핸들러에 @ResponseBody를 적용해준다 --- 그러면 return data를 한다는건가 ?
@RequestMapping("/menu")
public class MenuController {
	
	@Autowired
	private MenuService menuService;
	

//	@ResponseBody  이거뭐하는애지 ? 비동기일때 필요한건가 ?
	@GetMapping
	public List<Menu> menu(){
		return menuService.findAll();
	
	}
	
// /menu/type/kr  ch jp 이런거 	
	@GetMapping("/type/{type}")
	public List<Menu> findByType(@PathVariable String type){
		log.debug("■■ type = {}", type);
		return menuService.findByType(type);
	}
	
	@GetMapping("/type/{type}/taste/{taste}")
	public List<Menu> findByTypeAndTaste(@PathVariable String type, @PathVariable String taste){
		log.debug("■■ type = {}", type);
		log.debug("■■ taste = {}", taste);
		return menuService.findByTypeAndTaste(type, taste);
	}
	
}
