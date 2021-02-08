package com.spring.bae2020.service;

import java.util.List;

import com.spring.bae2020.vo.BoardVo;

public interface BoardService {

	List<BoardVo> findBoard(int startIdx, String product, String sort);

	void insertBoard(BoardVo vo);

	BoardVo findBoardByIdx(String idx);

}
