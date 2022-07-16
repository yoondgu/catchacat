package com.catcha.cat.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catcha.cat.exception.CatException;
import com.catcha.cat.mapper.CatMapper;
import com.catcha.cat.vo.Record;
import com.catcha.cat.vo.RecordForm;

@Service
public class CatService {

	@Autowired
	private CatMapper mapper;
	
	public void addNewRecord(RecordForm recordForm) {
		
		Record record = new Record();
		BeanUtils.copyProperties(recordForm, record);
		
		if (mapper.getSameRecord(record) != null) {
			throw new CatException("there's a record with same name and score already!");
		}
		mapper.insertRecord(record);
	}
	
	public List<Record> getRankedRecords(int rankCount) {
		List<Record> allRecords = mapper.getAllRecords();
		List<Record> rankedRecords = new ArrayList<>();
		for (int i=0; i < rankCount; i++) {
			rankedRecords.add(allRecords.get(i));
		}
		
		return rankedRecords;
	}
}
