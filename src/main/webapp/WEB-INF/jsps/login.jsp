<%@page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- get authentication endpoints for the configured OPs --%>
<c:set var="authEndpoints" value="${requestScope['org.bsworks.oidc.authEndpoints']}"/>

<%-- if single OP is configured and form-based authentication is disabled, just redirect to the authentication endpoint --%>
<c:if test="${requestScope['org.bsworks.oidc.noForm'] and fn:length(authEndpoints) eq 1}">
  <c:redirect url="${authEndpoints[0].url}"/>
</c:if>

<%-- render the login page --%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  </head>
  <body class="container py-4">
    <div class="row">
      <div class="col">
        <h1>Login</h1>
        <p>The login page is hosted by the application and allows the user to choose the way he or she wants to login.</p>
      </div>
    </div>
    <div class="row">
      <div class="col">
        <h2>Using OpenID Connect</h2>
        <p>This is the list of configured OPs. Choose one to proceed to the login page provided by the OP.</p>
        <ul>
          <c:forEach items="${authEndpoints}" var="ep">
            <li><a href="${ep.url}"><c:out value="${ep.issuer}"/></a></li>
          </c:forEach>
        </ul>
      </div>
    </div>
    <c:if test="${!requestScope['org.bsworks.oidc.noForm']}">
    <div class="row">
      <div class="col">
        <h2>Using Form</h2>
        <p>Regular form-based authentication handled by the application itself.</p>
      </div>
    </div>
    <form class="row" method="post" action="j_security_check">
      <div class="col form-group">
        <label for="usernameInput">Username</label>
        <input class="form-control" id="usernameInput" type="text" name="j_username" required>
      </div>
      <div class="col form-group">
        <label for="passwordInput">Password</label>
        <input class="form-control" id="passwordInput" type="password" name="j_password" required>
      </div>
      <div class="col col-auto form-group">
        <label>&nbsp;</label>
        <button class="form-control btn btn-primary" type="submit">Submit</button>
      </div>
    </form>
    </c:if>
  </body>
</html>
