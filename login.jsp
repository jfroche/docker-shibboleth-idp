<!DOCTYPE html>

<%@ taglib uri="urn:mace:shibboleth:2.0:idp:ui" prefix="idpui" %>
<html>
  <head>
    <meta charset="utf-8" />
    <title>Affinitic login</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/login.css"/>
  </head>

  <body>
    <div class="wrapper">
      <div class="container">
        <header>
		<img src="http://trac.affinitic.be/trac/chrome/site/logo" />
        </header>
    
        <div class="content">
          <div class="column one">
            <% if(request.getAttribute("actionUrl") != null){ %>
              <form id="login" action="<%=request.getAttribute("actionUrl")%>" method="post">
            <% }else{ %>
              <form id="login" action="j_security_check" method="post">
            <% } %>

              <% if ("true".equals(request.getAttribute("loginFailed"))) { %>
                <section>
                  <p class="form-element form-error">Login has failed. Double-check your username and password.</p>
                </section>
              <% } %>

              <legend>
                Log in to <idpui:serviceName/>
              </legend>

              <section>
                <label for="username">Username</label>
                <input class="form-element form-field" name="j_username" type="text" value="">
              </section>

              <section>
                <label for="password">Password</label>
                <input class="form-element form-field" name="j_password" type="password" value="">
              </section>

              <section>
                <button class="form-element form-button" type="submit">Login</button>
              </section>
            </form>
            
            <%
              //
              //    SP Description & Logo (optional)
              //    These idpui lines will display added information (if available
              //    in the metadata) about the Service Provider (SP) that requested
              //    authentication. These idpui lines are "active" in this example
              //    (not commented out) -- this extra SP info will be displayed.
              //    Remove or comment out these lines to stop the display of the
              //    added SP information.
              //
              //    Documentation: 
              //      https://wiki.shibboleth.net/confluence/display/SHIB2/IdPAuthUserPassLoginPage
              //
              //    Example:
            %>
                    <p>
                      <idpui:serviceLogo>default</idpui:serviceLogo>
                      <idpui:serviceDescription>SP description</idpui:serviceDescription>
                    </p>
              

          </div>
          <div class="column two">
            <ul class="list list-help">
            </ul>
          </div>
        </div>
      </div>

      <footer>
        <div class="container container-footer">
          <p class="footer-text"></p>
        </div>
      </footer>
    </div>
    
  </body>
</html>
