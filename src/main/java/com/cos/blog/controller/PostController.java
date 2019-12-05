package com.cos.blog.controller;

import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.blog.model.Post;
import com.cos.blog.repository.PostRepository;
import com.cos.blog.utils.Script;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostRepository postRepository;
	
	@GetMapping("")
	public @ResponseBody String home() {
		return Script.home("post/1");
	}

	@GetMapping("/{page}")
	public String post(@PathVariable int page, Model model) {
		List<Post> posts = postRepository.findByPage((page-1)*4);
		for (Post post : posts) {
			Document doc = Jsoup.parse(post.getContent());
			// 첫번째 사진만 가져올거라서 위와는 조금 다르다.
			Element et = doc.selectFirst("img");
			if (et != null) {
				// 추려낸 img에서 src 뒤의 주소를 따주는 코드
				String previewImg = et.attr("src");
				// 어떤 값이 들어오는지 체크
				// 리턴 할 필요 없다.
				post.setPreviewImg(previewImg);
			} else {
				// 없을 경우 디폴트 이미지 설정
				post.setPreviewImg("/images/thumbs/masonry/guitarman-400.jpg");
			}
		}

		
		for (Post post : posts) {
			Document doc = Jsoup.parse(post.getContent());
			Elements ets = doc.select("img");
			if (ets != null) {
				for (Element et : ets) {
					et.remove();
				}
			}
			post.setContent(doc.toString());
		}
		
		model.addAttribute("posts", posts);
		return "post/list";
	}

	@PostMapping("/save")
	public String save(Post post) {
		try {
			postRepository.save(post);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/post";
	}

	@PostMapping("/update")
	public String update(Post post) {
		try {
			postRepository.update(post);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/post";
	}

	@GetMapping("/delete/{id}")
	public String delete(@PathVariable int id) {
		try {
			postRepository.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/post";
	}

	@GetMapping("/detail/{id}")
	public String postDetail(@PathVariable int id, Model model) {
		Post post = postRepository.findById(id);
		model.addAttribute("post", post);
		return "post/detail";
	}

	@GetMapping("/writeForm")
	public String writeForm() {
		return "post/writeForm";
	}

	@GetMapping("/updateForm/{id}")
	public String updateForm(@PathVariable int id, Model model) {
		Post post = postRepository.findById(id);
		model.addAttribute("post", post);
		return "post/updateForm";
	}

}
