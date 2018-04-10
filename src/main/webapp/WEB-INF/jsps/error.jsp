<%@page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Authentication Error</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  </head>
  <body class="container py-4">
    <div class="row">
      <div class="col">
        <h1>Authentication Error</h1>
        <p>Something went wrong with the authentication. Check the authenticator debug log for details.</p>
      </div>
    </div>
    <c:set var="error" value="${requestScope['org.bsworks.oidc.error']}"/>
    <c:if test="${!empty error}">
    <div class="row">
      <div class="col">
        <h2>Provider Error Response</h2>
        <ul>
          <li>Error Code: <c:out value="${error.code}"/></li>
          <c:if test="${!empty error.description}">
          <li>Error Description: <c:out value="${error.description}"/></li>
          </c:if>
          <c:if test="${!empty error.infoPageURI}">
            <li>More info at <a href="${error.infoPageURI}"><c:out value="${error.infoPageURI}"/></a></li>
          </c:if>
        </ul>
      </div>
    </div>
    </c:if>
    <div class="row">
      <div class="col">
        <a href="${pageContext.request.contextPath}/home">Go Back Home</a>
      </div>
    </div>
  </body>
</html>
