<%@tag description="General Layout" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@attribute name="title" required="true"%>
<%@attribute name="js" fragment="true"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <link rel="stylesheet"  href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet"  href="${pageContext.request.contextPath}/petclinic/css/style.css" type="text/css" />

        <script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/chained/chained.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>

        <title>Pet Clinic - ${title}</title>
    </head>
    <body>

        <sec:authorize access="isAuthenticated()">
            <jsp:include page="/WEB-INF/tags/header.jsp"/>
        </sec:authorize>


        <div class="container-fluid">
            <div class="row">

                <sec:authorize access="isAuthenticated()">
                    <jsp:include page="/WEB-INF/tags/sidebar.jsp"/>

                    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                        <jsp:doBody/>
                    </div>
                </sec:authorize>


                <sec:authorize access="isAnonymous()">
                    <jsp:doBody/>
                </sec:authorize>
            </div>

        </div>

    </body>
</html>