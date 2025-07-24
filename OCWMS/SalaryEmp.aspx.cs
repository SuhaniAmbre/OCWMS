using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.draw;

namespace OCWMS
{
    public partial class SalaryEmp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string query = "SELECT EmployeeID, EmployeeName, AccountNo, BankName, BasicSalary, PaymentDate, PaymentMethod FROM Salary WHERE EmployeeID LIKE @Search OR EmployeeName LIKE @Search";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Search", "%" + txtSearch.Text + "%");
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvEmployeeSalary.DataSource = dt;
                    gvEmployeeSalary.DataBind();
                }
            }
        }

        protected void btnGenerateReceipt_Click(object sender, EventArgs e)
        {
            if (gvEmployeeSalary.Rows.Count == 0)
            {
                return; // No data to generate PDF
            }

            // Create MemoryStream to store PDF
            MemoryStream stream = new MemoryStream();
            Document document = new Document(PageSize.A4, 50, 50, 50, 50);
            PdfWriter writer = PdfWriter.GetInstance(document, stream);

            document.Open();

            // Add Logo
            string logoPath = Server.MapPath("~/weblogo.jpg"); // Ensure logo is in the project folder
            if (File.Exists(logoPath))
            {
                iTextSharp.text.Image logo = iTextSharp.text.Image.GetInstance(logoPath);
                logo.ScaleToFit(100f, 100f);
                logo.Alignment = Element.ALIGN_CENTER;
                document.Add(logo);
            }

            // Title
            Font titleFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 18);
            Paragraph title = new Paragraph("Online College Welfare Management\nSalary Receipt\n\n", titleFont);
            title.Alignment = Element.ALIGN_CENTER;
            document.Add(title);

            // Table for Employee Details
            PdfPTable table = new PdfPTable(7);
            table.WidthPercentage = 100;

            // Table Header
            string[] headers = { "Employee ID", "Employee Name", "Account No", "Bank Name", "Basic Salary", "Payment Date", "Payment Method" };
            foreach (string header in headers)
            {
                PdfPCell cell = new PdfPCell(new Phrase(header, FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12)));
                cell.HorizontalAlignment = Element.ALIGN_CENTER;
                table.AddCell(cell);
            }

            // Table Data
            foreach (GridViewRow row in gvEmployeeSalary.Rows)
            {
                for (int i = 0; i < row.Cells.Count; i++)
                {
                    table.AddCell(row.Cells[i].Text);
                }
            }

            document.Add(table);

            // Add Space Before Signature
            document.Add(new Paragraph("\n\n"));

            // Add Signature Image
            string signaturePath = Server.MapPath("~/sign.png"); // Ensure signature is in the project folder
            if (File.Exists(signaturePath))
            {
                iTextSharp.text.Image signature = iTextSharp.text.Image.GetInstance(signaturePath);
                signature.ScaleToFit(150f, 100f); // Adjust size as needed
                signature.Alignment = Element.ALIGN_RIGHT;
                document.Add(signature);
            }

            // Signature Line
            Paragraph signatureText = new Paragraph("\nAuthority Signature",
                FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12));
            signatureText.Alignment = Element.ALIGN_RIGHT;
            document.Add(signatureText);

            document.Close();

            // Convert MemoryStream to Byte Array and Download
            byte[] bytes = stream.ToArray();
            stream.Close();

            Response.Clear();
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=SalaryReceipt.pdf");
            Response.Buffer = true;
            Response.BinaryWrite(bytes);
            Response.End();
        }
protected void btnDownloadPDF_Click(object sender, EventArgs e)
        {
            Document pdfDoc = new Document(PageSize.A4, 50, 50, 50, 50);
            MemoryStream memoryStream = new MemoryStream();
            PdfWriter writer = PdfWriter.GetInstance(pdfDoc, memoryStream);

            pdfDoc.Open();

            // College Header
            string logoPath = Server.MapPath("~/logo.png"); // Ensure logo is present in the project folder
            iTextSharp.text.Image logo = iTextSharp.text.Image.GetInstance(logoPath);
            logo.ScaleToFit(100f, 100f);
            logo.Alignment = Element.ALIGN_CENTER;
            pdfDoc.Add(logo);

            Paragraph title = new Paragraph("Online College Welfare Management\nSalary Receipt\n\n", FontFactory.GetFont("Arial", 18, Font.BOLD));
            title.Alignment = Element.ALIGN_CENTER;
            pdfDoc.Add(title);

            // Employee Salary Details Table
            PdfPTable table = new PdfPTable(2);
            table.WidthPercentage = 100;
            table.AddCell("Employee ID:"); table.AddCell(lblEmpID.Text);
            table.AddCell("Employee Name:"); table.AddCell(lblEmpName.Text);
            table.AddCell("Account Number:"); table.AddCell(lblAccountNo.Text);
            table.AddCell("Bank Name:"); table.AddCell(lblBankName.Text);
            table.AddCell("Basic Salary:"); table.AddCell(lblBasicSalary.Text);
            table.AddCell("Payment Date:"); table.AddCell(lblPaymentDate.Text);
            table.AddCell("Payment Method:"); table.AddCell(lblPaymentMethod.Text);

            pdfDoc.Add(table);

            // Footer with Signature
            Paragraph signature = new Paragraph("\nAuthority Signature", FontFactory.GetFont("Arial", 12, Font.BOLD));
            signature.Alignment = Element.ALIGN_RIGHT;
            pdfDoc.Add(signature);

            pdfDoc.Close();

            // Convert to byte array and send to user for download
            byte[] bytes = memoryStream.ToArray();
            memoryStream.Close();

            Response.Clear();
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=SalaryReceipt.pdf");
            Response.Buffer = true;
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.BinaryWrite(bytes);
            Response.End();
        }
    }
}