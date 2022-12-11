package edu.poly.demoDuAn2.reponsitory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.support.JpaRepositoryImplementation;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.poly.demoDuAn2.entity.ChiTietSanPham;
import edu.poly.demoDuAn2.entity.GioHang;
import edu.poly.demoDuAn2.entity.GioHangChiTiet;
import edu.poly.demoDuAn2.entity.HoaDon;

@Repository
public interface GioHangCTRepository extends JpaRepository<GioHangChiTiet, Integer> {

	@Query("Select pt from GioHangChiTiet pt where id=:id")
	public GioHangChiTiet findAllById(@Param("id") Integer id);

	@Query("Select pt from GioHangChiTiet pt where pt.chiTietSP.id=:id and pt.gioHang.khachHang.ten=:ten")
	public GioHangChiTiet findAllByIdSanPham(@Param("id") Integer id,@Param("ten") String ten);

	@Query("Select pt from GioHangChiTiet pt where pt.gioHang.khachHang.ten=:id")
	public List<GioHangChiTiet> findAllByTen(@Param("id") String id);
}
