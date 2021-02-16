package com.spring.bae2020.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bae2020.dao.BoardDao;
import com.spring.bae2020.vo.BoardVo;

@Service
public class BoardServiceImp implements BoardService {
	@Autowired
	BoardDao boardDao;

	@Override
	public List<BoardVo> findBoard(int startIdx, String product, String sort) {
		return boardDao.findBoard(startIdx, product, sort);
	}

	@Override
	public void insertBoard(BoardVo vo) {
		boardDao.insertBoard(vo);
	}

	@Override
	public BoardVo findBoardByIdx(String idx) {
		return boardDao.findBoardByIdx(idx);
	}

	@Override
	public void updateBoard(BoardVo vo, String idx) {
		boardDao.updateBoard(vo, idx);
	}

	@Override
	public void deleteBoard(String idx) {
		boardDao.deleteBoard(idx);		
	}

	@Override
	public void updateBoardByGood(String idx) {
		boardDao.updateBoardByGood(idx);			
	}	
	
}
