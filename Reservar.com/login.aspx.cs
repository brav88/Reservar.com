using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reservar.com
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                //alex.salas@ice.go.cr
                //123456

                //juan.perez@gmail.com
                //123456

                var email = inpEmail.Value;
                var password = inpPassword.Value;
                var firebaseUrl = "https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=";
                var apiKey = "AIzaSyA5NmIgFqJUMLsXSfLGw3wq0U3PFBGgoaM";

                var request = (HttpWebRequest)WebRequest.Create(firebaseUrl + apiKey);
                var postData = "email=" + email + "&password=" + password;
                var data = Encoding.ASCII.GetBytes(postData);

                request.Method = "POST";
                request.ContentType = "application/x-www-form-urlencoded";
                request.ContentLength = data.Length;

                using (var stream = request.GetRequestStream())
                {
                    stream.Write(data, 0, data.Length);
                }

                var response = (HttpWebResponse)request.GetResponse();
                var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();

                if (responseString.Contains(email))
                {
                    Session["email"] = email;
                    Response.Redirect("destinos.aspx");
                }
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showMessage('Login incorrecto')", true);
            }
        }
    }
}