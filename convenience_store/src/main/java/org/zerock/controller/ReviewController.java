package org.zerock.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.UserReview;
import org.zerock.service.UserReviewService;


@Controller
@RequestMapping("/review/*")
public class ReviewController {

  private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

  @Inject
  private UserReviewService service;
  
  @RequestMapping(value = "/user_review_list", method = RequestMethod.GET)
  public void list(@RequestParam("id") int id, Model model) throws Exception {
	  logger.info("show list");
	  model.addAttribute(service.product_info(id));
	  model.addAttribute("list", service.user_review_list(id));
  }
  
  
  @RequestMapping(value = "/user_review_readPage", method = RequestMethod.GET)
  public void read(@RequestParam("id") int id, Model model) throws Exception {

    model.addAttribute(service.user_review_read(id));
  }
  
  @RequestMapping(value = "/user_review_modifyPage", method = RequestMethod.GET)
  public void modifyPagingGET(@RequestParam("user_review_id") int user_review_id, 
		  @RequestParam("grade_id") int grade_id, Model model)
      throws Exception {

    model.addAttribute(service.user_review_read(user_review_id));
  }
  
  @RequestMapping(value = "/user_review_modify", method = RequestMethod.POST)
  public String modifyPOST(UserReview userReview, RedirectAttributes rttr) throws Exception {
	
    logger.info("mod post............");

    service.user_review_modify(userReview);
    rttr.addFlashAttribute("msg", "SUCCESS");
    
    return "redirect:/review/user_review_list?id="+ userReview.getProductReview().getId();
  }
  
  @RequestMapping(value = "/user_review_remove", method = RequestMethod.POST)
  public String remove(UserReview userReview, RedirectAttributes rttr) throws Exception {
	 
    service.user_review_remove(userReview);
	
    rttr.addFlashAttribute("msg", "SUCCESS");
	return "redirect:/review/user_review_list?id="+ userReview.getProductReview().getId();
  }
  
  @RequestMapping(value = "/user_review_registerPage", method = RequestMethod.GET)
  public void modifyPagingGET(@RequestParam("product_id") int id, Model model)
      throws Exception {
	  model.addAttribute("product_review_id", id);
	  System.out.println("Show Register Page");
  }
  
  @RequestMapping(value = "/user_review_register", method = RequestMethod.POST)
  public String registerPOST(UserReview userReview, RedirectAttributes rttr) throws Exception {
	
    logger.info("mod post............");

    service.user_review_register(userReview);
    rttr.addFlashAttribute("msg", "SUCCESS");
    
    return "redirect:/review/user_review_list?id="+ userReview.getProductReview().getId();
  }
  
  

}
