package com.java.date.memberController;

import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.java.date.memberService.MemberService;


@Controller
public class MemberController {
	Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private MemberService memberService;
	
	
	
	
}
