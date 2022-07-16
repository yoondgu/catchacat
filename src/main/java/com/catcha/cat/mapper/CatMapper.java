package com.catcha.cat.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.catcha.cat.vo.Record;

@Mapper
public interface CatMapper {
	List<Record> getAllRecords();
	void insertRecord(Record record);
	Record getSameRecord(Record record);
}
