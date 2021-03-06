<%@include file="/common/taglib.jsp" %>
<%@page import="com.nhom8.camera.util.SecurityUtil" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order history</title>
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
            <h2><a href="<c:url value="/"/>">Home</a><label>/</label>Order History</h2>
        </div>
    </div>
</div>
<!--banner-->
<br><br>

<style type="text/css">
    table.order-history > tbody > tr > td {
        color: black !important;
        font-size: 15px !important;
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
    }
</style>
<div class="container">
    <h3 style="font-family: ''; text-align: center; font-size: 30px; color: #F67777">20 đơn hàng gần nhất của bạn</h3>
    <br>
    <table class="table table-hover order-history">
        <thead>
        <tr>
            <th>STT</th>
            <th>Order date</th>
            <th>Shipping address</th>
            <th>Total price</th>
            <th>Status</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${orders}" var="order" varStatus="itr">
            <tr>
                <td>${itr.index +1}</td>
                <td>${order.orderDate}</td>
                <td>${order.shippingAddress}</td>
                <td>${order.totalPrice}</td>
                <td>${order.status}</td>
                <td><a href="<c:url value="/order/${order.id}"/>">View Order</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
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

<!--//footer-->
<%@ include file="/common/web/footer.jsp" %>
<!--//footer-->

<script src="<c:url value="/template/web/js/simpleCart.min.js"/>"></script>

<script src="<c:url value="/template/web/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/template/web/js/lodash.min.js"/>"></script>
<script src="<c:url value="/template/web/js/low.min.js"/>"></script>
<script src="<c:url value="/template/web/js/LocalStorage.min.js"/>"></script>
<script src="<c:url value="/template/web/js/custom.js"/>"></script>
<script>
    var data = shoppingCart.get();

    function appendData(data) {
        var mainContainer = document.getElementById("myData");

        for (var i = 0; i < data.length; i++) {
            var r = document.createElement("TR");
            r.innerHTML = '<tr class="cart-header2">\n' +
                `\t\t  <td class="ring-in"><a href="<c:url value="#"/>" class="at-in"><img src="` + location.origin + '/' + data[i].avatar + `" class="img-responsive" alt=""></a>\n` +
                '\t\t\t<div class="sed">\n' +
                '\t\t\t\t<h5><a href=<c:url value="#"/>>' + data[i].name + '</a></h5>\n' +
                '\t\t\t</div>\n' +
                '\t\t\t<div class="clearfix"> </div>\n' +
                '\t\t\t<td name="priceProduct">' + data[i].price + '</td>\n' +
                '\t\t\t<td>' + ' <div class="quantity"> \n' +
                '\t\t\t\t\t\t\t\t<div class="quantity-select">                           \n' +
                '\t\t\t\t\t\t\t\t\t<div class="entry value-minus">&nbsp;</div>\n' +
                '\t\t\t\t\t\t\t\t\t<div class="entry value"><span name="quantity-value">' + data[i].quantity + '</span></div>\n' +
                '\t\t\t\t\t\t\t\t\t<div class="entry value-plus active">&nbsp;</div>\n' +
                '\t\t\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t\t</div>' + '</td>\n' +
                '\t\t\t<td class="item_price" name="subTotal">' + data[i].price * data[i].quantity + '</td>\n' +
                '\t\t\t<td class="add-check"><div class="item_add hvr-skew-backward" ><a href="javascript:void(0)">Remove</a></div></td>\n' +
                '\t\t  </tr>';
            mainContainer.tBodies[0].appendChild(r);
        }
        var r2 = document.createElement("TR");
        r2.innerHTML = ' <tr>\n' +
            '                    <td colspan="3" style="text-align: right" >Total Cash:</td>\n' +
            '                    <td colspan="1">' + total() + '</td>\n' +
            '                </tr>';
        mainContainer.tBodies[0].appendChild(r2);

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
</body>
</html>