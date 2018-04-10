<%@page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  </head>
  <body class="container py-4">
    <div class="row">
      <div class="col">
        <h1>Home</h1>
        <p>This page is public and does not require authenticated user.</p>
      </div>
    </div>
    <div class="row">
      <div class="col">
        <h2>Secure Pages</h2>
        <p>Navigating to any of these pages should trigger user login if no user is currently authenticated for the session.</p>
        <ul>
          <li><a href="secure/page-a">Secure Page A</a></li>
          <li><a href="secure/page-b">Secure Page B</a></li>
        </ul>
      </div>
    </div>
  </body>
</html>
