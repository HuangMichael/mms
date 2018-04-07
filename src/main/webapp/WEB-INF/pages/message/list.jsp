<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="/js/bootstrap-wizard/wizard.css"/>

<style>


    #editor {
        overflow: scroll;
        max-height: 300px
    }

</style>
<div class="container">
    <div class="row">
        <div id="content" class="col-lg-12">
            <!-- PAGE HEADER-->
            <%@include file="../common/common-breadcrumb.jsp" %>
            <div class="row">
                <div class="col-md-12">
                    <!-- BOX -->
                    <div class="box border blue" id="formWizard">
                        <div class="box-title">
                            <h4><i class="fa fa-bars"></i>快速留言</h4>
                        </div>
                        <%@include file="../common/common-menubar.jsp" %>
                        <div class="box-body">
                            <div id="contentDiv">
                                <div class="box-body">
                                    <form id="wizForm" action="#" class="form-horizontal">
                                        <div class="wizard-form">
                                            <div class="wizard-content">
                                                <ul class="nav nav-pills nav-justified steps">
                                                    <li>
                                                        <a href="#account" data-toggle="tab" class="wiz-step">
                                                            <span class="step-number">1</span>
                                                            <span class="step-name"><i
                                                                    class="fa fa-check"></i>阅读留言协议</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#payment" data-toggle="tab" class="wiz-step active">
                                                            <span class="step-number">2</span>
                                                            <span class="step-name"><i
                                                                    class="fa fa-check"></i>填写留言内容</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#confirm" data-toggle="tab" class="wiz-step">
                                                            <span class="step-number">3</span>
                                                            <span class="step-name"><i
                                                                    class="fa fa-check"></i>提交留言信息 </span>
                                                        </a>
                                                    </li>
                                                </ul>


                                                <div id="bar" class="progress progress-striped progress-sm active"
                                                     role="progressbar">
                                                    <div class="progress-bar progress-bar-warning"></div>
                                                </div>
                                                <div class="tab-content">
                                                    <div class="tab-pane active" id="account">
                                                        <pre>“中国·武威”网络留言办理反馈系统是社会公众通过“中国·武威”门户网站向市政府及市、县（区）各职能部门提出有关意见和建议的窗口。此栏目既是市政府领导、市、县（区）各职能部门与社会群体、人民群众之间实现沟通的桥梁，也是帮助市政府领导及市、县（区）各职能部门发现和解决经济社会生活中的重大突出问题的重要渠道，是实施政务公开的重要措施。真诚欢迎您为武威的经济建设和社会发展献计献策，对政府工作中的不足之处提出批评和改进的意见。
    为了办好“中国·武威”网络留言办理反馈系统，更好地为社会公众服务，根据《宪法》、国务院《信访条例》、甘肃省《信访条例》和全国人民代表大会常务委员会《关于维护互联网安全的决定》的有关规定，特对留言做如下规定：
    一、受理范围
    （一）对人民政府颁布的规章等规范性文件的意见和建议；
    （二）对人民政府及其所属工作部门的意见、建议和批评；
    （三）对人民政府及其所属工作部门工作人员的违法失职行为的申诉、控告或者检举；
    （四）不服人民政府及其所属工作部门处理决定的申诉；
    （五）属于人民政府职权范围内的其他信访事项。
    二、留言须知
    （一）写信人有权依法向有关的国家机关及其工作人员提出批评、建议；对国家机关及其工作人员的违法失职行为提出申诉、控告或者检举；在自身或者他人、公共的合法权益受到侵害时，提出申诉、控告。
    （二）写信人在写信活动中应遵守宪法、法律、法规、规章以及社会公德和《“中国·武威”网络留言办理反馈系统》的秩序，如实反映情况，不得捏造、歪曲事实，诽谤、诬告陷害他人。
    （三）如果您反映和投诉的问题，涉及市政建设、居民生活、就业和再就业以及社会保障等方面，请先向问题发生地的县（区）人民政府或其主管部门反映，以便得到及时解决。
    （四）如果您反映或投诉的问题已进入司法程序（法院两审或已判等），按照国家法规规定此类问题不属于政府管辖范围，请将问题向当地人大常委会、政法委或上一级司法机关反映。
    （五）写信应署本人的真实姓名，不要隐瞒姓名或采用化名、笔名；应当注明本人的具体联系方式，如工作单位、家庭住址、邮政编码、电子邮件信箱等，以便于国家机关及其信访工作人员同来信人保持联系，使信访事项及时得以妥善解决。
                                                    </pre>
                                                    </div>
                                                    <div class="tab-pane" id="payment">
                                                        <form class="form-horizontal" id="form" method="post">
                                                            <div class="form-group">
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label for="domainName"
                                                                               class="col-md-2 control-label">留言类别</label>
                                                                        <div class="col-md-4">
                                                                            <input class="form-control" id="id"
                                                                                   name="id" v-model="tableConfig.id"
                                                                                   type="hidden"/>
                                                                            <input class="form-control" id="domainName"
                                                                                   name="domainName" required/>
                                                                        </div>
                                                                        <label for="repositoryName"
                                                                               class="col-md-2 control-label">留言给</label>
                                                                        <div class="col-md-4">
                                                                            <input class="form-control"
                                                                                   id="repositoryName"
                                                                                   name="repositoryName" required/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <div class="tab-pane" id="confirm">
                                                        这里确认后要提交信息
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="wizard-buttons">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="col-md-offset-3 col-md-9">
                                                            <a href="javascript:;" class="btn btn-default prevBtn">
                                                                <i class="fa fa-arrow-circle-left"></i> 上一步
                                                            </a>
                                                            <a href="javascript:;" class="btn btn-primary nextBtn">
                                                                下一步 <i class="fa fa-arrow-circle-right"></i>
                                                            </a>
                                                            <a href="javascript:;" class="btn btn-danger submitBtn">
                                                                确认提交 <i class="fa fa-arrow-circle-right"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>


                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /BOX -->
                </div>
            </div>
            <%@include file="../common/common-back2top.jsp" %>
        </div>
        <!-- /CONTENT-->
    </div>
</div>
<%--<script type="text/javascript" src="/js/app/message/message.js"></script>--%>
<script type="text/javascript" src="/js/bootstrap-wizard/form-wizard.min.js"></script>


<script type="text/javascript">
    $(function () {
        FormWizard.init();
    });
</script>
