package com.catcha.cat.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class RecordForm {
	
	@NotBlank(message = "name must be filled")
	@Size(max = 9, message = "name is too long")
	private String name;
	private int score;

}
