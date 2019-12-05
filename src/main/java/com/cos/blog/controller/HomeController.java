package com.cos.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.cos.blog.utils.Script;

@Controller
public class HomeController {

	@GetMapping("/")
	public @ResponseBody String home() {

		return Script.home("post/1");

	}

}
