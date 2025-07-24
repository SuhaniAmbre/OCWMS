<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLog.aspx.cs" Inherits="OCWMS.UserLog" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <style>
        body {
            background: linear-gradient(to right, #ff9966, #ff5e62, #fbc2eb, #8fd3f4);
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .loginbox {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 350px;
        }
        .loginbox h2 {
            font-size: 28px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }
        .input-box {
            width: 100%;
            margin-bottom: 15px;
        }
        .input-box label {
            font-size: 18px;
            display: block;
            text-align: left;
            font-weight: bold;
            color: #555;
        }
        .input-box input {
            width: 100%;
            height: 40px;
            border-radius: 8px;
            border: 1px solid #ccc;
            padding: 8px;
            font-size: 16px;
            outline: none;
            transition: 0.3s;
        }
        .input-box input:focus {
            border-color: #ff5e62;
            box-shadow: 0px 0px 5px #ff5e62;
        }
        .show-password {
            display: flex;
            align-items: center;
            font-size: 14px;
            color: #333;
        }
        .login-btn {
            background: #ff5e62;
            color: white;
            font-size: 18px;
            font-weight: bold;
            width: 100%;
            height: 45px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
        }
        .login-btn:hover {
            background: #e04852;
        }
        .register-link {
            margin-top: 15px;
            display: block;
            font-size: 16px;
            color: #ff5e62;
            text-decoration: none;
            font-weight: bold;
        }
        .register-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="loginbox">
        <form id="form1" runat="server">
            <h2>Login Form</h2>
            
            <div class="input-box">
                <label>Username</label>
                <asp:TextBox ID="usertxt" runat="server" CssClass="textbox"></asp:TextBox>
            </div>
            
            <div class="input-box">
                <label>Password</label>
                <asp:TextBox ID="passtxt" runat="server" TextMode="Password" CssClass="textbox"></asp:TextBox>
            </div>

            <div class="show-password">
                <input type="checkbox" onchange="document.getElementById('passtxt').type=this.checked? 'text': 'password'" /> Show Password
            </div>

            <asp:Button ID="Button1" runat="server" Text="Log In" CssClass="login-btn" OnClick="Button1_Click" />

            <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>

            <a href="UserRegister.aspx" class="register-link">Register Here</a>
        </form>
    </div>
</body>
</html>