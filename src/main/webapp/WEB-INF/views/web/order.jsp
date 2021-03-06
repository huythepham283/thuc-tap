<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.nhom8.camera.util.SecurityUtil" %>
<html>
<head>
    <title>Confirm order</title>
    <link href="<c:url value="/template/web/css/bootstrap.css"/>" rel="stylesheet" type="text/css" media="all"/>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="<c:url value="/template/web/css/style.css"/>" rel="stylesheet" type="text/css" media="all"/>
    <link href="<c:url value="/template/web/css/style4.css"/>" rel="stylesheet" type="text/css" media="all"/>
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Camera"/>

    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <script src="<c:url value="/template/web/js/jquery.min.js"/>"></script>
    <!--- start-rate---->
    <%--    <script src="<c:url value="/template/web/js/jstarbox.js"/>"></script>--%>
    <%--    <link rel="stylesheet" href="<c:url value="/template/web/css/jstarbox.css"/>" type="text/css" media="screen" charset="utf-8" />--%>

</head>
<body>
<c:set var="userNameCheck" value="<%=SecurityUtil.getUserName()%>"/>
<!--header-->
<div class="header">
    <div class="container">
        <div class="head">
            <div class=" logo">
                <a href="<c:url value="/index"/>"><img src="<c:url value="/template/web/images/logo.png"/>" alt=""></a>
            </div>
        </div>
    </div>
    <div class="header-top">
        <div class="container">

            <div class="col-sm-5 col-md-offset-2  header-login">
                <ul>
                    <c:if test="${userNameCheck == 'anonymousUser'}">
                        <li><a href="<c:url value="/register"/>">Register</a></li>
                    </c:if>
                    <c:if test="${userNameCheck != 'anonymousUser'}">
                        <li><a href="<c:url value="/edit-profile"/>">Edit profile</a></li>
                        <li><a href="<c:url value="/change-password"/>">Change password</a></li>
                    </c:if>
                </ul>
            </div>

            <c:if test="${userNameCheck != 'anonymousUser'}">
                <div class="col-sm-5 header-social">
                    <ul>
                        <li style="color: white">
                            Xin chào <%=SecurityUtil.getUserName()%>
                        </li>
                        <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                        <li><a href="<c:url value="/logout"/>" style="color: white; font-size: 15px">Logout</a></li>
                    </ul>
                </div>
            </c:if>
            <c:if test="${userNameCheck == 'anonymousUser'}">
                <div class="col-sm-5 header-social">
                    <ul>
                        <li><a href="<c:url value="/login" />" style="color: white; font-size: 15px">Login</a></li>
                    </ul>
                </div>
            </c:if>
            <div class="clearfix"></div>
        </div>
    </div>

    <div class="container">
        <div class="head-top">
            <div class="col-sm-8 col-md-offset-2 h_menu4">
                <nav class="navbar nav_bottom" role="navigation">
                    <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                        <ul class="nav navbar-nav nav_1">
                            <li><a class="color" href="<c:url value="/home"/>">Home</a></li>
                            <li class="dropdown mega-dropdown active">
                                <a class="color1" href="#" class="dropdown-toggle" data-toggle="dropdown">Brand<span
                                        class="caret"></span></a>
                                <div class="dropdown-menu ">
                                    <div class="menu-top">
                                        <div class="col1">
                                            <div class="h_nav">
                                                <c:forEach items="${lstProductBrand}" var="brand">
                                                    <ul>
                                                        <li>
                                                            <a href="<c:url value="/product?brandId=${brand.id}"/>">${brand.name}</a>
                                                        </li>
                                                    </ul>
                                                </c:forEach>
                                            </div>
                                        </div>

                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </li>
                            <li><a class="color4" href="<c:url value="/info"/>">About</a></li>
                            <li><a class="color6" href="<c:url value="/contact"/>">Contact</a></li>
                        </ul>
                    </div>
                </nav>
            </div>

            <div class="col-sm-2 search-right">
                <ul class="heart">
                    <li><span class="glyphicon " aria-hidden="true"></span></li>
                    <li><a class="play-icon popup-with-zoom-anim" href="<c:url value="#small-dialog"/>"><i
                            class="glyphicon glyphicon-search"> </i></a></li>
                </ul>
                <c:if test="${userNameCheck != 'anonymousUser'}">
                    <div class="cart box_1">
                        <a href="<c:url value="/checkout"/>">
                            <h3>
                                <div class="total" id="total">
                                </div>
                                <img src="<c:url value="/template/web/images/cart.png"/>" alt=""/>
                            </h3>
                        </a>
                        <p><a href="<c:url value="/order-history"/>" class="simpleCart_empty">Order history</a></p>
                    </div>
                </c:if>
                <div class="clearfix"></div>
                <!----->

                <!---pop-up-box---->
                <link href="<c:url value="/template/web/css/popuo-box.css"/>" rel="stylesheet" type="text/css"
                      media="all"/>
                <script src="<c:url value="/template/web/js/jquery.magnific-popup.js"/>"
                        type="text/javascript"></script>
                <div id="small-dialog" class="mfp-hide">
                    <div class="search-top">
                        <div class="login-search">
                            <form:form action="/search" method="POST">
                                <input type="text" name="searchValue" placeholder="Search.." onfocus="this.value = '';"
                                       onblur="if (this.value == '') {this.value = 'Search..';}">
                                <input type="submit" value="">
                            </form:form>
                        </div>
                        <p style="font-size: 10px">Enter the product name or brand name</p>
                    </div>
                </div>
                <script>
                    $(document).ready(function () {
                        $('.popup-with-zoom-anim').magnificPopup({
                            type: 'inline',
                            fixedContentPos: false,
                            fixedBgPos: true,
                            overflowY: 'auto',
                            closeBtnInside: true,
                            preloader: false,
                            midClick: true,
                            removalDelay: 300,
                            mainClass: 'my-mfp-zoom-in'
                        });

                    });
                </script>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!--header-->

