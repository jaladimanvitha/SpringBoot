package com.hexa.web;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.HibernateException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hexa.dao.IDao;
import com.hexa.dao.OutOfStockException;
import com.hexa.entity.Category;
import com.hexa.entity.Product;



@Controller
public class CartController {

	private Logger logger= LoggerFactory.getLogger("cartapp");
	@Autowired
	private IDao dao;

	/**
	 * 
	 * @return Main page
	 * <p>This method will navigate to Main page<p/>
	 */
	@RequestMapping(value = { "/", "/main" })
	public String displayHome() {
		return "Main";
	}
	
	/**
	 * 
	 * @param model 
	 * @return
	 */
	@RequestMapping("/viewcategory")
	public String displayDeptFrm(Model model) {
		model.addAttribute("clist", dao.getCategory());
		return "CatagoryView";
	}

	@RequestMapping("/viewproductbycategory")
	public String viewByCategoty(@RequestParam("cartid") Integer cid, Model model) {
		logger.debug("inside view by product by category");
		model.addAttribute("plist", dao.listProduct(cid));
		return "Productview";
	}

	@RequestMapping("/productspec")
	public String viewBySpecification(HttpServletRequest request, @RequestParam("proid") Integer pid, Model model) {
		model.addAttribute("speclist", dao.getSpecification(pid));
		model.addAttribute("prod", dao.getProduct(pid));
		HttpSession sess = request.getSession();
		Product p = dao.getProduct(pid);
		int temp = p.getProductStock();
		if(temp == 0) {
			model.addAttribute("msg", "Out of Stock");
			return "Productview";
		}
		logger.debug("session created");
		return "Productspec";
	}

	@RequestMapping("/delivery")
	public String buyProducts(@RequestParam("proid") Integer pid,  Model model) throws OutOfStockException {
		Product p = dao.getProduct(pid);
		int temp = p.getProductStock();
		System.out.println(temp);

		if (temp != 0) {
			temp--;
			System.out.println(temp);
			dao.updateStock(temp, pid);
			System.out.println("delivery");
			return "Delivery";
		} else {
			model.addAttribute("prod", dao.getProduct(pid));
			model.addAttribute("msg", "The Product is Out of Stock");
			return "Message";
		}
	}
	
	@RequestMapping("/order")
	public String orderProducts( Model model) {
/*		model.addAttribute("ordermsg", "Order Placed Sucessfully");
*/		 
		return "BankDetails";
	}
	
	@RequestMapping("/cartBuy")
	public String cartBuy( Model model) {
//		model.addAttribute("cartmsg", "Order Placed Sucessfully");
		return "Delivery";
	}
	
	
	@RequestMapping("/addtocart")
	public String addToCart(HttpServletRequest request , @RequestParam("proid") Integer pid,Model model) {	
		HttpSession sess = request.getSession();
		if(sess.getAttribute("cartlist") == null)
			sess.setAttribute("cartlist", new ArrayList<Product>());
	
	    List<Product> userlist = (List<Product>)sess.getAttribute("cartlist");
	
	
	 System.out.println("retrieved old session");
	 Product prod = dao.getProduct(pid);
	 System.out.println("size " + userlist.size());
	 System.out.println(prod);
	userlist.add(prod);
	
	 System.out.println("after adding size " +userlist.size());
		return "CartPage";
	}
	
	@RequestMapping("/otp")
	public String OrderSuccesspage() {
		return "OTP";
	}
	
	@RequestMapping("/buy")
	public String OrderSuccess() {
		return "OrderSuccess";
	}
	
}
