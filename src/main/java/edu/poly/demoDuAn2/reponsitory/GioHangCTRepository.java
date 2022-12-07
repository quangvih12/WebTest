package edu.poly.demoDuAn2.reponsitory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.support.JpaRepositoryImplementation;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.poly.demoDuAn2.entity.ChiTietSanPham;
import edu.poly.demoDuAn2.entity.GioHang;
import edu.poly.demoDuAn2.entity.GioHangChiTiet;

@Repository
public interface GioHangCTRepository extends JpaRepository<GioHangChiTiet, Integer> {
	
	@Query("Select pt from GioHangChiTiet pt where id=:id")
	public GioHangChiTiet findAllById(@Param("id") Integer id);
	
	@Query("Select pt from GioHangChiTiet pt where pt.chiTietSP.id=:id")
	public GioHangChiTiet findAllByIdSanPham(@Param("id") Integer id);
}
