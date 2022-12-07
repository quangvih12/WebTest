package edu.poly.demoDuAn2.reponsitory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import edu.poly.demoDuAn2.entity.GioHang;

@Repository
public interface GioHangReponsitory extends JpaRepository<GioHang, Integer> {
 
}
