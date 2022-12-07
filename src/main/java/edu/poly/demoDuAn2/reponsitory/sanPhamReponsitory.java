package edu.poly.demoDuAn2.reponsitory;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import edu.poly.demoDuAn2.entity.ChiTietSanPham;
import edu.poly.demoDuAn2.entity.SanPham;

public interface sanPhamReponsitory extends JpaRepository<ChiTietSanPham, Integer> {

	@Query("Select pt from ChiTietSanPham pt where id=:id")
	public ChiTietSanPham findAllById(@Param("id") Integer id);

	@Query("Select pt from ChiTietSanPham pt  where pt.sanPham.ten like :ten or pt.sanPham.ma like :ten")
	public Page<ChiTietSanPham> findAllBySanphamTen(String ten, Pageable pageable);

}
