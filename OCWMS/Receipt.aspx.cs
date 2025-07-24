using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace OCWMS
{
    public partial class Receipt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string query = "SELECT EmployeeID, EmployeeName, AccountNo, BankName, BranchName, BasicSalary, PaymentDate, PaymentMethod FROM Salary WHERE EmployeeID LIKE @Search OR EmployeeName LIKE @Search";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Search", "%" + txtSearch.Text + "%");
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvEmployeeSalary.DataSource = dt;
                    gvEmployeeSalary.DataBind();

                    // Store data in ViewState for PDF generation
                    ViewState["SalaryData"] = dt;
                }
            }
        }

        protected void btnGeneratePDF_Click(object sender, EventArgs e)
        {
            if (ViewState["SalaryData"] != null)
            {
                DataTable dt = (DataTable)ViewState["SalaryData"];

                // Create PDF document
                Document doc = new Document();
                MemoryStream ms = new MemoryStream();
                PdfWriter writer = PdfWriter.GetInstance(doc, ms);
                doc.Open();

                // Title
                Paragraph title = new Paragraph("Employee Salary Receipt\n\n", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 16));
                title.Alignment = Element.ALIGN_CENTER;
                doc.Add(title);

                // Create table
                PdfPTable table = new PdfPTable(dt.Columns.Count);
                table.WidthPercentage = 100;

                // Add table headers
                foreach (DataColumn column in dt.Columns)
                {
                    PdfPCell headerCell = new PdfPCell(new Phrase(column.ColumnName, FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12)));
                    headerCell.BackgroundColor = BaseColor.LIGHT_GRAY;
                    table.AddCell(headerCell);
                }

                // Add data rows
                foreach (DataRow row in dt.Rows)
                {
                    foreach (var item in row.ItemArray)
                    {
                        table.AddCell(new Phrase(item.ToString(), FontFactory.GetFont(FontFactory.HELVETICA, 10)));
                    }
                }

                doc.Add(table);
                doc.Close();

                // Download PDF
                byte[] fileBytes = ms.ToArray();
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment; filename=SalaryReceipt.pdf");
                Response.BinaryWrite(fileBytes);
                Response.End();
            }
        }
    }
}
