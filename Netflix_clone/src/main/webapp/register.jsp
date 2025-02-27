<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <style>
        body {
            background: linear-gradient(to right, #141e30, #860000);
            background-size: cover;
            font-family: Arial, sans-serif;
            color: white;
            margin: 0;
            padding: 0;
        }

        #register-container {
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

        input[type="text"], input[type="email"], input[type="password"] {
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
    </style>
</head>
<body>

<div id="register-container">
    <h1>Sign Up</h1>
    <form action="RegisterServlet" method="post">
        <label for="username">Username:</label>
        <input type="text" name="username" required><br>
        <label for="email">Email:</label>
        <input type="email" name="email" required><br>
        <label for="password">Password:</label>
        <input type="password" name="password" required><br>
        <input type="submit" value="Register">
    </form>
</div>

<div class="footer">
    <p>Already have an account? <a href="login.jsp" style="color: #fff; text-decoration: none;">Login</a></p>
</div>

</body>
</html>
