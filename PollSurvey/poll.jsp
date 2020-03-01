<%@
page import="java.sql.*";
%>


<%!
	Connection conn;
	Statement st;
	ResultSet rs;
	PreparedStatement ps,ps1,ps2;
	String val;
	int yes_count;
	int no_count;
	int cant_count;
%>


<%
Class.forName("oracle.jdbc.driver.OracleDriver");
conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","admin");
st=conn.createStatement();
val=request.getParameter("rad");
if(val.equals("yes"))
{
	rs=st.executeQuery("Select yes from survey"); 
	rs.next();
	yes_count=rs.getInt(1);

	yes_count++;
	ps=conn.prepareStatement("update survey set yes=?");
	ps.setInt(1,yes_count);
	ps.executeUpdate();
%>You Vote Yes 
<%out.println("Total="+yes_count+" votes<br>");}
if(val.equals("no"))
{
	rs=st.executeQuery("Select no from survey");
	rs.next() ;

	no_count=rs.getInt(1);

	no_count++;
	ps=conn.prepareStatement("update survey set no=?");
	ps.setInt(1,no_count);
	ps.executeUpdate();
%>You Vote No 
<%out.println("Total="+no_count+" votes<br>");}
if(val.equals("cantsay"))
{
	rs=st.executeQuery("Select cantsay from survey");
	
	rs.next();
	cant_count=rs.getInt(1);

	cant_count++;
	ps=conn.prepareStatement("update survey set cantsay=?");
	ps.setInt(1,cant_count);
	ps.executeUpdate();
%>You Vote Can't Say 
<%out.println("Total="+cant_count+" votes<br>");}%>



YES <% out.println(yes_count); %>VOTES<hr size=<%= yes_count%> color=red width=30>
NO <% out.println(no_count); %>VOTES<hr size=<%= no_count%> color=green width=30>
Can't Say <% out.println(cant_count); %>VOTES<hr size=<%= cant_count%> color=blue width=30>





