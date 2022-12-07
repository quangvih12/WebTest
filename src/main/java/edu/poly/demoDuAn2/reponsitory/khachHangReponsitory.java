package edu.poly.demoDuAn2.reponsitory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.poly.demoDuAn2.entity.KhachHang;

@Repository
public interface khachHangReponsitory extends JpaRepository<KhachHang, Integer> {

	@Query("select kh from KhachHang kh where email=:email")
	public KhachHang findByEmail(@Param("email") String email);

}
