package edu.poly.demoDuAn2.reponsitory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.poly.demoDuAn2.entity.HoaDon;


@Repository
public interface hoaDonRepository extends JpaRepository<HoaDon, Integer> {
	@Query("Select pt from HoaDon pt where pt.khachHang.ten=:id")
	public List<HoaDon> findAllByTen(@Param("id") String id);
	
	@Query("Select pt from HoaDon pt where pt.id=:id")
	public List<HoaDon> findAllById(@Param("id") int id);
}
