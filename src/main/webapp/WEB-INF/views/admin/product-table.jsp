<%@ include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Products</title>
    <link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/template/admin/assets/images/favicon.png" />">
    <link href="<c:url value="/template/admin/css/style.css" />" rel="stylesheet">
    <%--    <link rel="stylesheet" href="<c:url value="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" />">--%>
    <script src="<c:url value="/template/admin/js/modernizr-3.6.0.min.js" />"></script>
    <style type="text/css">
        .currency-custom:after {
            content: ' VNĐ';
        }
    </style>
    <script src="<c:url value="/template/custom/customFormatNumber.js" />"></script>
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
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Danh sách sản phẩm</h4>
                        <a href="<c:url value="/admin/product"/>">
                            <button type="button" class="btn btn-rounded btn-info">
                                <span class="btn-icon-left"><i class="fa fa-plus color-info"></i></span>Add
                            </button>
                        </a>
                        <div class="table-responsive">
                            <table class="table">
                                <thead class="thead-muted">
                                <tr>
                                    <th scope="col">STT</th>
                                    <th scope="col">ID</th>
                                    <th scope="col">Branch Name</th>
                                    <th scope="col">Product Name</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Unit price</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${products}" var="product" varStatus="itr">
                                    <tr style="height: 100px;">
                                        <td>${itr.index +1}</td>
                                        <td>${product.id}</td>
                                        <td>${product.branch.name}</td>
                                        <td>${product.name}</td>
                                        <td>${product.quantity}</td>
                                        <td class="currency-custom" id="${itr.index +1}"></td>
                                        <td><img src="<c:url value="${product.productImage}" />"
                                                 style="height: 100px; width: 100px;" alt=""></td>
                                        <td>
                                            <a class="fa fa-pencil"
                                               href="<c:url value="/admin/product/${product.id}" />"></a><span>   </span>
                                            <a class="fa fa-trash"
                                               href="<c:url value="/admin/product-delete/${product.id}" />"
                                               onclick="return confirm('Are you sure you want to delete?')"></a>
                                        </td>
                                    </tr>
                                    <script type="text/javascript">
                                        document.getElementById('${itr.index +1}').innerHTML = FormatNumber('${product.unitPrice}' )
                                    </script>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <%--                        <ul class="pagination" id="pagination"></ul>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--    <script type="text/javascript">--%>
    <%--        $(function () {--%>
    <%--            window.pagObj = $('#pagination').twbsPagination({--%>
    <%--                totalPages: 35,--%>
    <%--                visiblePages: 10,--%>
    <%--                onPageClick: function (event, page) {--%>
    <%--                    console.info(page + ' (from options)');--%>
    <%--                }--%>
    <%--            }).on('page', function (event, page) {--%>
    <%--                console.info(page + ' (from event listening)');--%>
    <%--            });--%>
    <%--        });--%>
    <%--    </script>--%>
    <!-- footer -->
    <%@ include file="/common/admin/footer.jsp" %>
    <!-- footer -->
</div>

<!-- Common JS -->
<script src="<c:url value="/template/admin/assets/plugins/common/common.min.js" />"></script>
<!-- Custom script -->
<script src="<c:url value="/template/admin/js/custom.min.js" />"></script>
<!-- Paging -->
<%--<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>--%>
<%--<script src="<c:url value="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js " />"></script>--%>
<%--<script src="<c:url value="/template/paging/jquery.twbsPagination.js " /> " ></script>--%>
</body>
</html>