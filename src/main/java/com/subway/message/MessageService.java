package com.subway.message;

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
* 留言信息表业务类
*
* @author huangbin
* @generate by autoCode
* @Date 2018-3-1
*/
@Service
public class MessageService extends BaseService {


@Autowired
MessageRepository messageRepository;


@Autowired
CommonDataService commonDataService;

public List
<Message> findAll() {
return  messageRepository.findAll();
}


public Page< Message> findAll(Pageable pageable) {
return  messageRepository.findAll(pageable);
}


/**
* @param id id
* @return 根据id删除对象
*/
public ReturnObject delete(Long id) {
messageRepository.delete(id);
Message message = messageRepository.findOne(id);
return commonDataService.getReturnType(message == null, DELETE_SUCCESS, DELETE_FAILURE);
}


/**
* @param message
* @return 保存信息
*/
public ReturnObject save(Message message) {

message = messageRepository.save(message);
return commonDataService.getReturnType(message != null, SAVE_SUCCESS, SAVE_FAILURE);
}


public  Message findById(Long id) {
return  messageRepository.getOne(id);
}

}
