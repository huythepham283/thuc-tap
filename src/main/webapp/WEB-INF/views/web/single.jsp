<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.nhom8.camera.util.SecurityUtil" %>
<!DOCTYPE html>
<html>
<head>
    <title>${product.name}</title>
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
    <link href="<c:url value="/template/web/css/form.css"/>" rel="stylesheet" type="text/css" media="all"/>
    <script src="<c:url value="/template/custom/customFormatNumber.js" />"></script>
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

<div class="single">
    <div class="container">
        <div class="brand">
        </div>
        <div class="col-md-9">
            <div class="col-md-5 grid">
                <div class="flexslider">
                    <ul class="slides">
                        <li data-thumb="images/si.jpg">
                            <div class="thumb-image"><img src="<c:url value="${product.productImage}"/>"
                                                          data-imagezoom="true" class="img-responsive"></div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-7 single-top-in">
                <div class="span_2_of_a1 simpleCart_shelfItem">
                    <h3>${product.name}</h3>
                    <input type="hidden" value="${product.id}" id="productid" name="productid">
                    <p class="in-para"> ${product.brand.name}</p>
                    <div class="price_single">
                        <span class="reducedfrom" id="camera-price"></span>
                        <span class="reducedfrom item_price" hidden>${product.unitPrice}</span>

                        <div class="clearfix"></div>
                        <script>
                            document.getElementById('camera-price').innerHTML = FormatNumber('${product.unitPrice}') + 'VNĐ'
                        </script>
                    </div>

                    <div class="quantity">
                        <div class="quantity-select">
                            <div class="entry value-minus">&nbsp;</div>
                            <div class="entry value"><span name="quantity-value">1</span>
                                <input type="hidden" value="1" id="quantityVip">
                            </div>
                            <div class="entry value-plus active">&nbsp;</div>
                        </div>
                    </div>
                    <!--quantity-->
                    <script>
                        $('.value-plus').on('click', function () {
                            var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10) + 1;
                            divUpd.text(newVal);
                            $("#quantityVip").val(newVal);
                        });

                        $('.value-minus').on('click', function () {
                            var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10) - 1;
                            if (newVal >= 1){ divUpd.text(newVal);
                                $("#quantityVip").val(newVal);}
                        });
                    </script>
                    <!--quantity-->

                    <a href="<c:url value="/checkout"/>" name="addToCart"
                       class="add-to item_add hvr-skew-backward">Add to cart</a>
                    <div class="clearfix"></div>
                </div>

            </div>
            <div class="clearfix"></div>
            <!---->

            <!---->
        </div>
        <!----->
        <div class="clearfix"></div>
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
</div>

<!--//content-->
<!--//footer-->
<%@ include file="/common/web/footer.jsp" %>
<!--//footer-->
<%--<script src="<c:url value="/template/web/js/imagezoom.js"/>"></script>--%>

<script defer src="<c:url value="/template/web/js/jquery.flexslider.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/template/web/css/flexslider.css"/>" type="text/css" media="screen"/>

<script>
    // Can also be used with $(document).ready()
    $(window).load(function() {
        $('.flexslider').flexslider({
            animation: "slide",
            controlNav: "thumbnails"
        });
        (function () {
            document.querySelector('a[name="addToCart"]').onclick = function () {

                let fullPathImg = document.querySelector('div[class="thumb-image"] img').src;
                let arrPath = fullPathImg.split('localhost')[1].split('/');
                let productId = document.querySelector('input[name="productid"]').value;
                if (shoppingCart.isExist({productId: productId})) {
                    let oldData = shoppingCart.where({productId: productId});
                    shoppingCart.update({productId: productId}, {quantity: parseInt(oldData.quantity) + parseInt(document.querySelector('div[class="entry value"]').innerText)});
                } else {
                    shoppingCart.insert({
                        brand: document.querySelector('p[class="in-para"]').innerText,
                        name: document.querySelector('div[class="span_2_of_a1 simpleCart_shelfItem"] h3').innerText,
                        price: document.querySelector('span[class="reducedfrom item_price"]').innerText,
                        productId: productId,
                        quantity: document.querySelector('div[class="entry value"]').innerText,
                        avatar : arrPath.slice(1,arrPath.length).join('/')
                    })
                }
            }
        })()
    });
</script>

<script src="<c:url value="/template/web/js/simpleCart.min.js"/>"></script>
<!-- slide -->
<script src="<c:url value="/template/web/js/bootstrap.min.js"/>"></script>

<script src="<c:url value="/template/web/js/lodash.min.js"/>"></script>
<script src="<c:url value="/template/web/js/low.min.js"/>"></script>
<script src="<c:url value="/template/web/js/LocalStorage.min.js"/>"></script>
<script src="<c:url value="/template/web/js/custom.js"/>"></script>
<script src="<c:url value="/template/web/js/addProduct.js"/>"></script>
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