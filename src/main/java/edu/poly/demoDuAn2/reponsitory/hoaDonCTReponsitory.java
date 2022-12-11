package edu.poly.demoDuAn2.reponsitory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.poly.demoDuAn2.entity.GioHangChiTiet;
import edu.poly.demoDuAn2.entity.hoaDonChiTiet;
@Repository
public interface hoaDonCTReponsitory extends JpaRepository<hoaDonChiTiet, Integer> {
	@Query("Select pt from hoaDonChiTiet pt where id=:id")
	public hoaDonChiTiet findAllById(@Param("id") Integer id);
	
	@Query("Select pt from hoaDonChiTiet pt where pt.hoaDon.id=:id")
	public List<hoaDonChiTiet> findAllByIdHoaDon(@Param("id") Integer id);
}
