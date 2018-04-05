package com.subway.unit;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


/**
 * 组织机构数据库访问接口
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */

public interface UnitRepository extends JpaRepository<Unit, Long> {


    /**
     * @param name
     * @param status
     * @param authKey
     * @return
     */
    List<Unit> findByNameContainingAndStatusAndAuthKeyStartingWith(String name, String status, String authKey);


    /**
     * @param name
     * @param status
     * @param authKey
     * @return
     */
    Page<Unit> findByNameContainingAndStatusAndAuthKeyStartingWith(String name, String status, String authKey, Pageable pageable);


}
