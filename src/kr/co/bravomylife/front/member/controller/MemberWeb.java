/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF bravomylife.CO.KR.
 * bravomylife.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 bravomylife.CO.KR ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 bravomylife.co.kr에 있으며,
 * bravomylife.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * bravomylife.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 bravomylife.co.kr All Rights Reserved.
 *
 *
 * Program		: com.github.ecommerce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: LoginWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240930153637][lcm991224@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.member.controller;

import java.net.URLEncoder;
import java.util.Properties;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.common.component.EmailCmpn;
import kr.co.bravomylife.common.dto.EmailDto;
import kr.co.bravomylife.front.common.Common;
import kr.co.bravomylife.front.member.dto.MemberDto;
import kr.co.bravomylife.front.member.service.MemberSrvc;
import kr.co.bravomylife.util.security.HSwithSHA;
import kr.co.bravomylife.util.security.SKwithAES;

/**
 * @version 1.0.0
 * @author lcm991224@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.front.member.controller.MemberWeb")
public class MemberWeb extends Common {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(MemberWeb.class);
	
	@Autowired
	Properties staticProperties;
	
	@Autowired
	private MessageSourceAccessor dynamicProperties;
	
	@Inject
	private EmailCmpn emailCmpn;
	
	@Inject
	private MemberSrvc memberSrvc;
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-01
	 * <p>DESCRIPTION:회원가입 페이지 jsp로만 가게</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/front/member/registerForm.web")
	public ModelAndView registerForm(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("front/member/registerForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".registerForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-01
	 * <p>DESCRIPTION:회원가입 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/front/member/registerProc.web" , method = RequestMethod.POST)
	public ModelAndView registerProc(HttpServletRequest request, HttpServletResponse response
			, MemberDto memberDto
			, String term_1
			, String term_2
			, String term_3) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			if (term_1 == null || term_1.equals("")) term_1 = "N";
			if (term_2 == null || term_2.equals("")) term_2 = "N";
			if (term_3 == null || term_3.equals("")) term_3 = "N";
			
			//logger.debug(term_1);
			//logger.debug(term_2);
			//logger.debug(term_3);
			
			// [2024-10-01][TODO: 약관 갯수(JSP)에 무관하게 처리될 수 있도록 개선]
			String[] arrTermAgreement = {term_1, term_2, term_3};
			
			/*
			logger.debug("암호화 전: " + memberDto.getEmail());
			logger.debug("암호화 전: " + memberDto.getPasswd());
			logger.debug("암호화 전: " + memberDto.getMbr_nm());
			logger.debug("암호화 전: " + memberDto.getAge());
			logger.debug("암호화 전: " + memberDto.getGender());
			logger.debug("암호화 전: " + memberDto.getPhone());
			logger.debug("암호화 전: " + memberDto.getPost() + " " + memberDto.getAddr1() + " " + memberDto.getAddr2());
			*/
			if (memberDto.getFlg_email() == null || memberDto.getFlg_email().equals("")) memberDto.setFlg_email("N");
			if (memberDto.getFlg_sms() == null || memberDto.getFlg_sms().equals("")) memberDto.setFlg_sms("N");
			
			//logger.debug(memberDto.getFlg_email());
			//logger.debug(memberDto.getFlg_sms());
			
			// 해쉬 암호화(SHA-256)
			memberDto.setPasswd(HSwithSHA.encode(memberDto.getPasswd()));
			//logger.debug("암호화 후(Passwd): " + memberDto.getPasswd());
			
			// 대칭키 암호화(AES-256)
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setEmail(aes.encode(memberDto.getEmail()));
			memberDto.setMbr_nm(aes.encode(memberDto.getMbr_nm()));
			memberDto.setPhone(aes.encode(memberDto.getPhone()));
			memberDto.setPost(aes.encode(memberDto.getPost()));
			memberDto.setAddr1(aes.encode(memberDto.getAddr1()));
			memberDto.setAddr2(aes.encode(memberDto.getAddr2()));
			//logger.debug("암호화 후(Email): " + memberDto.getEmail());
			//logger.debug("암호화 후(Name): " + memberDto.getName());
			//logger.debug("암호화 후(Phone): " + memberDto.getPhone());
			//logger.debug("암호화 후(Post + Addr1 + Addr2): " + memberDto.getPost() + " " + memberDto.getAddr1() + " " + memberDto.getAddr2());
			
			boolean insert = memberSrvc.insert(memberDto, arrTermAgreement, aes.decode(memberDto.getPost()));
			
			if (insert) {
				
				logger.debug("가입 성공");
				
				// 인증 이메일 발송
				EmailDto emailDto = new EmailDto();
				
				emailDto.setSender(dynamicProperties.getMessage("email.sender.mail"));
				emailDto.setTo(new String[] {aes.decode(memberDto.getEmail())});
				emailDto.setSubject("가입 축하 및 이메일 인증");
				emailDto.setMessage("<b>가입</b>을 축하합니다.</br>"
							+ "하기 인증하기를 10분 이내에 클릭하셔야 가입이 완료됩니다.</br></br>"
							+ "http://127.0.0.1:8080/front/member/confirmEmail.web?email=" + URLEncoder.encode(memberDto.getEmail()));
				
				emailCmpn.send(emailDto);
				
				// 가입 축하 이메일 발송
				/*
				EmailDto emailDto = new EmailDto();
				
				emailDto.setSender(dynamicProperties.getMessage("email.sender.mail"));
				emailDto.setTo(new String[] {aes.decode(memberDto.getEmail())});
				emailDto.setSubject("가입 축하");
				emailDto.setMessage("<b>가입</b>을 축하합니다.");
				
				emailCmpn.send(emailDto);
				*/
			}
			else logger.debug("가입 실패");
			
			
			request.setAttribute("redirect"	, "/");
			
			mav.setViewName("forward:/servlet/result.web");
		}
		catch  (Exception e) {
			logger.error("[" + this.getClass().getName() + ".registerProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
		
	}
}