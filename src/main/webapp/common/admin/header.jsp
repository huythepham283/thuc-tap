<%@page import="com.nhom8.camera.util.SecurityUtil" %>
<%@include file="/common/taglib.jsp" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- header -->
<div class="header">
    <div class="nav-header">
        <div class="brand-logo"><a href="<c:url value="/admin/home"/> "><b><img src="<c:url value="/template/admin/assets/images/logo.png" />" alt=""> </b><span class="brand-title"><img src="<c:url value="/template/admin/assets/images/logo-text.png"/> " alt=""></span></a>
        </div>
        <div class="nav-control">
            <div class="hamburger"><span class="line"></span> <span class="line"></span> <span class="line"></span>
            </div>
        </div>
    </div>
    <div class="header-content">
        <div class="header-left">
            <ul>
            </ul>
        </div>
        <div class="header-right">
            <ul>
                <li class="icons">
                    Xin chào <%=SecurityUtil.getUserName()%>
                </li>
                <li class="icons"><a href="javascript:void(0)"><i class="mdi mdi-account f-s-20" aria-hidden="true"></i></a>
                    <div class="drop-down dropdown-profile animated bounceInDown">
                        <div class="dropdown-content-body">
                            <ul>
                                <li><a href="<c:url value="/edit-profile" />"><i class="icon-control-forward"></i> <span>Edit profile</span></a>
                                </li>
                                <li><a href="<c:url value="/logout" />"><i class="icon-power"></i> <span>Logout</span></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- #/ header -->