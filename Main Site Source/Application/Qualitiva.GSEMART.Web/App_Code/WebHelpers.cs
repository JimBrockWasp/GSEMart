using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;

public class WebUser
{
    public static HttpCookie CreateEncryptedFormsCookie(string name, string userData, int durationInMinutes)
    {
        FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
            1,
            name,
            DateTime.Now,
            DateTime.Now.AddMinutes(durationInMinutes),
            true,
            userData,
            FormsAuthentication.FormsCookiePath);

        FormsIdentity formsId = new FormsIdentity(ticket);
        return new HttpCookie(FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(ticket));
    }
}

public class Seller
{
    private static HttpContext HttpCurrent
    {
        get { return HttpContext.Current; }
    }

    public static T GetRequest<T>(string requestName)
    {
        string o = HttpCurrent.Request[requestName];
        if (string.IsNullOrEmpty(o))
            return default(T);
        return (T)Convert.ChangeType(o, typeof(T));
    }

    public static T GetSession<T>(string sessionName)
    {
        object o = HttpCurrent.Session[sessionName];
        if (o == null)
            return default(T);
        return (T)Convert.ChangeType(o, typeof(T));
    }

    public static void SetSession(object value, string sessionName)
    {
        HttpCurrent.Session[sessionName] = value;
    }

    public static List<T> GetChildControlsByType<T>(Control control)
    {
        List<T> foundControls = new List<T>();
        iterateThroughChildren<T>(control, foundControls);
        return foundControls;
    }

    private static void iterateThroughChildren<T>(Control parent, List<T> controls)
    {
        foreach (object c in parent.Controls)
        {
            if (c is T)
                controls.Add((T)c);

            if (((Control)c).Controls.Count > 0)
                iterateThroughChildren<T>((Control)c, controls);
        }
    }
}
