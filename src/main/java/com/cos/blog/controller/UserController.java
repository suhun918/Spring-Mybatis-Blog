package com.cos.blog.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cos.blog.model.User;
import com.cos.blog.repository.UserRepository;
import com.cos.blog.utils.Script;

@Controller
@RequestMapping("/user")
public class UserController {

	@Value("${file.path}")
	private String resourcePath;

	@Autowired
	private UserRepository userRepository;

	@GetMapping("/joinForm")
	public String userJoinForm() {
		return "user/joinForm";
	}

	@PostMapping("/join")
	public @ResponseBody String userJoin(User user) {
		try {
			userRepository.save(user);
		} catch (Exception e) {
			e.printStackTrace();
			return Script.back("회원가입이 실패하였습니다");
		}
		return Script.home("post/1");
	}

	@GetMapping("/loginForm")
	public String userLoginForm() {
		return "user/loginForm";
	}

	@PostMapping("/login")
	public @ResponseBody String userLogin(User user, HttpSession session) {
		try {
			User u = userRepository.findByUsernameAndPassword(user.getUsername(), user.getPassword());
			if (u != null) {
				session.setAttribute("user", u);
			}else {
				return Script.back("로그인이 실패하였습니다.");
			}
		} catch (Exception e) {
			return Script.back("로그인이 실패하였습니다.");
		}
		
		return Script.home("post/1");
	}

	@GetMapping("/logout")
	public String userLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/post";
	}

	@GetMapping("/uploadForm")
	public String imageUploadForm() {
		return "user/uploadForm";
	}

	@PostMapping("/upload")
	public String imageUpload(@RequestParam("userProfile") MultipartFile file, HttpSession session) {
		try {
			UUID uuid = UUID.randomUUID();
			String uuidFileName = uuid + "_" + file.getOriginalFilename();

			Path filePath = Paths.get(resourcePath + uuidFileName);
			System.out.println("filePath:" + filePath);
			try {
				Files.write(filePath, file.getBytes());
			} catch (Exception e) {
				e.printStackTrace();
			}

			User user = (User) session.getAttribute("user");

			user.setUserProfile("/upload/" + uuidFileName);

			userRepository.upload(user);

			Thread.sleep(2500);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/post";
	}
}
