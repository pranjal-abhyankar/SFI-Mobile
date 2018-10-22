<!DOCTYPE HTML>
<!--
	Overflow 1.1 by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Keypad</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		        <meta http-equiv="refresh" content="1">

		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
	</head>
	<body>

          <!-- Session  -->
             <%@ page import ="java.io.BufferedWriter"%>
<%@page import = "java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>

<%@page import ="java.io.IOException"%>
<%@page import ="java.io.OutputStreamWriter"%>
<%@page import ="java.io.Writer"%>


<%@page import ="java.sql.*"%>
<%@page import ="java.util.*"%>
<%String judge;
HttpSession session1;
session1=request.getSession();
judge=session1.getAttribute("judge").toString();
String judges = null;
String judgess = null;
if(judge.equalsIgnoreCase("judge1")){judgess = "aalogin_judge1"; judges = "Judge1";}
if(judge.equalsIgnoreCase("judge2")){judgess = "aalogin_judge2"; judges = "Judge2";}
if(judge.equalsIgnoreCase("judge3")){judgess = "aalogin_judge3"; judges = "Judge3";}
if(judge.equalsIgnoreCase("judge4")){judgess = "aalogin_judge4"; judges = "Judge4";}
if(judge.equalsIgnoreCase("judge5")){judgess = "aalogin_judge5"; judges = "Judge5";}

