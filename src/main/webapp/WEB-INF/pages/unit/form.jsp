<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form class="form-horizontal" id="form" method="post">
    <div class="form-group">
        <div class="col-md-12">
                    <div class="form-group">
                <label for="id" class="col-md-2 control-label">序号</label>
                <div class="col-md-4">
                    <input class="form-control" id="id" name="id" v-model="unit.id" />
                </div>
            </div>
            <div class="form-group">
                <label for="name" class="col-md-2 control-label">单位名称</label>
                <div class="col-md-4">
                    <input class="form-control" id="name" name="name" v-model="unit.name" />
                </div>
            </div>
            <div class="form-group">
                <label for="unitDesc" class="col-md-2 control-label">单位描述</label>
                <div class="col-md-4">
                    <input class="form-control" id="unitDesc" name="unitDesc" v-model="unit.unitDesc" />
                </div>
            </div>
            <div class="form-group">
                <label for="contact" class="col-md-2 control-label">联系人</label>
                <div class="col-md-4">
                    <input class="form-control" id="contact" name="contact" v-model="unit.contact" />
                </div>
            </div>
            <div class="form-group">
                <label for="telephone" class="col-md-2 control-label">联系电话</label>
                <div class="col-md-4">
                    <input class="form-control" id="telephone" name="telephone" v-model="unit.telephone" />
                </div>
            </div>
            <div class="form-group">
                <label for="workDays" class="col-md-2 control-label">工作值</label>
                <div class="col-md-4">
                    <input class="form-control" id="workDays" name="workDays" v-model="unit.workDays" />
                </div>
            </div>
            <div class="form-group">
                <label for="sortNo" class="col-md-2 control-label">排序</label>
                <div class="col-md-4">
                    <input class="form-control" id="sortNo" name="sortNo" v-model="unit.sortNo" />
                </div>
            </div>
            <div class="form-group">
                <label for="status" class="col-md-2 control-label">状态</label>
                <div class="col-md-4">
                    <input class="form-control" id="status" name="status" v-model="unit.status" />
                </div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default"
                data-dismiss="modal">关闭
        </button>
        <button id="saveBtn" name="saveBtn"
                class="btn btn-danger">保存
        </button>
    </div>
    </div>
</form>