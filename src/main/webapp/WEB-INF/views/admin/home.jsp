<%@ include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Admin home</title>
    <link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/template/admin/assets/images/favicon.png" />">
    <link href="<c:url value="/template/admin/css/style.css" />" rel="stylesheet">
    <script src="<c:url value="/template/admin/js/modernizr-3.6.0.min.js" />"></script>
</head>
<body class="v-light vertical-nav fix-header fix-sidebar">
<div id="preloader">
    <div class="loader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10"></circle>
        </svg>
    </div>
</div>
<div id="main-wrapper">
    <!-- header -->
    <%@ include file="/common/admin/header.jsp" %>
    <!-- header -->

    <!-- sidebar -->
    <%@ include file="/common/admin/menu.jsp" %>
    <!-- sidebar -->

    <div class="content-body" style="min-height: 814px;">
        <div class="container">
            <div class="row page-titles">
                <div class="col p-0">
                    <h4>Hello, <%=SecurityUtil.getUserName()%> <span>Welcome here</span></h4>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="form-validation">
                                <form action="">
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label">Admin ID
                                    </label>
                                    <div class="col-lg-6">
                                        <input type="text" class="form-control" name="name" value="${user.id}"
                                               disabled="disabled">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label">Admin Email
                                    </label>
                                    <div class="col-lg-6">
                                        <input type="text" class="form-control" name="name" value="${user.email}"
                                               disabled="disabled">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label">Admin Name
                                    </label>
                                    <div class="col-lg-6">
                                        <input type="text" class="form-control" name="name" value="${user.fullName}"
                                               disabled="disabled">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label">Admin Phone
                                    </label>
                                    <div class="col-lg-6">
                                        <input type="text" class="form-control" name="name" value="${user.phone}"
                                               disabled="disabled">
                                    </div>
                                </div>
                                </form>
                            </div>
                            <h3><a href="<c:url value="/change-password"/>">Change Password</a></h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- footer -->
    <%@ include file="/common/admin/footer.jsp" %>
    <!-- footer -->
</div>

<!-- Common JS -->
<script src="<c:url value="/template/admin/assets/plugins/common/common.min.js" />"></script>
<!-- Custom script -->
<script src="<c:url value="/template/admin/js/custom.min.js" />"></script>
</body>
</html>