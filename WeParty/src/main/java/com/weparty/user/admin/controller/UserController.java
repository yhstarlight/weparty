package com.weparty.user.admin.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.weparty.community.service.DeleteCommunityService;
import com.weparty.community.service.GetCommunityService;
import com.weparty.community.vo.AllBoardVO;
import com.weparty.contest.service.GetContestService;
import com.weparty.contest.vo.AllContestVO;
import com.weparty.reply.service.DeleteReplySerivce;
import com.weparty.reply.service.GetReplyService;
import com.weparty.reply.vo.AllReplyVO;
import com.weparty.user.service.GetUserService;
import com.weparty.user.service.UpdateUserService;
import com.weparty.user.vo.UserVO;

@Controller("com.weparty.user.admin.UserController")
@RequestMapping("/user")
public class UserController {
	
	@Inject
	private GetUserService getUserService;
	
	@Inject
	private GetContestService getContestService;
	
	@Inject
	private GetCommunityService getCommunityService;
	
	@Inject
	private GetReplyService getReplyService;
	
	@Inject
	private DeleteCommunityService deleteCommunityService;
	
	@Inject
	private DeleteReplySerivce deleteReplyService;
	
	@Inject
	private UpdateUserService updateUserService;

	@RequestMapping("/list")
	public String UserList(Model m, @ModelAttribute UserVO vo,HttpServletRequest request,
			String searchCondition, String searchKeyword) {
		
		int page = 1;
		int limit = 10; 
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		vo.setSearch_condition(searchCondition);
		vo.setSearch_keyword(searchKeyword);
		
		vo.setStartrow((page - 1) * 10 + 1);
		vo.setEndrow(vo.getStartrow() + limit - 1);
		
		List<UserVO> list = this.getUserService.getUserList(vo);
		int totalCount = this.getUserService.getUserCount();
		
		if(totalCount==0) {
			totalCount=1;
		}
		
		int maxpage = (int) ((double) totalCount / limit + 0.95);
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endpage = maxpage;
		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;
		
		m.addAttribute("startpage", startpage);
		m.addAttribute("endpage", endpage);
		m.addAttribute("maxpage", maxpage);
		m.addAttribute("page", page);
		m.addAttribute("list",list);
		
		return "/user/user_list";
	}
	
	@RequestMapping("/contest")
	public String UserContest(Model m, String id, @ModelAttribute AllContestVO vo, HttpServletRequest request) {
		
		
		int page = 1;
		int limit = 10; 
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		vo.setStartrow((page - 1) * 10 + 1);
		vo.setEndrow(vo.getStartrow() + limit - 1);
		vo.setAll_writer_id(id);
		
		List<AllContestVO> list = this.getContestService.getUserAllContestList(vo);
		int totalCount = this.getContestService.userAllContestCount(id);
		
		if(totalCount==0) {
			totalCount=1;
		}
		
		int maxpage = (int) ((double) totalCount / limit + 0.95);
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endpage = maxpage;
		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;
		
		m.addAttribute("startpage", startpage);
		m.addAttribute("endpage", endpage);
		m.addAttribute("maxpage", maxpage);
		m.addAttribute("page", page);
		m.addAttribute("list",list);
		m.addAttribute("id",id);
		
		return "/user/user_contest";
	}
	
	@RequestMapping("/community")
	public String UserCommunity(Model m, String id, @ModelAttribute AllBoardVO vo, HttpServletRequest request) {
		
		int page = 1;
		int limit = 10; 
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		vo.setStartrow((page - 1) * 10 + 1);
		vo.setEndrow(vo.getStartrow() + limit - 1);
		vo.setBoard_writer_id(id);
		
		List<AllBoardVO> list = this.getCommunityService.getAllBoardList(vo);
		int totalCount = this.getCommunityService.getTotalCount(id);
		
		if(totalCount==0) {
			totalCount=1;
		}
		
		int maxpage = (int) ((double) totalCount / limit + 0.95);
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endpage = maxpage;
		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;
		
		m.addAttribute("startpage", startpage);
		m.addAttribute("endpage", endpage);
		m.addAttribute("maxpage", maxpage);
		m.addAttribute("page", page);
		m.addAttribute("list",list);
		m.addAttribute("id",id);
		
		return "/user/user_community";
	}
	
	@RequestMapping("/reply")
	public String UserReply(Model m, String id, @ModelAttribute AllReplyVO vo, HttpServletRequest request) {
		
		int page = 1;
		int limit = 10; 
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		vo.setStartrow((page - 1) * 10 + 1);
		vo.setEndrow(vo.getStartrow() + limit - 1);
		vo.setReply_writer_id(id);
		
		List<AllReplyVO> list = this.getReplyService.getUserAllReplyList(vo);
		for(AllReplyVO l : list) {
			if(l.getReply_type().equals("자유")) {
				l.setBoard_title((this.getCommunityService.getFreeboardContent(l.getBoard_no())).getFree_board_title());
			} else if (l.getReply_type().equals("정보")) {
				l.setBoard_title((this.getCommunityService.getInfoBoardContent(l.getBoard_no())).getInfo_board_title());
			}
			
		}
		
		int totalCount = this.getReplyService.userAllReplyCount(id);
		
		if(totalCount==0) {
			totalCount=1;
		}
		
		int maxpage = (int) ((double) totalCount / limit + 0.95);
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endpage = maxpage;
		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;
		
		m.addAttribute("startpage", startpage);
		m.addAttribute("endpage", endpage);
		m.addAttribute("maxpage", maxpage);
		m.addAttribute("page", page);
		m.addAttribute("list",list);
		m.addAttribute("id",id);
		
		return "/user/user_reply";
	}
	
	@RequestMapping("/community_delete")
	public String CommunityDelete(@RequestParam(value="board_no",required=true) List<Integer> board_no,
		      @RequestParam(value="board_type",required=true) List<String> board_type, String id) {
		
		int j = 0;
		
		if(board_no.size()!=0) {
			for(int i : board_no) {
				if(board_type.get(j).equals("자유 게시판")) {
					this.deleteCommunityService.deleteFreeBoard(i);
				} else {
					this.deleteCommunityService.deleteInfoBoard(i);
				}
				j++;
			}
		}
		
		return "redirect:/user/community.mdo?id="+id;
	}
	
	@RequestMapping("/reply_delete")
	public String ReplyDelete(@RequestParam(value="reply_no",required=true) List<Integer> reply_no,
		      @RequestParam(value="reply_type",required=true) List<String> reply_type, String id) {
		
		int j = 0;
		
		if(reply_no.size()!=0) {
			for(int i : reply_no) {
				if(reply_type.get(j).equals("자유")) {
					this.deleteReplyService.deleteFreeReply(i);
				} else {
					this.deleteReplyService.deleteInfoReply(i);
				}
				j++;
			}
		}
		return "redirect:/user/reply.mdo?id="+id;
	}
	
	@RequestMapping("/userBan")
	public String UserBan(String user_id) {
		System.out.println(user_id);
		this.updateUserService.setUserBan(user_id);
		
		return "redirect:/user/list.mdo";
	}
	
	@RequestMapping("/userBanDel")
	public String UserBanDel(String user_id) {
		System.out.println(user_id);
		this.updateUserService.delUserBan(user_id);
		
		return "redirect:/user/list.mdo";

	}
}