<!--banner-->
<div class="container">
    <div class="banner-top">
        <div class="container">
            <h1>Shop Camera</h1>
            <em></em>
            <h2><a href="<c:url value="/"/>">Home</a><label>/</label>Order</h2>
        </div>
    </div>
</div>
<!--banner-->
<div class="container wrapper">
    <div class="row cart-head">
        <div class="container">
            <div class="row">
            </div>
            <div class="row">
                <p></p>
            </div>
        </div>
    </div>
    <br>
    <h3 id="message-dr" style="font-family: ''; text-align: center">${message}</h3>
    <br><br>
    <div class="row cart-body">
        <form class="form-horizontal" id="orderForm">
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-push-6 col-sm-push-6">
                <!--REVIEW ORDER-->
                <div class="panel panel-info">
                    <div class="panel-heading">
                        Review Order
                        <div class="pull-right"><small><a class="afix-1" href="<c:url value="/checkout"/>">Edit Cart</a></small>
                        </div>
                    </div>
                    <div class="panel-body" id="myData">

                    </div>
                </div>
                <!--REVIEW ORDER END-->
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-pull-6 col-sm-pull-6">
                <!--SHIPPING METHOD-->
                <div class="panel panel-info">
                    <style>
                        .col-md-12 > input {
                            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
                        }
                    </style>
                    <div class="panel-heading">Your information</div>
                    <div class="panel-body">
                        <div class="form-group">
                            <div class="col-md-12">
                                <h4>Type here</h4>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12"><strong>Full Name:</strong></div>
                            <div class="col-md-12">
                                <input type="text" class="form-control" id="fullName" name="fullName" value=""/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <span id="validFullName" class="glyphicon glyphicon-remove"
                                      style="color:#FF0004;"></span>Min 8 Characters<br>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12"><strong>Address:</strong></div>
                            <div class="col-md-12">
                                <input type="text" name="address" id="address" class="form-control" value=""/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <span id="validAddress" class="glyphicon glyphicon-remove"
                                      style="color:#FF0004;"></span>15-100 Characters<br>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12"><strong>Phone:</strong></div>
                            <div class="col-md-12">
                                <input type="text" name="phoneNumber" id="phoneNumber" class="form-control" value=""/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <span id="validPhoneNumber" class="glyphicon glyphicon-remove"
                                      style="color:#FF0004;"></span>Is phone number
                                <br>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <button type="button" class="btn btn-primary btn-submit-fix">Order</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </form>
    </div>
    <div class="row cart-footer">

    </div>
</div>
<!--brand-->
<div class="container">
    <div class="brand">
    </div>
