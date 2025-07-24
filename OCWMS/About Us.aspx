<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About Us.aspx.cs" Inherits="OCWMS.About_Us" %>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
   <style>
       /* General Styling */
body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
  background: linear-gradient(135deg, #ffefba, #ffffff, #ffe0f7);
  background-size: 400% 400%;
    animation: gradientBG 10s ease infinite; /* Gradient Animation */
    color: #2c3e50; /* Darker text for contrast */
    text-align: center;
}
/* Heading Style */
h1 {
    font-size: 42px;
    text-transform: uppercase;
    letter-spacing: 2px;
    margin-top: 40px;
    text-shadow: 3px 3px 10px rgba(0, 0, 0, 0.8);
}

h2 {
    font-size: 36px;
    color: #3498db; /* Blue */
    margin-top: 20px;
    text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.7);
}

h3 {
    font-size: 28px;
    color: #e74c3c; /* Red */
    margin-top: 15px;
    text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.6);
}

/* Paragraph Styling */
p {
    font-size: 18px;
    margin: 20px auto;
    max-width: 900px;
    line-height: 1.8;
    color: rgba(0, 0, 0, 0.7);
    text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.7);
}

/* List Style */
ul {
    padding: 0;
 margin: 30px auto;
 padding: 30px;
 border-radius: 12px;
 box-shadow: 0 8px 16px rgba(0, 0, 0, 0.6);
}

ul li {
    font-size: 18px;
    padding: 12px;
    
    color: rgba(0, 0, 0, 0.7);
}

ul li:last-child {
    border-bottom: none;
}

/* Links Hover Effects */
a {
    color: #f39c12;
    text-decoration: none;
    font-weight: bold;
}

a:hover {
    text-decoration: underline;
    transition: 0.3s ease-in-out;
    color: #e74c3c; /* Hover Effect */
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

    h2 {
        font-size: 28px;
    }

    h3 {
        font-size: 22px;
    }

    ul {
        width: 90%;
    }

    p, ul li {
        font-size: 16px;
    }
}

   </style>
    <h1>About Us</h1>
    <p>Welcome to our financial services portal. We offer a range of financial products aimed at ensuring your financial security and growth.</p>

    <h2>Our Services</h2>
    
    <h3>Employees' Provident Fund (EPF)</h3>
    <p>The EPF is a savings scheme for employees, providing financial security post-retirement.</p>
    <ul>
        <li><strong>Compulsory Contribution:</strong> Employee and employer contribute 12% each.</li>
        <li><strong>Tax Benefits:</strong> Contributions are tax-deductible under Section 80C.</li>
        <li><strong>Interest Rate:</strong> Announced annually by EPFO.</li>
        <li><strong>Withdrawal:</strong> Allowed for specific needs and post-retirement.</li>
    </ul>

    <h3>Public Provident Fund (PPF)</h3>
    <p>PPF is a government-backed savings scheme offering long-term tax-saving investment.</p>
    <ul>
        <li><strong>Tenure:</strong> 15 years with the option to extend in blocks of 5 years.</li>
        <li><strong>Tax Benefits:</strong> Triple exemption (EEE) on contribution, interest, and maturity.</li>
        <li><strong>Interest Rate:</strong> Determined quarterly by the government.</li>
        <li><strong>Loan Facility:</strong> Available from the third to sixth financial year.</li>
    </ul>

    <h3>Pension</h3>
    <p>Our pension schemes ensure a steady income after retirement.</p>
    <ul>
        <li><strong>Regular Income:</strong> Provides financial stability post-retirement.</li>
        <li><strong>Types:</strong> Various plans like government pension, private pension plans.</li>
        <li><strong>Tax Benefits:</strong> Contributions eligible for deductions under Section 80CCC.</li>
    </ul>

    <h3>Insurance</h3>
    <p>Comprehensive insurance plans to safeguard your family’s future.</p>
    <ul>
        <li><strong>Life Insurance:</strong> Offers financial protection to your family.</li>
        <li><strong>Term Insurance:</strong> Affordable plan providing large coverage.</li>
        <li><strong>Endowment Plans:</strong> Combines insurance with savings.</li>
    </ul>

    <h3>Mediclaim</h3>
    <p>Health insurance policies covering medical expenses and hospital bills.</p>
    <ul>
        <li><strong>Cashless Treatment:</strong> Available at network hospitals.</li>
        <li><strong>Tax Benefits:</strong> Premiums paid are eligible for tax deductions under Section 80D.</li>
        <li><strong>Coverage:</strong> Includes hospitalization, pre and post-treatment expenses.</li>
    </ul>

    <h3>Allowances</h3>
    <p>Various allowances offered to employees to enhance their benefits.</p>
    <ul>
        <li><strong>HRA (House Rent Allowance):</strong> Helps with rent expenses.</li>
        <li><strong>TA (Travel Allowance):</strong> Covers travel expenses.</li>
        <li><strong>Medical Allowance:</strong> Reimburses medical costs.</li>
    </ul>
    </asp:Content>

    
