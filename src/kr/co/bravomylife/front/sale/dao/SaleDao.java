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
 * File			: SaloDao.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241001112551][cydgate4957@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.sale.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.bravomylife.front.common.dao.BaseDao;
import kr.co.bravomylife.front.common.dto.PagingDto;
import kr.co.bravomylife.front.sale.dto.SaleDto;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-01
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Repository("kr.co.bravomylife.front.sale.dao.SaleDao")
public class SaleDao extends BaseDao {
		
	public int setLikeUpdate(SaleDto saleDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.sale.Sale.setLikeUpdate", saleDto);
	}
	
	public int setLikeCheck(SaleDto saleDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.setLikeCheck", saleDto);
	}
	
	public int setLikeInsert(SaleDto saleDto) {
		return sqlSessionFront.insert("kr.co.bravomylife.front.mybatis.sale.Sale.setLikeInsert", saleDto);
	}
	
	public int delLike(SaleDto saleDto) {		
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.sale.Sale.delLike", saleDto);
	}
	
	public List<SaleDto> reviewList(PagingDto pagingDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.sale.Sale.reviewList", pagingDto);
	}
	
	public int reviewCount(PagingDto pagingDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.reviewCount", pagingDto);
	}
	
	public List<SaleDto> detailList(PagingDto pagingDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.sale.Sale.detailList", pagingDto);
	}
	
	public int detailCount(PagingDto pagingDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.detailCount", pagingDto);
	}
	
	public SaleDto select(SaleDto saleDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.select", saleDto);
	}
	
	public List<SaleDto> functionList(PagingDto pagingDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.sale.Sale.functionList", pagingDto);
	}
	
	public int functionCount(PagingDto pagingDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.functionCount", pagingDto);
	}
	
	public List<SaleDto> ingredientList(PagingDto pagingDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.sale.Sale.ingredientList", pagingDto);
	}
	
	public int ingredientCount(PagingDto pagingDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.ingredientCount", pagingDto);
	}
	
	public List<SaleDto> genderList(PagingDto pagingDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.sale.Sale.genderList", pagingDto);
	}
	
	public int genderCount(PagingDto pagingDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.genderCount", pagingDto);
	}
	
	public List<SaleDto> totalList(PagingDto pagingDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.sale.Sale.totalList", pagingDto);
	}
	
	public int totalCount(PagingDto pagingDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.totalCount", pagingDto);
	}
}