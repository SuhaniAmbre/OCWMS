<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Contact Us.aspx.cs" Inherits="OCWMS.Contact_Us" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
/* General Styling */
/* General Styling */
body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    background: linear-gradient(135deg, #007bff, #6c757d, #17a2b8);
    background-size: 400% 400%;
    animation: gradientBG 10s ease infinite; /* Gradient Animation */
    color: #fff;
    text-align: center;
}
h1 {
    font-size: 42px;
    text-transform: uppercase;
    letter-spacing: 2px;
    margin-top: 40px;
    color: #ffdd57;
    text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.7);
}

/* Paragraph Styling */
p {
    font-size: 20px;
    margin: 20px auto;
    max-width: 800px;
    line-height: 1.8;
    text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.7);
}
ul {
    padding: 0;
    margin: 30px auto;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.6);
}
ul li {
    font-size: 20px;
    padding: 15px;
}

ul li:last-child {
    border-bottom: none;
}

/* Links Hover Effects */
a {
    color: #ffdd57;
    text-decoration: none;
    font-weight: bold;
}

a:hover {
    text-decoration: underline;
    transition: 0.3s ease-in-out;
}

/* Gradient Background Animation */
@keyframes gradientBG {
    0% {
        background-position: 0% 50%;
    }
    50% {
        background-position: 100% 50%;
    }
    100% {
        background-position: 0% 50%;
    }
}

/* Responsive Design */
        @media (max-width: 768px) {
            h1 {
                font-size: 32px;
            }

            ul {
                width: 90%;
            }

                p, ul li {
                    font-size: 16px;
                }
        }
/* Heading Style */

    </style>
    <h1>Contact Us</h1>
    <p>&nbsp; If you have any queries, feel free to reach out to us at:</p>
<ul>
    <li>Email: support@collegewelfare.com</li>
    <li>Phone: +91 8999307200</li>
    <li>Address: Dnyandeep College of Science And Commerce,Morvande-Boraj, Khed-Ratnagiri.</li>
</ul>

</asp:Content>


