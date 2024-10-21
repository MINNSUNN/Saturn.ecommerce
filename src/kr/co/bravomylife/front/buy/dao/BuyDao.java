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
 * File			: BuyDao.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241003231434][cydgate4957@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.buy.dao;

import org.springframework.stereotype.Service;

import kr.co.bravomylife.front.buy.dto.BuyDetailDto;
import kr.co.bravomylife.front.buy.dto.BuyMasterDto;
import kr.co.bravomylife.front.common.dao.BaseDao;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-03
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Service("kr.co.bravomylife.front.buy.dao.BuyDao")
public class BuyDao extends BaseDao {
	
	public int checkBasket(BuyDetailDto buyDetailDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.basket.Basket.checkBasket", buyDetailDto);
	}
	
	public int updateBasket(BuyDetailDto buyDetailDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.basket.Basket.updateBasket", buyDetailDto);
	}
	
	public int updateCountStock(BuyDetailDto buyDetailDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.sale.Sale.updateCountStock", buyDetailDto);
	}
	
	public int update(BuyMasterDto buyMasterDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.buy.BuyMaster.update", buyMasterDto);
	}
	
	public int sequenceMaster() {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.buy.BuyMaster.sequence");
	}
	
	public int insertMaster(BuyMasterDto buyMasterDto) {
		return sqlSessionFront.insert("kr.co.bravomylife.front.mybatis.buy.BuyMaster.insert", buyMasterDto);
	}
	
	public int sequenceDetail() {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.buy.BuyDetail.sequence");
	}
	
	public int insertDetail(BuyDetailDto buyDetailDto) {
		return sqlSessionFront.insert("kr.co.bravomylife.front.mybatis.buy.BuyDetail.insert", buyDetailDto);
	}
}
