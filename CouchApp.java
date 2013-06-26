import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.net.URI;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.couchbase.client.CouchbaseClient;

import net.spy.memcached.CASValue;
import net.spy.memcached.internal.GetFuture;
import net.spy.memcached.internal.OperationFuture;

public class CouchApp extends HttpServlet{ 
  public void doPost(HttpServletRequest request, 
  HttpServletResponse response)
  throws ServletException,IOException{
  
 JSONObject obj = new JSONObject();
 obj.put("name", request.getParameter("name"));
 obj.put("emailId", request.getParameter("email").toString());
 obj.put("dob", request.getParameter("date").toString());
 obj.put("degree", request.getParameter("degree").toString());
 obj.put("specialization", request.getParameter("stream").toString());
 obj.put("lang", request.getParameter("lang").toString());
 obj.put("db", request.getParameter("db").toString());
 obj.put("skill", request.getParameter("skill").toString());
 obj.put("totalexp", request.getParameter("totalexp").toString());
 obj.put("relexp", request.getParameter("relexp").toString());
 
 int ttl = 0;
 int size = 5;
  
    // Set the URIs and get a client
    List<URI> uris = new LinkedList<URI>();
         
    // Connect to localhost or to the appropriate URI
    uris.add(URI.create("http://ec2-54-215-70-175.us-west-1.compute.amazonaws.com:8091/pools"));

    CouchbaseClient client = null;
    try {
      client = new CouchbaseClient(uris, "default", "");
    } catch (Exception e) {
      System.err.println("Error connecting to Couchbase: "
        + e.getMessage());
      System.exit(0);
    }
    try {
        OperationFuture<Boolean> setOp = client.set(request.getParameter("email").toString(), ttl, obj.toString());
        if(setOp.get().booleanValue()) {
            response.setContentType("text/html");
            PrintWriter pw = response.getWriter();
            pw.println("<html>");
            pw.println("<head><title>Updated Data Successfully</title></title>");
            pw.println("<body>");
            pw.println("<h1>Thank you for using Couchbase</h1>");
            pw.println("</body></html>");
        }
        else {
            response.setContentType("text/html");
            PrintWriter pw = response.getWriter();
            pw.println("<html>");
            pw.println("<head><title>Unable to Update the Database</title></title>");
            pw.println("<body>");
            pw.println("<h1>Thank you for using Couchbase</h1>");
            pw.println("</body></html>");
        }
     }
        catch(Exception ex) {
            ex.printStackTrace();
        }
        
   }
}