</div>
<div class="container">
    <div class="brand">
        <div class="col-md-3 brand-grid">
            <img src="<c:url value="/template/web/images/nikon.jpg"/>" class="img-responsive" alt="">
        </div>
        <div class="col-md-3 brand-grid">
            <img src="<c:url value="/template/web/images/canon.png"/>" class="img-responsive" alt="">
        </div>
        <div class="col-md-3 brand-grid">
            <img src="<c:url value="/template/web/images/sony.png"/>" class="img-responsive" alt="">
        </div>
        <div class="col-md-3 brand-grid">
            <img src="<c:url value="/template/web/images/panasonic.jpg"/>" class="img-responsive" alt="">
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!--//brand-->
<%--footer--%>
<%@ include file="/common/web/footer.jsp" %>
<!--//footer-->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<c:url value="/template/web/js/simpleCart.min.js"/>"></script>
<!-- slide -->
<script src="<c:url value="/template/web/js/bootstrap.min.js"/>"></script>
<!--light-box-files -->
<script src="<c:url value="/template/web/js/jquery.chocolat.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/template/web/css/chocolat.css"/>" type="text/css" media="screen"
      charset="utf-8">
<!--light-box-files -->
<script type="text/javascript" charset="utf-8">
    $(function () {
        $('a.picture').Chocolat();
    });
</script>
<script src="<c:url value="/template/web/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/template/web/js/lodash.min.js"/>"></script>
<script src="<c:url value="/template/web/js/low.min.js"/>"></script>
<script src="<c:url value="/template/web/js/LocalStorage.min.js"/>"></script>
<script src="<c:url value="/template/web/js/custom.js"/>"></script>
<script>
    $(document).ready(
        function () {
            // SUBMIT FORM
            $("#orderForm button").click(function (event) {
                // Prevent the form from submitting via the browser.
                event.preventDefault();
                var info = {
                    shippingAddress: $("#address").val(),
                    note: 'Người nhận: ' + ($("#fullName").val() === '' ? 'NaN' : $("#fullName").val()) + '. Số điện thoại: ' + ($("#phoneNumber").val() === '' ? 'NaN' : $("#phoneNumber").val()),
                    totalPrice: total()
                };
                var listInfo = [];
                var lineItem = shoppingCart.get();
                for (let i = 0; i < lineItem.length; i++) {
                    var inf = {};
                    inf["unitPrice"] = lineItem[i].price;
                    inf["quantity"] = lineItem[i].quantity;
                    inf["productId"] = lineItem[i].productId;
                    listInfo.push(inf);
                }
                var data = {
                    orderRequest: info,
                    lineItemRequests: listInfo
                };
                var isphone1 = /^(1\s|1|)?((\(\d{3}\))|\d{3})(\-|\s)?(\d{3})(\-|\s)?(\d{4})$/.test($("#phoneNumber").val());
                var isphone2 = /^(1\s|1|)?((\(\d{3}\))|\d{3})(\-|\s)?(\d{3})(\-|\s)?(\d{5})$/.test($("#phoneNumber").val());
                var isphone3 = /^(1\s|1|)?((\(\d{3}\))|\d{3})(\-|\s)?(\d{3})(\-|\s)?(\d{6})$/.test($("#phoneNumber").val());
                if (data.lineItemRequests.length > 0
                    && ($("#fullName").val().length >= 8)
                    && (($("#address").val().length >= 15 && $("#address").val().length <= 100))
                    && ($("#phoneNumber").val().length >= 10 && $("#phoneNumber").val().length <= 12 && (isphone1 || isphone2 || isphone3)))
                    ajaxPost(data);
                else if (!($("#fullName").val().length >= 8)
                    || !(($("#address").val().length >= 15 && $("#address").val().length <= 100))
                    || !($("#phoneNumber").val().length >= 10 && $("#phoneNumber").val().length <= 12 && (isphone1 || isphone2 || isphone3)))
                    window.location.href = '/order';
                else
                    window.location.href = "/order-result?error=true";
            });

            function ajaxPost(data) {
                $.ajax({
                    url: '/order',
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    success: success()
                });
            }

            function success() {
                shoppingCart.removeAll();
                window.location.href = "/order-result?error=false";
            }

            function total() {
                var data = shoppingCart.get();
                let sum = 0;
                for (let i = 0; i < data.length; i++) {
                    sum += data[i].quantity * data[i].price;
                }
                return sum;
            }
        });
