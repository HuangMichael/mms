package com.subway.message;

import com.subway.unit.Unit;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 留言信息
 */
@Entity
@Table(name = "T_MESSAGE")
@Data
public class Message implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(length = 100, nullable = false)
    private String title;

    @Column(length = 500, nullable = false)
    private String content;

    @Column(length = 20, nullable = false)
    private String type;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "unit_id", referencedColumnName = "id", nullable = false)
    private Unit unit; //所对应的组织机构

    @Column(length = 20)
    private String createTime;

    @Column(length = 20)
    private String creator;

    @Column(length = 1)
    private String status;

    @Column(length = 20)
    private String authKey;
}
