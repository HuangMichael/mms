package com.subway.messageReply;

import com.subway.message.Message;
import com.subway.unit.Unit;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 留言信息回复
 */
@Entity
@Table(name = "T_MESSAGE_REPLY")
@Data
public class MessageReply implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "unit_id", referencedColumnName = "id", nullable = false)
    private Unit unit; //所对应的组织机构

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "message_id", referencedColumnName = "id", nullable = false)
    private Message message; //所对应的组织机构


    @Column(length = 500, nullable = false)
    private String content;


    @Column(length = 20)
    private String createTime;


    @Column(length = 1)
    private String status;

    @Column(length = 20)
    private String authKey;
}