</script>
<script>
    var data = shoppingCart.get();

    function appendData(data) {
        var mainContainer = document.getElementById("myData");
        for (var i = 0; i < data.length; i++) {
            var r = document.createElement("div");
            r.setAttribute("class", "form-group");
            r.innerHTML = '  <div class="col-sm-3 col-xs-3">\n' +
                '<img class="img-responsive" src="' + location.origin + '/' + data[i].avatar + '" />\n' +
                '</div>\n' +
                '<div class="col-sm-6 col-xs-6">\n' +
                '<div class="col-xs-12">' + data[i].name +
                '</div>\n' +
                '<div class="col-xs-12"><small>Quantity:<span>' + data[i].quantity + '</span></small></div>\n' +
                '</div>\n' +
                '<div class="col-sm-3 col-xs-3 text-right">\n' +
                '<h6><span>' + data[i].price + '</span></h6><span>vnd</span>' +
                '</div>';
            mainContainer.appendChild(r);
        }
        var br = document.createElement("div");
        br.setAttribute("class", "form-group");
        br.innerHTML = '<hr />';
        mainContainer.appendChild(br);
        var r2 = document.createElement("div");
        r2.setAttribute("class", "form-group");
        r2.innerHTML = '<div class="col-xs-12">\n' +
            ' <strong>Subtotal</strong>\n' +
            '<div class="pull-right"><span>$</span><span>' + total() + '</span></div>\n' +
            '</div>\n' +
            '<div class="col-xs-12">\n' +
            '<small>(COD)</small>\n' +
            '<div class="pull-right"></div>\n' +
            '</div>';
        mainContainer.appendChild(r2);

        function total() {
            var data = shoppingCart.get();
            let sum = 0;
            for (let i = 0; i < data.length; i++) {
                sum += data[i].quantity * +data[i].price;
            }
            return sum;
        }

    }

    appendData(data);
</script>
<script>
    var baka = shoppingCart.get();
    var maintain = document.getElementById("total");
    var r = document.createElement("span");
    if (baka.length > 0) {
        r.innerHTML = baka.length;
        maintain.appendChild(r);
    } else {
        r.innerHTML = 0;
        maintain.appendChild(r);
    }
</script>

<%--validate--%>
<script>
    $("input[type=text]").keyup(function () {
        if ($("#fullName").val().length >= 8) {
            $("#validFullName").removeClass("glyphicon-remove");
            $("#validFullName").addClass("glyphicon-ok");
            $("#validFullName").css("color", "#00A41E");
        } else {
            $("#validFullName").removeClass("glyphicon-ok");
            $("#validFullName").addClass("glyphicon-remove");
            $("#validFullName").css("color", "#FF0004");
        }

        if ($("#address").val().length >= 15 && $("#address").val().length <= 100) {
            $("#validAddress").removeClass("glyphicon-remove");
            $("#validAddress").addClass("glyphicon-ok");
            $("#validAddress").css("color", "#00A41E");
        } else {
            $("#validAddress").removeClass("glyphicon-ok");
            $("#validAddress").addClass("glyphicon-remove");
            $("#validAddress").css("color", "#FF0004");
        }

        var isphone1 = /^(1\s|1|)?((\(\d{3}\))|\d{3})(\-|\s)?(\d{3})(\-|\s)?(\d{4})$/.test($("#phoneNumber").val());
        var isphone2 = /^(1\s|1|)?((\(\d{3}\))|\d{3})(\-|\s)?(\d{3})(\-|\s)?(\d{5})$/.test($("#phoneNumber").val());
        var isphone3 = /^(1\s|1|)?((\(\d{3}\))|\d{3})(\-|\s)?(\d{3})(\-|\s)?(\d{6})$/.test($("#phoneNumber").val());
        // var isphone1 = /((09|03|07|08|05)+([0-9]{8})\b)/g.test($("#phoneNumber").val());
        // var isphone2 = /((09|03|07|08|05)+([0-9]{9})\b)/g.test($("#phoneNumber").val());
        // var isphone3 = /((09|03|07|08|05)+([0-9]{10})\b)/g.test($("#phoneNumber").val());
        if ($("#phoneNumber").val().length >= 10 && $("#phoneNumber").val().length <= 12 && (isphone1 || isphone2 || isphone3)) {
            $("#validPhoneNumber").removeClass("glyphicon-remove");
            $("#validPhoneNumber").addClass("glyphicon-ok");
            $("#validPhoneNumber").css("color", "#00A41E");
        } else {
            $("#validPhoneNumber").removeClass("glyphicon-ok");
            $("#validPhoneNumber").addClass("glyphicon-remove");
            $("#validPhoneNumber").css("color", "#FF0004");
        }
    });
</script>
<%--validate--%>
</body>
</html>
