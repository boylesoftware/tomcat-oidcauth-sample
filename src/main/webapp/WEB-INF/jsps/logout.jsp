<%@page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%
request.logout();
session.invalidate();
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Logout</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  </head>
  <body class="container py-4">
    <div class="row">
      <div class="col">
        <h1>Logout</h1>
        <p>You have been successfully logged out from the web-application. Note, that you may not have logged out from the Authorization Provider. Many providers maintain logged in state and when you try to access a secure page next time, the login page of the provider may redirect you right back to the application without asking for a password. Logging out from specific providers is provider-specific.</p>
      </div>
    </div>
    <div class="row">
      <div class="col">
        <a href="${pageContext.request.contextPath}/home">Go Back Home</a>
      </div>
    </div>
  </body>
</html>