%>
<% 
try 
{

/* Create string of connection url within specified format with machinename, port number and database name. Here machine name id localhost and database name is mydb. */ 
Class.forName("com.mysql.jdbc.Driver"); 
Connection connection = DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com:3306/aklkarni_swimming", "aklkarni_root", "ajk_root");

// declare a connection by using Connection interface 
int uid = 1;

/* declare object of Statement interface that is used for executing sql statements. */ 

Statement statement = null; 

// declare a resultset that uses as a table for output data from tha table. 

ResultSet rs = null; 

// Load JDBC driver "com.mysql.jdbc.Driver" 



/* Create a connection by using getConnection() method that takes parameters of string type connection url, user name and password to connect to database.*/ 



/* createStatement() is used for create statement object that is used for sending sql statements to the specified database. */ 

statement = connection.createStatement(); 
String score1 = null;
String score2 = null;
String score3 = null;
String score4 = null;
String score5 = null;
   
 
String name = null;
String state = null;
String dive = null;
String pos = null;
String gender = null;
float dd = 0;
 String code1 = null;
 String code2 = null;
 String code = null;
    String judgescore = request.getParameter("judgescore");
HttpSession judgesession = request.getSession();
judgesession.setAttribute("judgescore", judgescore);
HttpSession pname = request.getSession();
String participantname = pname.getAttribute("pname").toString();
ResultSet rs1 = null;
String schedule = "select * from schedule_copy where status = 'inprogress'";
rs = statement.executeQuery(schedule);
int i=1;
String round = "select * from round";
rs = statement.executeQuery(round);
while(rs.next()){round = rs.getString(1);} 
    
String display = "select * from active_participant where pid = '1'";
rs1=statement.executeQuery(display);
while(rs1.next())
{     
 dd = rs1.getFloat("dive"+round+"_dd");
 name = rs1.getString("name");
 gender= rs1.getString("gender");
 state = rs1.getString("state");
 dive=rs1.getString("dive"+round);
 pos = rs1.getString("dive"+round+"_pos");
}


String participant = "select name from active_participant where pid = '1'";
rs = statement.executeQuery(participant);
while(rs.next()){participant = rs.getString(1);}
   
 
String score = "select * from score";
rs = statement.executeQuery(score);
while(rs.next())
{
  score1 = rs.getString("judge1");  
  score2 = rs.getString("judge2");  
  score3 = rs.getString("judge3");  
  score4 = rs.getString("judge4");  
  score5 = rs.getString("judge5");  
}
if(score1==null){score1 = ".";}
if(score2==null){score2 = ".";}
if(score3==null){score3 = ".";}
if(score4==null){score4 = ".";}
if(score5==null){score5 = ".";}

	String newLine = System.getProperty("line.separator");

{      
    String lowest1=null;
    String highest=null;
    if(score1!="."&&score2!="."&&score3!="."&&score4!="."&&score5!=".")
    { lowest1 = "Select LEAST("+score1+", "+score2+", "+score3+", "+score4+", "+score5+")";
    ResultSet rs5 = statement.executeQuery(lowest1);
while(rs5.next()){lowest1 = rs5.getString(1);}
}
int flaglow=0;
int flaghigh = 0;

//while(rs5.next())
  //     {if(rs5.getString(1).compareToIgnoreCase(score1)==0){score1="0";}
    //        else{if(rs5.getString(1).compareToIgnoreCase(score2)==0){score2="0";}
      //         else{if(rs5.getString(1).compareToIgnoreCase(score3)==0){score3="0";}
        //           else{if(rs5.getString(1).compareToIgnoreCase(score4)==0){score4="0";}
          //           else{if(rs5.getString(1).compareToIgnoreCase(score5)==0){score5="0";}}}}}}
            if(score1!="."&&score2!="."&&score3!="."&&score4!="."&&score5!=".")

            { highest = "Select GREATEST("+score1+", "+score2+", "+score3+", "+score4+", "+score5+")";
ResultSet rs4 = statement.executeQuery(highest);
while(rs4.next()){highest = rs4.getString(1);}
            }
//while(rs4.next())
  //     {if(rs4.getString(1).compareToIgnoreCase(score1)==0){score1="0";}
    //        else{if(rs4.getString(1).compareToIgnoreCase(score2)==0){score2="0";}
      //         else{if(rs4.getString(1).compareToIgnoreCase(score3)==0){score3="0";}
        //           else{if(rs4.getString(1).compareToIgnoreCase(score4)==0){score4="0";}
          //           else{if(rs4.getString(1).compareToIgnoreCase(score5)==0){score5="0";}}}}}}
     
   %>

        
<!--        <table width="100%" height="100%" border="0">
  <tr>
      <th width="116" scope="col"><font size="24px"><%if(score1.equalsIgnoreCase(lowest1)&&flaglow==0) { %><u><%=score1%></u><%flaglow =1; } else { if(score1.equalsIgnoreCase(highest)&&flaghigh==0){ %><u><%=score1%></u><%flaghigh =1; } else { %><%=score1%> <% } } %></font></th><br>
    <th width="108" scope="col"><font size="24px"><%if(score2.equalsIgnoreCase(lowest1)&&flaglow==0) { %><u><%=score2%></u><%flaglow =1; } else { if(score2.equalsIgnoreCase(highest)&&flaghigh==0){ %><u><%=score2%></u><%flaghigh =1; } else { %><%=score2%> <% } } %></font></th><br>
    <th width="100" scope="col"><font size="24px">&nbsp;<%if(score3.equalsIgnoreCase(lowest1)&&flaglow==0) { %><u><%=score3%></u><%flaglow =1; } else { if(score3.equalsIgnoreCase(highest)&&flaghigh==0){ %><u><%=score3%></u><%flaghigh =1; } else { %><%=score3%> <% } } %></font></th><br>
    <th width="119" scope="col"><font size="24px">&nbsp; <%if(score4.equalsIgnoreCase(lowest1)&&flaglow==0) { %><u><%=score4%></u><%flaglow =1; } else { if(score4.equalsIgnoreCase(highest)&&flaghigh==0){ %><u><%=score4%></u><%flaghigh =1; } else { %><%=score4%> <% } } %></font></th><br>
    <th width="129" scope="col"><font size="24px">&nbsp; <%if(score5.equalsIgnoreCase(lowest1)&&flaglow==0) { %><u><%=score5%></u><%flaglow =1; } else { if(score5.equalsIgnoreCase(highest)&&flaghigh==0){ %><u><%=score5%></u><%flaghigh =1; } else { %><%=score5%> <% } } %></font></th><br>
  </tr>
</table> -->

        
        <% 
if(participantname.equalsIgnoreCase(name))
{
	%>
	
        <% if(judge.equalsIgnoreCase("judge1")){ %>
	<div style=" padding-top: 50%"><font size="30"><center>You have submitted "<%=score1%>" Please Wait.........</center></font></div>
	<%}else if (judge.equalsIgnoreCase("judge2")){%>
        <div style=" padding-top: 50%"><font size="30"><center>You have submitted "<%=score2%>" Please Wait.........</center></font></div>
	<%}else if (judge.equalsIgnoreCase("judge3")){%>
        <div style=" padding-top: 50%"><font size="30"><center>You have submitted "<%=score3%>" Please Wait.........</center></font></div>
	<%}else if (judge.equalsIgnoreCase("judge4")){%>
        <div style=" padding-top: 50%"><font size="30"><center>You have submitted "<%=score4%>" Please Wait.........</center></font></div>
	<%}else if (judge.equalsIgnoreCase("judge5")){%>
        <div style=" padding-top: 50%"><font size="30"><center>You have submitted "<%=score5%>" Please Wait.........</center></font></div>
	<%}%><%
}
else
{
	response.sendRedirect("activity.jsp");
}
// close all the connections.

rs.close(); 
statement.close(); 
connection.close(); 
} }
catch (Exception ex) 
{ 
%> 
<font size="+3" color="red"></b> 
<% 
out.println("Changing Round"); 
} 
        %>

    </body>
</html>