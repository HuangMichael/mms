package com.subway.message;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;


/**
 * 留言信息表数据库访问接口
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */

public interface MessageRepository extends JpaRepository<Message, Long> {


    /**
     * @param title
     * @param status
     * @param authKey
     * @return
     */
    List<Message> findByTitleContainingAndStatusAndAuthKeyStartingWith(String title, String status, String authKey);


    /**
     * @param title
     * @param status
     * @param authKey
     * @return
     */
    Page<Message> findByTitleContainingAndStatusAndAuthKeyStartingWith(String title, String status, String authKey, Pageable pageable);


}
