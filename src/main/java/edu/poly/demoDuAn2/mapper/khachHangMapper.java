package edu.poly.demoDuAn2.mapper;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.poly.demoDuAn2.dto.khachHangDTO;
import edu.poly.demoDuAn2.entity.KhachHang;

@Service
public class khachHangMapper {
	
	@Autowired
	private ModelMapper mapper;

	public KhachHang convertToEntity(khachHangDTO khDTO) {
		KhachHang entity = mapper.map(khDTO, KhachHang.class);

		return entity;
	}

	public khachHangDTO convertToDTO(KhachHang entity) {
		khachHangDTO khDTO = mapper.map(entity, khachHangDTO.class);

		return khDTO;
	}
}
