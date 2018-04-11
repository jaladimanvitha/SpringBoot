package com.hexa.web;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hexa.dao.IDao;
import com.hexa.entity.Category;
import com.hexa.entity.Product;
import com.hexa.entity.Specifications;

@Controller
public class ImageViewController {

	@Autowired
	private IDao dao;
	
	@RequestMapping("/viewimg")
	public String viewImage(@RequestParam("imgname") String img, HttpServletResponse response) throws IOException {
		response.setContentType("image/jpeg");
		FileInputStream fis = new FileInputStream("D:\\39791-Domain Training\\EcommerceProject\\images\\"+img);
		byte[] arr = new byte[fis.available()];
		fis.read(arr);
		ServletOutputStream out = response.getOutputStream();
		out.write(arr);
		fis.close();
		return null;
	}
	
	public Map<Integer, String> getCatAsMap() {
		List<Category> lst = dao.getCategory();
		Map<Integer, String> map = new HashMap<>();
		for (Category d : lst) {
			map.put(d.getCategoryId(), d.getCategoryName());
		}
		return map;
	}
	
	
	@RequestMapping("/addProductPage")
	public String displayAddFrm(Model model) {
		Product pro = new Product();
		Category cat = new Category();
		pro.setCat(cat);
		model.addAttribute("ebean", pro);
		model.addAttribute("catmap", getCatAsMap());
		return "AddProducts";
	}
	
	@RequestMapping("/addProduct")
	public String addProducts(@Valid @ModelAttribute("ebean") Product pro, BindingResult br,
			@RequestParam("fname") MultipartFile file, Model model ) throws IOException {
		model.addAttribute("catlist", dao.getCategory());
		if (br.hasErrors()) {
			model.addAttribute("catmap", getCatAsMap());
			return "AddProducts";
		}
		pro.setProductImage(pro.getProductId() + ".jpg"); 
		FileOutputStream fos = new FileOutputStream("D:\\39791-Domain Training\\EcommerceProject\\images\\" + pro.getProductImage());
		fos.write(file.getBytes());
		System.out.println("Images added");
		dao.addProduct(pro);
		model.addAttribute("promsg", "Product Added Successfully");
		return "Main";
	}
	

	@RequestMapping("/addspec")
	public String orderProducts(Model model ) {
		Specifications spec = new Specifications();
		model.addAttribute("sbean", spec);
		return "AddSpecification";
	}
	
	@RequestMapping("/addspecification")
	public String addSpecification(@Valid @ModelAttribute("sbean") Specifications spec, Model model ) {
		dao.addSpecification(spec);
		model.addAttribute("specmsg", "Specification Added Successfully");
		return "AddSpecification";
	}
	
	
}
