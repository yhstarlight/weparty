package com.weparty.reply.client.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.weparty.reply.service.DeleteReplySerivce;
import com.weparty.reply.service.GetReplyService;
import com.weparty.reply.service.InsertReplyService;
import com.weparty.reply.service.UpdateReplyService;
import com.weparty.reply.vo.FreeReplyVO;
import com.weparty.reply.vo.InfoReplyVO;

@RestController
@RequestMapping("/reply")
public class ReplyController {
	
	@Inject
	private InsertReplyService insertReplyService;
	
	@Inject
	private GetReplyService getReplyService;
	
	@Inject
	private DeleteReplySerivce deleteReplyService;
	
	@Inject
	private UpdateReplyService updateReplyService;
	

	@RequestMapping(value="/free", method=RequestMethod.POST)
	public ResponseEntity<String> RegistFreeReply(@RequestBody FreeReplyVO vo){
		ResponseEntity<String> entity=null;
		
		try {
			this.insertReplyService.insertFreeReply(vo);
			entity=new ResponseEntity<String>("success",
					HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),
					HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/freeAll/{free_board_no}", method=RequestMethod.GET)
	public ResponseEntity<List<FreeReplyVO>> freeReplylist(
			@PathVariable("free_board_no") int free_board_no) {
		
		ResponseEntity<List<FreeReplyVO>> entity=null;
		
		try {
			entity = new ResponseEntity<>(
					this.getReplyService.getFreeReplyList(free_board_no), HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/free/{free_reply_no}", method=RequestMethod.DELETE)
	public ResponseEntity<String> removeFreeReply(@PathVariable("free_reply_no") int free_reply_no) {
		
		ResponseEntity<String> entity = null;
		
		try {
			this.deleteReplyService.deleteFreeReply(free_reply_no);
			entity=new ResponseEntity<String>("success", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/free/{free_reply_no}", method= {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> updateFreeReply(@PathVariable("free_reply_no") int free_reply_no,
			@RequestBody FreeReplyVO vo){
		ResponseEntity<String> entity = null;
		
		try {
			vo.setFree_reply_no(free_reply_no);
			this.updateReplyService.updateFreeReply(vo);
			entity = new ResponseEntity<String>("SUCCESS",
					HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/info", method=RequestMethod.POST)
	public ResponseEntity<String> RegistInfoReply(@RequestBody InfoReplyVO vo){
		ResponseEntity<String> entity=null;
		
		try {
			this.insertReplyService.insertInfoReply(vo);
			entity=new ResponseEntity<String>("success",
					HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),
					HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/infoAll/{info_board_no}", method=RequestMethod.GET)
	public ResponseEntity<List<InfoReplyVO>> infoReplylist(
			@PathVariable("info_board_no") int info_board_no) {
		
		ResponseEntity<List<InfoReplyVO>> entity=null;
		
		try {
			entity = new ResponseEntity<>(
					this.getReplyService.getInfoReplyList(info_board_no), HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/info/{info_reply_no}", method=RequestMethod.DELETE)
	public ResponseEntity<String> removeInfoReply(@PathVariable("info_reply_no") int info_reply_no) {
		
		ResponseEntity<String> entity = null;
		
		try {
			this.deleteReplyService.deleteInfoReply(info_reply_no);
			entity=new ResponseEntity<String>("success", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/info/{info_reply_no}", method= {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> updateInfoReply(@PathVariable("info_reply_no") int info_reply_no,
			@RequestBody InfoReplyVO vo){
		ResponseEntity<String> entity = null;
		
		try {
			vo.setInfo_reply_no(info_reply_no);
			this.updateReplyService.updateInfoReply(vo);
			entity = new ResponseEntity<String>("SUCCESS",
					HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
