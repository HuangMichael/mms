package com.subway.unit;

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
* 组织机构业务类
*
* @author huangbin
* @generate by autoCode
* @Date 2018-3-1
*/
@Service
public class UnitService extends BaseService {


@Autowired
UnitRepository unitRepository;


@Autowired
CommonDataService commonDataService;

public List
<Unit> findAll() {
return  unitRepository.findAll();
}


public Page< Unit> findAll(Pageable pageable) {
return  unitRepository.findAll(pageable);
}


/**
* @param id id
* @return 根据id删除对象
*/
public ReturnObject delete(Long id) {
unitRepository.delete(id);
Unit unit = unitRepository.findOne(id);
return commonDataService.getReturnType(unit == null, DELETE_SUCCESS, DELETE_FAILURE);
}


/**
* @param unit
* @return 保存信息
*/
public ReturnObject save(Unit unit) {

unit = unitRepository.save(unit);
return commonDataService.getReturnType(unit != null, SAVE_SUCCESS, SAVE_FAILURE);
}


public  Unit findById(Long id) {
return  unitRepository.getOne(id);
}

}
