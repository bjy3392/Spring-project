package com.spring.bae2020.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.bae2020.vo.BoardVo;

public interface BoardDao {

	List<BoardVo> findBoard(@Param("startIdx")int startIdx, @Param("product")String product, @Param("sort")String sort);

	void insertBoard(@Param("vo")BoardVo vo);

	BoardVo findBoardByIdx(@Param("idx")String idx);

}
