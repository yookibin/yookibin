package com.java.date.reply.dao;

import java.util.List;

import com.java.date.member.dto.MemberReplyDto;

public interface ReplyDao {
	public int replyInsert(MemberReplyDto memberReply);
	
	public int replyCount(int board_num);
	
	public List<MemberReplyDto> replyList(int board_num);
	
	public int replyBunho();
	
	public int replyDelete(int reply_num);
	
	public MemberReplyDto selectReply(int reply_num);
	
	public int updateReply(int reply_num, String reply_content);
}
