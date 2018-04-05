<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form class="form-horizontal" id="form" method="post">
    <div class="form-group">
        <div class="col-md-12">
                    <div class="form-group">
                <label for="id" class="col-md-2 control-label">序号</label>
                <div class="col-md-4">
                    <input class="form-control" id="id" name="id" v-model="message.id" />
                </div>
            </div>
            <div class="form-group">
                <label for="title" class="col-md-2 control-label">标题</label>
                <div class="col-md-4">
                    <input class="form-control" id="title" name="title" v-model="message.title" />
                </div>
            </div>
            <div class="form-group">
                <label for="content" class="col-md-2 control-label">内容</label>
                <div class="col-md-4">
                    <input class="form-control" id="content" name="content" v-model="message.content" />
                </div>
            </div>
            <div class="form-group">
                <label for="createTime" class="col-md-2 control-label">创建时间</label>
                <div class="col-md-4">
                    <input class="form-control" id="createTime" name="createTime" v-model="message.createTime"  required/>
                </div>
            </div>
            <div class="form-group">
                <label for="creator" class="col-md-2 control-label">创建人</label>
                <div class="col-md-4">
                    <input class="form-control" id="creator" name="creator" v-model="message.creator"  required/>
                </div>
            </div>
            <div class="form-group">
                <label for="type" class="col-md-2 control-label">留言类别</label>
                <div class="col-md-4">
                    <input class="form-control" id="type" name="type" v-model="message.type" />
                </div>
            </div>
            <div class="form-group">
                <label for="unitId" class="col-md-2 control-label">留言给</label>
                <div class="col-md-4">
                    <input class="form-control" id="unitId" name="unitId" v-model="message.unitId" />
                </div>
            </div>
            <div class="form-group">
                <label for="status" class="col-md-2 control-label">状态</label>
                <div class="col-md-4">
                    <input class="form-control" id="status" name="status" v-model="message.status"  required/>
                </div>
            </div>
            <div class="form-group">
                <label for="authKey" class="col-md-2 control-label">授权码</label>
                <div class="col-md-4">
                    <input class="form-control" id="authKey" name="authKey" v-model="message.authKey"  required/>
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