<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form class="form-horizontal" id="form" method="post">
    <div class="form-group">
        <div class="form-group">
            <label for="code" class="col-md-2 control-label">机构编号</label>
            <div class="col-md-4">
                <input class="form-control" id="id" name="id" v-model="unit.id" type="hidden"/>
                <input class="form-control" id="code" name="code" v-model="unit.code" required/>
            </div>
            <label for="name" class="col-md-2 control-label">机构名称</label>
            <div class="col-md-4">
                <input class="form-control" id="name" name="name" v-model="unit.name" required/>
            </div>
        </div>
        <div class="form-group">
            <label for="parentId" class="col-md-2 control-label">上级机构</label>
            <div class="col-md-4">
                <input class="form-control" id="parentId" name="parent.id" v-model="unit.parent.id"/>
            </div>
            <label for="sortNo" class="col-md-2 control-label">排序</label>
            <div class="col-md-4">
                <input class="form-control" id="sortNo" name="sortNo" v-model="unit.sortNo"/>
            </div>
        </div>
        <div class="form-group">
            <label for="status" class="col-md-2 control-label">状态</label>
            <div class="col-md-4">
                <input class="form-control" id="status" name="status" v-model="unit.status" required/>
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
</form>