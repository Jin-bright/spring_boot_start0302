package com.sh.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/** 뭐여러개 상속한다고 적해져있음 
 * @SpringBootConfiguration : @Configuration 빈 자동등록을 얘가 대신 해준다 
 * @EnableAutoConfiguration : context구성. 단 하나의 context만 관리한다 
 * @ComponentScan 특정패키지(기본값 현재패키지) 하위의 빈등록
 * 
 * @MapperScan 자동으로 처리중 : @Mapper인터페이스 등록
 *
 */

@SpringBootApplication
public class HelloSpringbootApplication {

	public static void main(String[] args) {
		SpringApplication.run(HelloSpringbootApplication.class, args);
	}

}
