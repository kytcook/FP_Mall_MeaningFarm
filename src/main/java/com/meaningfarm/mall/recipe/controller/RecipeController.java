package com.meaningfarm.mall.recipe.controller;

import java.util.List;

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

import com.meaningfarm.mall.recipe.service.RecipeService;
import com.meaningfarm.mall.recipe.service.ReplyService;
import com.vo.Criteria;
import com.vo.PageMaker;
import com.vo.RecipeReplyVO;
import com.vo.RecipeVO;
import com.vo.SearchCriteria;

@Controller
@RequestMapping("/recipe/*")
public class RecipeController {

   Logger logger = LoggerFactory.getLogger(RecipeController.class);

   private RecipeService recipeService = null; 
   
   //private static final Logger logger = LoggerFactory.getLogger(RecipeController.class);
   
   @Inject
   RecipeService service;
   
   @Inject
   ReplyService replyService;
   
   //home
   //@RequestMapping("/")
   //public String main() {
   //   return "home";
   //}
   
   //목록 조회
   
   /*
    * @RequestMapping (value="/recipe_list", method = RequestMethod.GET) public
    * void getList (RecipeVO recipeVO, Model model) throws Exception {
    * logger.info("list");
    * 
    * List<RecipeVO> list = null; list = service.list();
    * 
    * model.addAttribute("list", list);
    * 
    * //return "recipe/recipe_list"; }
    */
    

   //등록 페이지 이동
   @RequestMapping(value="/recipe_write", method=RequestMethod.GET)
   public String writeGET() {
      logger.info("write get");
      return "/recipe/recipe_write";
   }
   
   //등록처리
   @RequestMapping(value="/recipe_write", method=RequestMethod.POST)
   public String writePOST (RecipeVO recipeVO, RedirectAttributes redirectAttributes) throws Exception{
      logger.info("write POST");
      logger.info(recipeVO.toString());
      
      service.write(recipeVO);
      redirectAttributes.addFlashAttribute("msg", "regSuccess");
      
      
      return "redirect:/recipe/recipe_list";
   }


   //작성화면 -detail
   @RequestMapping(value="/recipe_view", method = RequestMethod.GET)
   public void read(@ModelAttribute RecipeVO recipeVO, Model model,@ModelAttribute RecipeReplyVO replyVO) throws Exception{
      logger.info("read");
      // detail view -------------시작
      //RecipeVO recipeVO = service.read(recipe_no);
      model.addAttribute("read", service.read(recipeVO.getRecipe_no()));
      //return "recipe/recipe_view";
      
      
      //댓글 조회
      List<RecipeReplyVO> replyList = replyService.readReply(recipeVO.getRecipe_no());
      //reply = replyService.list(recipe_no);
      model.addAttribute("replyList", replyList);
      
   }   


   // 게시글 수정뷰
   @RequestMapping(value="/recipe_modify", method=RequestMethod.GET)
   public String modifyGET(@ModelAttribute RecipeVO recipeVO,  Model model) throws Exception{
      logger.info("modify GET");
      model.addAttribute("modify", service.read(recipeVO.getRecipe_no()));
      return "recipe/recipe_modify";
   }
   
   // 게시판 수정
   @RequestMapping(value="/recipe_modify", method = RequestMethod.POST)
   public String modifyPOST(RecipeVO recipeVO, RedirectAttributes redirectAttributes) throws Exception{
      logger.info("modify POST");
      service.modify(recipeVO);
      redirectAttributes.addFlashAttribute("msg", "modSuccess");
      return "redirect:/recipe/recipe_list";
   }

   
   //게시판 삭제
   @RequestMapping(value="/recipe_delete", method= RequestMethod.GET)
   public String getDelete(@RequestParam("recipe_no") int recipe_no) throws Exception{
      service.delete(recipe_no);
      return "redirect: recipe_list";
   }
   
/*
   // 게시물 좋아요 
   @RequestMapping("recipe_like")
   public String recommend (@RequestParam int recipe_no) throws Exception{
      service.recommend(recipe_no);
      return "forward:/list";
   }
*/
   //댓글 작성
   @RequestMapping(value="/replyWrite", method = RequestMethod.POST)
   public String replyWrite(RecipeReplyVO rrVO, Criteria cri, RedirectAttributes rttr) throws Exception{
      logger.info("reply Write");
      
      replyService.writeReply(rrVO);
      
      rttr.addAttribute("recipe_no", rrVO.getRecipe_no());
      rttr.addAttribute("page", cri.getPage());
      rttr.addAttribute("perPageNum", cri.getPerPageNum());
      
      return "redirect:/recipe/recipe_view";
   }
   
   //게시물 목록 + 페이징 추가
   // 글 목록 + 페이징
   
     @RequestMapping(value = "/recipe_listPage", method = RequestMethod.GET)
     public void listPage(@ModelAttribute("cri") Criteria cri, Model model) throws
     Exception { logger.info("get list page");
     
     List<RecipeVO> list = service.listPage(cri); 
     model.addAttribute("list", list);
     
     PageMaker pageMaker = new PageMaker(); 
     pageMaker.setCri(cri);
     pageMaker.setTotalCount(service.listCount()); 
     model.addAttribute("pageMaker", pageMaker);
     
     }
    
   
   //글목록+ 페이징+검색
   // 글 목록 + 페이징 + 검색
   /*
    * @RequestMapping(value = "/recipe_listSearch", method = RequestMethod.GET)
    * public void listPage(@ModelAttribute("scri") SearchCriteria scri, Model
    * model) throws Exception { logger.info("get list search");
    * 
    * List<RecipeVO> list = service.listPage(scri); model.addAttribute("list",
    * list);
    * 
    * PageMaker pageMaker = new PageMaker(); pageMaker.setCri(scri);
    * //pageMaker.setTotalCount(service.listCount());
    * pageMaker.setTotalCount(service.countSearch(scri));
    * model.addAttribute("pageMaker", pageMaker); }
    */
   
}