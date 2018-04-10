<%@page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
final String pageId = pageContext.getServletConfig().getInitParameter("pageId");
pageContext.setAttribute("pageId", pageId);
pageContext.setAttribute("otherPageId", (pageId.equals("A") ? "B" : "A"));
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title><c:out value="Secure Page ${pageId}"/></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  </head>
  <body class="container py-4">
    <div class="row">
      <div class="col">
        <h1><c:out value="Secure Page ${pageId}"/></h1>
        <p>This page requires an authenticated user.</p>
      </div>
    </div>
    <div class="row">
      <div class="col">
        <h2>Authenticated User</h2>
        <p>This is the authenticated user principal object.</p>
        <pre><c:out value="${pageContext.request.userPrincipal}"/></pre>
      </div>
    </div>
    <c:if test="${!empty sessionScope['org.bsworks.oidc.authorization']}">
      <div class="row">
        <div class="col">
          <h2>Authorization</h2>
          <p>This is authorization information from the OP made available to the application in the HTTP session.</p>
          <pre><c:out value="${sessionScope['org.bsworks.oidc.authorization']}"/></pre>
        </div>
      </div>
    </c:if>
    <div class="row">
      <div class="col">
        <h2>Navigation</h2>
        <p>You can navigate to other application pages.</p>
        <ul>
          <li><a href="../home">Home</a></li>
          <li><a href="page-${fn:toLowerCase(otherPageId)}"><c:out value="Secure Page ${otherPageId}"/></a></li>
          <li><a href="../logout">Logout</a></li>
        </ul>
      </div>
    </div>
  </body>
</html>
