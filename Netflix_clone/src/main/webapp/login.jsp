<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        body {
            background: linear-gradient(to right, #141e30, #860000);
            background-size: cover;
            font-family: Arial, sans-serif;
            color: white;
            margin: 0;
            padding: 0;
        }

        #login-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            background-color: rgba(0, 0, 0, 0.6);
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.7);
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        label {
            font-size: 16px;
            margin-bottom: 10px;
        }

        input[type="text"], input[type="password"] {
            width: 94%;
            padding: 12px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            background-color: #333;
            color: white;
            font-size: 16px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 14px;
            background-color: red;
            border: none;
            color: white;
            font-size: 18px;
            cursor: pointer;
            border-radius: 5px;
        }

        input[type="submit"]:hover {
            background-color: #e50914;
        }

        .footer {
            text-align: center;
            margin-top: 50px;
        }

        p.error {
            color: #e50914;
            font-size: 14px;
            text-align: center;
        }
    </style>
</head>
<body>

<div id="login-container">
    <h1>Login</h1>
    <form action="LoginServlet" method="post">
        <label for="username">Username:</label>
        <input type="text" name="username" required><br>
        <label for="password">Password:</label>
        <input type="password" name="password" required><br>
        <input type="submit" value="Login">
    </form>
    <% if(request.getParameter("error") != null) { %>
        <p class="error">Invalid username or password</p>
    <% } %>
</div>

<div class="footer">
    <p>Don't have an account? <a href="register.jsp" style="color: #fff; text-decoration: none;">Sign Up</a></p>
</div>

</body>
</html>
