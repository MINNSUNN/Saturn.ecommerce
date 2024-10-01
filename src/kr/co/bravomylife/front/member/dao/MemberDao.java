/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HIMEDIA.CO.KR.
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HIMEDIA.CO.KR ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 himedia.co.kr에 있으며,
 * himedia.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * himedia.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 himedia.co.kr All Rights Reserved.
 *
 *
 * Program		: kr.co.himedia.ecommerce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: MemberDao.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241001104623][whslsl88#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.member.dao;

import org.springframework.stereotype.Repository;

import kr.co.bravomylife.front.common.dao.BaseDao;
import kr.co.bravomylife.front.member.dto.MemberDto;

/**
 * @version 1.0.0
 * @author whslsl88#gmail.com
 * 
 * @since 2024-10-01
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Repository("kr.co.bravomylife.front.member.dao.MemberDao")
public class MemberDao extends BaseDao {
	
	public int updateState(MemberDto memberDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.member.Member.updateState", memberDto);
	}

	public int selectDuplicate(MemberDto memberDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.member.Member.selectDuplicate", memberDto);
	}

	public int sequence() {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.member.Member.sequence");
	}
	
	public int insertMaster(MemberDto memberDto) {
		return sqlSessionFront.insert("kr.co.bravomylife.front.mybatis.member.Member.insertMaster", memberDto);
	}
	
	public int insertDetail(MemberDto memberDto) {
		return sqlSessionFront.insert("kr.co.bravomylife.front.mybatis.member.Member.insertDetail", memberDto);
	}
	
	public int updateMaster(MemberDto memberDto) {
		return sqlSessionFront.insert("kr.co.bravomylife.front.mybatis.member.Member.updateMaster", memberDto);
	}
	
	public int updateDetail(MemberDto memberDto) {
		return sqlSessionFront.insert("kr.co.bravomylife.front.mybatis.member.Member.updateDetail", memberDto);
	}
	
	public MemberDto select(MemberDto memberDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.member.Member.select", memberDto);
	}
	
	public MemberDto selectPasswd(MemberDto memberDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.member.Member.selectPasswd", memberDto);
	}
	
	public int updatePasswd(MemberDto memberDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.member.Member.updatePasswd", memberDto);
	}
}