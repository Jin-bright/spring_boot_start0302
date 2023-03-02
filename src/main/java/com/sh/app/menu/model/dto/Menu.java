package com.sh.app.menu.model.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/** 직렬화 
 * 
 * @author brigh
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Menu implements Serializable{
	private static final long serialVersionUID = 1L;

	private long id;  //int는 long보다 개수가 적으니까 
	private String restaurant;
	private String name;
	private int price;
	private MenuType type;
	private MenuTaste taste;

}
