<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form class="form-horizontal" id="form" method="post">
    <div class="form-group">
        <div class="col-md-12">
                    <div class="form-group">
                <label for="id" class="col-md-2 control-label">序号</label>
                <div class="col-md-4">
                    <input class="form-control" id="id" name="id" v-model="messageReply.id" />
                </div>
            </div>
            <div class="form-group">
                <label for="content" class="col-md-2 control-label">回复内容</label>
                <div class="col-md-4">
                    <input class="form-control" id="content" name="content" v-model="messageReply.content" />
                </div>
            </div>
            <div class="form-group">
                <label for="createTime" class="col-md-2 control-label">回复时间</label>
                <div class="col-md-4">
                    <input class="form-control" id="createTime" name="createTime" v-model="messageReply.createTime"  required/>
                </div>
            </div>
            <div class="form-group">
                <label for="messageId" class="col-md-2 control-label">留言</label>
                <div class="col-md-4">
                    <input class="form-control" id="messageId" name="messageId" v-model="messageReply.messageId" />
                </div>
            </div>
            <div class="form-group">
                <label for="unitId" class="col-md-2 control-label">组织机构</label>
                <div class="col-md-4">
                    <input class="form-control" id="unitId" name="unitId" v-model="messageReply.unitId" />
                </div>
            </div>
            <div class="form-group">
                <label for="authKey" class="col-md-2 control-label">授权码</label>
                <div class="col-md-4">
                    <input class="form-control" id="authKey" name="authKey" v-model="messageReply.authKey"  required/>
                </div>
            </div>
            <div class="form-group">
                <label for="status" class="col-md-2 control-label">状态</label>
                <div class="col-md-4">
                    <input class="form-control" id="status" name="status" v-model="messageReply.status"  required/>
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