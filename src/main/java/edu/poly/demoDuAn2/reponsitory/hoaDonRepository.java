package edu.poly.demoDuAn2.reponsitory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import edu.poly.demoDuAn2.entity.HoaDon;
import edu.poly.demoDuAn2.entity.hoaDonChiTiet;

@Repository
public interface hoaDonRepository extends JpaRepository<HoaDon, Integer> {

}
