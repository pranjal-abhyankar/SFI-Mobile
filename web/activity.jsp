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
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,300italic" rel="stylesheet" type="text/css" />
		<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
		<script src="js/jquery.min.js"></script>
		<script src="js/jquery.poptrox.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/init.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel-noscript.css" />
			<link rel="stylesheet" href="css/style.css" />
		</noscript>
		<!-- Script by hscripts.com -->
		<script>
function myFunction()
{
document.getElementById("myImg").src="images/submithvr.png";
}
</script>
<script type="text/javascript">
	window.history.forward(1);
	function noBack()
  { 
  window.history.forward(); 
  }
        function finalsbmit(score)
        {
            var result= Confirm("You ")
</script>
<!-- Script by hscripts.com -->
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
	</head>
 <body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">

          <!-- Session  -->
          
          			
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

        
<%@ page import = "java.util.*" %>         
 
<%@ page import = "java.sql.*" %>
<%
try
               {
Class.forName("com.mysql.jdbc.Driver");
    
Connection connection = DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com:3306/aklkarni_swimming", "aklkarni_root", "ajk_root");

ResultSet rs = null;

Statement statement = connection.createStatement();


 String query = "set names utf8";
 statement.execute(query);
 
 String name= null;
 String dive= null;
 String position = null;
 String dd = null;
 String state = null;
 String event = null;
 String height = null;
 String gender = null;
 String code = null;
 
          

    
 String round = "select * from round";
rs = statement.executeQuery(round);
while(rs.next()){round = rs.getString(1);} 

 String participant= "select * from active_participant where pid = '1'";
 rs=statement.executeQuery(participant);
 
 while(rs.next())
         {
     name = rs.getString("Name");
     dive = rs.getString("dive"+round);
     position = rs.getString("dive"+round+"_pos");
     dd = rs.getString("dive"+round+"_dd");
     state = rs.getString("state");
 }
%>     
    
 
         	<!-- Header -->
         	
         		
        
				<table border="0" align="center" id="table" style=" color: white">
  <tr>
    <th width="162" scope="col" colspan = "3"><div align="center">	<h1> <%=name%></h1>
</div></th>
   </tr><tr> <th width="86" scope="col"><div align="center"><font size=+3><%=dive%> <%=position%> <%=dd%></font></div></th>
    </tr>
</table>
					</p><section id="headers">
				<p>
                                      <form action ="activityintermediate.jsp" method="post" id="myForm" name = "myForm">			
<TABLE id="keypad"  border=1 cellpadding=40  align="center"  cellspacing=20 style="top:20%; ">

<TR valign=top>
    <td colspan="3"><input id="judgescore" name="judgescore" type="text" maxlength = "2" value="0" fontsize="32" style="top:10%;width:100%;text-align: center; height:75px; font-size: 50px" readonly>
    </td></TR>
<tr><td><br></td></tr><TR>
<div id="num1"><TD width=71 height=37><center><img src="images/done 1.png" onclick="one()"></center>
     </TD></div>
<div id="num2"><TD width=71 height=37><center><img src="images/2.png" onclick="two()"></center>
</TD></div>
<div id="num3"><TD width=71 height=37><center><img src="images/3.png" onclick="three()"></center>
</TD></div>
</TR>
<TR valign=top>
<div id="num4"><TD width=71 height=43><center><img src="images/4.png" onclick="four()"></center>
</TD></div>
<div id="num5"><TD width=71 height=43><center><img src="images/5.png" onclick="five()"></center>
</TD></div>
<div id="num6"><TD width=71 height=43><center><img src="images/6.png" onclick="six()"></center>
</TD></div>
</TR>
<TR valign=top>
<div id="num7"><TD width=71 height=37><center><img src="images/7.png" onclick="seven()"></center>
</TD></div>
<div id="num8"><TD width=71 height=37><center><img src="images/8.png" onclick="eight()"></center>
</TD></div>
<div id="num9"><TD width=71 height=37><center><img src="images/9.png" onclick="nine()"></center>
</TD></div>
</TR>
<TR valign=top>
<div id="numpoint5"><TD width=71 height=31><center><img src="images/point5.png" onclick="point5()"></center>
</TD></div>
<div id="num0"><TD width=71 height=31><center><img src="images/0.png" onclick="zero()"></center>
</TD></div>
<div id="del"><TD width=71 height=31><center><img src="images/delete.png" onclick="del()"></center>
</TD></div>
</TR>
<TR>
    <td><br></td><td><center>
<img src="images/submit.png" id="myImg" name="myImg" onmouseover="return myFunction()" onclick = "SF()"></center></td><td><br></td>

<!--<button onclick="SForm()">submit</button>>--></TR>


</TABLE>
</form>	</p>
<script lang="javascript">
function SF()
{  
    var score=document.getElementById("judgescore").value;
    var result=confirm("YOUR SCORE IS : "+score);
    if(result)
    {
     document.forms['myForm'].submit() ;   
    }
   
}
</script>
		<script type="text/javascript">
    function one()
    {
    document.getElementById('judgescore').value=1;
    }
    function two()
    {
    document.getElementById('judgescore').value=2;
    }
    function three()
    {
    document.getElementById('judgescore').value=3;
    }
    function four()
    {
    document.getElementById('judgescore').value=4;
    }
    function five()
    {
    document.getElementById('judgescore').value=5;
    }
    function six()
    {
    document.getElementById('judgescore').value=6;
    }
    function seven()
    {
    document.getElementById('judgescore').value=7;
    }
    function eight()
    {
    document.getElementById('judgescore').value=8;
    }
    function nine()
    {
    document.getElementById('judgescore').value=9;
    }
    function zero()
    {
    document.getElementById('judgescore').value=document.getElementById('judgescore').value+0;
    if(document.getElementById('judgescore').value>10){document.getElementById('judgescore').value=10;}
    }
    function del()
    {
    document.getElementById('judgescore').value=0;
    }
    function point5()
    {
	var point = document.getElementById('judgescore').value;
    document.getElementById('judgescore').value=parseInt(point)+0.5;
        if(document.getElementById('judgescore').value>10){document.getElementById('judgescore').value=10;}

    }
		</script>

						</section>
		
		<!-- Feature 1 -->
		
		<!-- Generic -->
		<!--
			<article class="container box style3">
				<header>
					<h2>Generic Box</h2>
					<p>Just a generic box. Nothing to see here.</p>
				</header>
				<section>
					<header>
						<h3>Paragraph</h3>
						<p>This is a byline</p>
					</header>
					<p>Phasellus nisl nisl, varius id <sup>porttitor sed pellentesque</sup> ac orci. Pellentesque 
					habitant <strong>strong</strong> tristique <b>bold</b> et netus <i>italic</i> malesuada <em>emphasized</em> ac turpis egestas. Morbi 
					leo suscipit ut. Praesent <sub>id turpis vitae</sub> turpis pretium ultricies. Vestibulum sit 
					amet risus elit.</p>
				</section>
				<section>
					<header>
						<h3>Blockquote</h3>
					</header>
					<blockquote>Fringilla nisl. Donec accumsan interdum nisi, quis tincidunt felis sagittis eget.
					tempus euismod. Vestibulum ante ipsum primis in faucibus.</blockquote>
				</section>
				<section>
					<header>
						<h3>Divider</h3>
					</header>
					<p>Donec consectetur <a href="#">vestibulum dolor et pulvinar</a>. Etiam vel felis enim, at viverra 
					ligula. Ut porttitor sagittis lorem, quis eleifend nisi ornare vel. Praesent nec orci 
					facilisis leo magna. Cras sit amet urna eros, id egestas urna. Quisque aliquam 
					tempus euismod. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices 
					posuere cubilia.</p>
					<hr />
					<p>Donec consectetur vestibulum dolor et pulvinar. Etiam vel felis enim, at viverra 
					ligula. Ut porttitor sagittis lorem, quis eleifend nisi ornare vel. Praesent nec orci 
					facilisis leo magna. Cras sit amet urna eros, id egestas urna. Quisque aliquam 
					tempus euismod. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices 
					posuere cubilia.</p>
				</section>
				<section>
					<header>
						<h3>Unordered List</h3>
					</header>
					<ul class="default">
						<li>Donec consectetur vestibulum dolor et pulvinar. Etiam vel felis enim, at viverra ligula. Ut porttitor sagittis lorem, quis eleifend nisi ornare vel.</li>
						<li>Donec consectetur vestibulum dolor et pulvinar. Etiam vel felis enim, at viverra ligula. Ut porttitor sagittis lorem, quis eleifend nisi ornare vel.</li>
						<li>Donec consectetur vestibulum dolor et pulvinar. Etiam vel felis enim, at viverra ligula. Ut porttitor sagittis lorem, quis eleifend nisi ornare vel.</li>
						<li>Donec consectetur vestibulum dolor et pulvinar. Etiam vel felis enim, at viverra ligula. Ut porttitor sagittis lorem, quis eleifend nisi ornare vel.</li>
					</ul>
				</section>
				<section>
					<header>
						<h3>Ordered List</h3>
					</header>
					<ol class="default">
						<li>Donec consectetur vestibulum dolor et pulvinar. Etiam vel felis enim, at viverra ligula. Ut porttitor sagittis lorem, quis eleifend nisi ornare vel.</li>
						<li>Donec consectetur vestibulum dolor et pulvinar. Etiam vel felis enim, at viverra ligula. Ut porttitor sagittis lorem, quis eleifend nisi ornare vel.</li>
						<li>Donec consectetur vestibulum dolor et pulvinar. Etiam vel felis enim, at viverra ligula. Ut porttitor sagittis lorem, quis eleifend nisi ornare vel.</li>
						<li>Donec consectetur vestibulum dolor et pulvinar. Etiam vel felis enim, at viverra ligula. Ut porttitor sagittis lorem, quis eleifend nisi ornare vel.</li>
					</ol>
				</section>
				<section>
					<header>
						<h3>Table</h3>
					</header>
					<div class="table-wrapper">
						<table class="default">
							<thead>
								<tr>
									<th>ID</th>
									<th>Name</th>
									<th>Description</th>
									<th>Price</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>45815</td>
									<td>Something</td>
									<td>Ut porttitor sagittis lorem quis nisi ornare.</td>
									<td>29.99</td>
								</tr>
								<tr>
									<td>24524</td>
									<td>Nothing</td>
									<td>Ut porttitor sagittis lorem quis nisi ornare.</td>
									<td>19.99</td>
								</tr>
								<tr>
									<td>45815</td>
									<td>Something</td>
									<td>Ut porttitor sagittis lorem quis nisi ornare.</td>
									<td>29.99</td>
								</tr>
								<tr>
									<td>24524</td>
									<td>Nothing</td>
									<td>Ut porttitor sagittis lorem quis nisi ornare.</td>
									<td>19.99</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="3"></td>
									<td>100.00</td>
								</tr>
							</tfoot>
						</table>
					</div>
				</section>
				<section>
					<header>
						<h3>Form</h3>
					</header>
					<form method="post" action="#">
						<div class="row">
							<div class="6u">
								<input class="text" type="text" name="name" id="name" value="" placeholder="John Doe" />
							</div>
							<div class="6u">
								<input class="text" type="text" name="email" id="email" value="" placeholder="johndoe@domain.tld" />
							</div>
						</div>
						<div class="row">
							<div class="12u">
								<select name="department" id="department">
									<option value="">Choose a department</option>
									<option value="1">Manufacturing</option>
									<option value="2">Administration</option>
									<option value="3">Support</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="12u">
								<input class="text" type="text" name="subject" id="subject" value="" placeholder="Enter your subject" />
							</div>
						</div>
						<div class="row">
							<div class="12u">
								<textarea name="message" id="message" placeholder="Enter your message"></textarea>
							</div>
						</div>
						<div class="row">
							<div class="12u">
								<ul class="actions">
									<li><a href="#" class="button form">Submit</a></li>
									<li><a href="#" class="button style3 form-reset">Clear Form</a></li>
								</ul>
							</div>
						</div>
					</form>
				</section>
			</article>
		-->
		
		<section id="footer">
		
			<div class="copyright">
				<ul class="menu">
				        <li><%=judge%></li>
					<li>Copyright &copy; Innovative Infosoft</li>
					
				</ul>
			</div>
		</section>
<% 
rs.close();
connection.close();
}
catch(Exception e)
        {
    out.print(e);
}
%>

           
	</body>
</html>