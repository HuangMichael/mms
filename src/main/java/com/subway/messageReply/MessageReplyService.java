package com.subway.messageReply;

import java.util.List;
import java.util.Map;

import com.subway.service.app.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import com.subway.service.commonData.CommonDataService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import com.subway.object.ReturnObject;
import static com.subway.utils.ConstantUtils.*;


/**
* 留言回复业务类
*
* @author huangbin
* @generate by autoCode
* @Date 2018-3-1
*/
@Service
public class MessageReplyService extends BaseService {


@Autowired
MessageReplyRepository messageReplyRepository;


@Autowired
CommonDataService commonDataService;

public List
<MessageReply> findAll() {
return  messageReplyRepository.findAll();
}


public Page< MessageReply> findAll(Pageable pageable) {
return  messageReplyRepository.findAll(pageable);
}


/**
* @param id id
* @return 根据id删除对象
*/
public ReturnObject delete(Long id) {
messageReplyRepository.delete(id);
MessageReply messageReply = messageReplyRepository.findOne(id);
return commonDataService.getReturnType(messageReply == null, DELETE_SUCCESS, DELETE_FAILURE);
}


/**
* @param messageReply
* @return 保存信息
*/
public ReturnObject save(MessageReply messageReply) {

messageReply = messageReplyRepository.save(messageReply);
return commonDataService.getReturnType(messageReply != null, SAVE_SUCCESS, SAVE_FAILURE);
}


public  MessageReply findById(Long id) {
return  messageReplyRepository.getOne(id);
}

}
