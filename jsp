<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee details</title>
<% if(null==session.getAttribute("name"))
    response.sendRedirect("Emplogin.jsp");
   %>
</head>
<body>
<center>
<h1>EMPLOYEE INFORMATION </h1>
<form id="frm" action="Updatecontroller">
<table>
 <tr>
    <td> Emp Id:</td>
    <td> <input type="text" name="eid" id="id" /></td>
     <td> <span id="sp0"></span></td>
 </tr>
 <tr>
    <td> Name:</td>
    <td> <input type="text" name="ename" id="name" /></td>
     <td> <span id="sp1"></span></td>
 </tr>
 <tr>
    <td>Current Password:</td>
    <td> <input type="password" name="pwd" id="pass" /></td>
     <td> <span id="sp8"></span></td>
 </tr>
 <tr>
    <td>New  Password:</td>
    <td> <input type="password" name="new_pwd" id="new_pass" /></td>
     <td> <span id="sp9"></span></td>
 </tr>
 <tr>
    <td>Age:</td>
    <td><input type="text" name="eage" id="age" /> </td>
    <td><span id="sp2"></span></td>
 </tr>
  <tr>
    <td>Gender:</td>
    <td> <input type="radio" name="egen" value="Male" id="m" />Male
    <input type="radio" name="egen" value="Female" id="f"/>Female </td>
    <td><span id="sp3"></span></td>
 </tr>
 <tr>
    <td> Qualification:</td>
    <td><input type="text" name="equal" id="equal" /></td>
    <td><span id="sp4"></span></td>
 </tr>
 <tr>
    <td> Designation:</td>
    <td> <input type="text" name="edes" id="edes"/></td>
    <td><span id="sp5"></span></td>
</tr>
<tr>
    <td> <input type="reset" name="reset" Value="Reset"/></td>
    <td><input type="submit" name="sub" value="Update" /></td>
    <td> <input type="button" name="back" Value="Back" onClick="location.href='Success.jsp?check=Login'"/></td>
   
</tr>
 </table>
 </form>
 </center>
</body>
</html>
................
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
<%
if(null==request.getParameter("check"))
{
	 response.sendRedirect("Empinfo.jsp");
	}
%>
</head>
<body>
<center><h1 style="color:red"><%=request.getParameter("check") %>Failed !</h1></center>

<% if(null!= request.getParameter("error"))
{
	 String error=request.getParameter("error");

	   response.sendRedirect("Empinfo.jsp?Exc="+error);
  
	}
%>

<% if(null!=request.getParameter("check")&&request.getParameter("check").equals("Updation"))
{ 
   %>
    <h1 style="color:light-red;">Wrong Details !</h1>
    <a href="Empinfo.jsp?update=yes" style="font-size: 20px;font-color:blue">Try Again</a>
   
<% } else if (request.getParameter("check").equals("Login")) {%>
    <a href="Emplogin.jsp" style="font-size: 20px;font-color:blue">Try Again</a>
    <% }else if(request.getParameter("check").equals("Registration")) {%>
     <a href="Empinfo.jsp" style="font-size: 20px;font-color:blue">Try Again</a>
     <% }
    else { 
    	   response.sendRedirect("Empinfo.jsp");
    	 }%>
    
    
</body>
</html>
............
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Page NOt found</title>
</head>
<body>
 <center><img style="position:absolute;top:20px;left:580px;"src="http://www.thinktraining.ca/portals/0/404_man.jpg"/>
 <a href="Empinfo.jsp" style="size:4px;color:blue;position:absolute;top:350px;left:710px;text-decoration: none;">Registration Page</a>
 <a href="Emplogin.jsp" style="size:4px;color:blue;position:absolute;top:350px;left:590px;text-decoration: none;">Login Page</a>
</center>
</body>
</html>
.................
<%@page import="db.Empoperation"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="emp.Logincontroller,db.Dbconnection,java.sql.ResultSet"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
 <%!boolean check =false;
      int empid;%>
 <script type="text/javascript">
    function check()
    {
        alert("HELLO");
      document.getElementById("1").innerHTML="";
             

        } 
     function confir()
        {
            if(confirm("Are You Sure ?"))
                {
                
                 location.href="Deletecontroller";
                
                }
            else
                {
                  alert("Saved");
                }
            }
        
          
  
</script>

     
<%
if(null==request.getParameter("check"))
{
	 if(null==session.getAttribute("name"))
 		{
	
   			response.sendRedirect("Emplogin.jsp");
 		}
	
}
%>
   


</head>
<body>

  <center>
 <h1 style="color:green">Welcome <%=
    session.getAttribute("name") %> </h1>
  
   <%if(null!=request.getParameter("check"))
   {
	   if(request.getParameter("check").equals("Login")||request.getParameter("check").equals("Updated"))
	   {
	 %>
	  <table bordercolor="black" border="2px" >
	    <tr><td colspan="2"> <h1>Employee Details</h1></td></tr>
	    <tr>
	         <td > Emp id: </td>
	         <td id="0"> <%= session.getAttribute("empid") %>  </td> 
	      </tr>
	      <tr>
	         <td > Emp name: </td>
	         <td id="1"> <%= session.getAttribute("name") %>  </td> 
	      </tr>
	     <tr>
	         <td>Age: </td>
	         <td id="2" > <%= session.getAttribute("age") %>  </td>
	      </tr>
	      <tr>
	         <td>Qualification: </td>
	         <td id="3" > <%=session.getAttribute("qual")  %>  </td>
	      </tr>
	      <tr>
	         <td>Designation: </td>
	         <td id="4"> <%= session.getAttribute("des")  %>  </td>
	      </tr>
	      <tr>
	         <td>Dept Id: </td>
	         <td id="5"> <%= session.getAttribute("depid")  %>  </td>
	      </tr>
	      <tr>
	         <td>Dept Name: </td>
	         <td id="6"> <%= session.getAttribute("depname")  %>  </td>
	      </tr>
	      <tr>
	         <td>Location: </td>
	         <td id="7"> <%= session.getAttribute("location")  %>  </td>
	      </tr>
	   </table>
	
     <div id="showdiv" style="visibility:hidden">
     </div>
	   
	  
	    
	       <% } } else {}%>
     
   <input type="button" style="size:4px;color:blue;text-decoration: blink;font-family: sans-serif;;position:absolute;top:320px;left:550px;" name="logout" value="Logout" onclick="location.href='Logout.jsp'"/>
   <input type="button" style="size:4px;color:blue;text-decoration: blink;font-family: sans-serif;;position:absolute;top:320px;left:680px;" name="logout" value="Update" onclick="location.href='Empinfo.jsp?update=yes'"/>
   <input type="button" style="size:4px;color:blue;text-decoration: blink;font-family: sans-serif;;position:absolute;top:320px;left:810px;" name="del" value="Delete" onclick="confir()"/>
   </center>
 
</body>
</html>
.................
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logout</title>
<%
   if(session!=null)
   {
	   
	   session.invalidate();
     response.sendRedirect("Emplogin.jsp");	   
   }
   else
   {
	   
	   response.sendRedirect("Emplogin.jsp");	   
   }
   
%>
</head>
<body>

</body>
</html>
..........................
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/validation.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee details</title>
<%! String update,check,name;
   boolean check1=true,check2=true;
     %>

 
<script type="text/javascript" >
  function check()
  { 
	   check1=true;
	 var length=document.getElementsByTagName("span").length;
	 document.getElementsByTagName("span")[0].innerHTML="";
	 for(var i=0;i<length;i++)
		{
     
          document.getElementsByTagName("span")[i].innerHTML="";
	   }
	 var name = document.getElementById("name").value;
	 var age = document.getElementById("age").value;
	 var quali= document.getElementById("equal").value;
     var des=document.getElementById("edes").value;
     var pwd=document.getElementById("pass").value;
     var id=document.getElementById("id").value;
	 var reg=/^[A-za-z ]{4,25}$/;
	 var age1=/^[0-9]{2,3}$/;
	 var id1=/^[0-9]{1,7}$/;
	 var qual=/^[A-za-z .]{2,19}$/;
	  
	  if(id.search(id1))
		 {
          
	     document.getElementById("sp0").innerHTML="Enter Valid Id";
		 document.getElementById("str0").innerHTML="*";
		 document.getElementById("last").innerHTML=" Fields with * Mandatory";
		 check1=false;
		 }
        if(pwd==null||pwd=="")
		  {
		  document.getElementById("sp8").innerHTML="Enter Password";
		  document.getElementById("str2").innerHTML="*";
		  document.getElementById("last").innerHTML=" Fields with * Mandatory";
		  check1=false;
		  }
	    if(name.search(reg)||name==""||name==null)
		 {
			 document.getElementById("sp1").innerHTML="Enter Valid Name";
			 document.getElementById("name").value = "";
			 document.getElementById("str1").innerHTML="*";
			 document.getElementById("last").innerHTML=" Fields with * Mandatory";
		
			  check1=false;
			  }
       if(age.search(age1)||age==""||age==null)
		 {
			 document.getElementById("sp2").innerHTML="Enter Valid Age";
			 age=" ";
			 document.getElementById("str3").innerHTML="*";
			 document.getElementById("last").innerHTML=" Fields with * Mandatory";
		 
			 check1=false;
		    }
	   if(quali.search(qual)||quali==""||quali==null)
		 {
			 document.getElementById("sp4").innerHTML="Enter Valid qualification";
			 check1=false;
			 qual=" "; 
			 document.getElementById("str5").innerHTML="*";
			 document.getElementById("last").innerHTML=" Fields with * Mandatory";
		    }
	   if(des.search(reg)||des==""||des==null)
		 {
			 document.getElementById("sp5").innerHTML="Enter Valid Designation";
			 check1=false;
			 des="";
			 document.getElementById("str6").innerHTML="*";
			 document.getElementById("last").innerHTML=" Fields with * Mandatory";
		    }
	    if(document.forms.myform.elements.egen[0].checked==false
	    	   && document.forms.myform.elements.egen[1].checked==false)
    	    {
	    	 document.getElementById("sp3").innerHTML="Please Select Gender";
	    	 check1=false;
	    	 document.getElementById("str4").innerHTML="*";
	    	 document.getElementById("last").innerHTML=" Fields with * Mandatory";
    	      }
	      if(document.getElementById("edepid").value.search(id1))
		      {
	    	  
	 	     document.getElementById("sp11").innerHTML="Enter Valid Id";
	 		 document.getElementById("str9").innerHTML="*";
	 		 document.getElementById("last").innerHTML=" Fields with * Mandatory";
	 		 check1=false;    
               }
	      if(document.getElementById("edepname").value.search(reg))
	      {
    	  
 	     document.getElementById("sp10").innerHTML="Enter Valid Department Name";
 		 document.getElementById("str8").innerHTML="*";
 		 document.getElementById("last").innerHTML="Fields with * Mandatory";
 		 check1=false;    
           }
	      if(document.getElementById("eloc").value==""||document.getElementById("eloc").value=="Enter location!")
	      {
    	  
 	     document.getElementById("sp12").innerHTML="Enter Location";
 		 document.getElementById("str10").innerHTML="*";
 		 document.getElementById("last").innerHTML=" Fields with * Mandatory";
 		 check1=false;    
           }
	     if(check1)
		     {
                document.forms["myform"].submit();
               
		     }
	   
	  } 
</script>
</head>
<body>
  
<center>
<h1 id="h1">EMPLOYEE REGISTRATION</h1>

<form id="frm" name="myform" action="Empcontroller" >
<table>
<% if(null !=request.getParameter("Exc"))
 {
	
    check=request.getParameter("Exc");
%>	
    <tr><td><span style="color:red;"><%=check %></span></td></tr>
		
<%}%>
  <tr>
    <td > Emp Id:  <span id="str0" style="color:blue;">*</span></td>
    <td> <input type="text" name="eid" id="id" /></td>
    <td> <span id="sp0"style="color:red;"></span></td>
 </tr>
 <tr>
    <td> Name: <span id="str1" style="color:blue;">*</span></td>
    <td> <input type="text" name="ename" id="name" /></td>
     <td> <span id="sp1" style="color:red;"></span></td>
 </tr>
 <tr>
    <td id="cpwd">Password: <span id="str2" style="color:blue;">*</span></td>
    <td> <input type="password" name="pwd" id="pass" /></td>
     <td> <span id="sp8"style="color:red;"></span></td>
 </tr>
 <tr id="new_pwd" style="visibility: hidden;">
    <td>New  Password:<span id="str7" style="color:blue;">*</span></td>
    <td> <input type="password" name="new_pwd" id="new_pass" /></td>
     <td> <span id="sp9"></span></td>
 </tr>
 <tr>
    <td>Age: <span id="str3" style="color:blue;">*</span></td>
    <td><input type="text" name="eage" id="age" /> </td>
    <td><span id="sp2"style="color:red;"></span></td>
 </tr>
  <tr>
    <td>Gender: <span id="str4" style="color:blue;">*</span></td>
    <td> <input type="radio" name="egen" value="Male" id="m" />Male
    <input type="radio" name="egen" value="Female" id="f"/>Female </td>
    <td><span id="sp3"style="color:red;"></span></td>
 </tr>
 <tr>
    <td> Qualification: <span id="str5" style="color:blue;">*</span></td>
    <td><input type="text" name="equal" id="equal" /></td>
    <td><span id="sp4" style="color:red;"></span></td>
 </tr>
 <tr>
    <td> Designation: <span id="str6" style="color:blue;">*</span></td>
    <td> <input type="text" name="edes" id="edes"/></td>
    <td><span id="sp5" style="color:red;"></span></td>
</tr>
 <tr>
    <td> Department Name: <span id="str8" style="color:blue;">*</span></td>
    <td> <input type="text" name="depname" id="edepname"/></td>
    <td><span id="sp10" style="color:red;"></span></td>
</tr>
 <tr>
    <td> Department Id: <span id="str9" style="color:blue;">*</span></td>
    <td> <input type="text" name="depid" id="edepid"/></td>
    <td><span id="sp11" style="color:red;"></span></td>
</tr>
<tr>
    <td> Location: <span id="str10" style="color:blue;">*</span></td>
    <td> <textarea cols="16" rows="4"  name="loc" id="eloc">Enter location!</textarea></td>
    <td><span id="sp12" style="color:red;"></span></td>
</tr>
<tr>
    <td> <input type="reset" style="color:blue;" name="reset" Value="Reset"/></td>
    <td><input type="button" name="sub" value="Submit" style="visibility:visible;color:blue;" onclick="check();"/></td> 
    <td><input type="button" name="sub" value="Update" style="visibility: hidden;color:blue;" onclick="check();"/></td> 
     <td><span id="last" style="color:blue;"></span></td> 
</tr>
 <tr>
   <td>
     <a href="Emplogin.jsp" id="success">Login Page</a>
  
     </td>
   </tr>
</table>
</form>
</center>
<%

 if(null!=request.getParameter("update"))
  {
	 if(null!=session.getAttribute("name"))
	 {
		 name=session.getAttribute("name").toString();
		
		 %>
		   
<script>
  
        function checkpwd()
        {
            check2=true;
            var pwd=document.getElementById("new_pass").value;
        	  if(pwd==null||pwd=="")
    		  {
    		  		document.getElementById("sp9").innerHTML="Enter Password";
    		  		document.getElementById("str7").innerHTML="*";
    		  		document.getElementById("last").innerHTML=" Fields with * Mandatory";
    		  		check2=false;
    		  }
    		  if(check1 && check2)
        	   {
                     document.forms["myform"].submit();
        	   }
    		
         } 
          document.getElementById("id").value =<%= session.getAttribute("empid") %>
          document.getElementById("age").value=<%= session.getAttribute("age") %>
          document.getElementById("name").value="<%=name%>";
          document.getElementById("equal").value="<%=session.getAttribute("qual")%>";
          document.getElementById("edes").value="<%=session.getAttribute("des")%>"
          <% 
             if(session.getAttribute("gen").equals("Male"))
             {
        	 %>
        	  document.getElementsByName("egen")[0].checked=true; 
          <% }else{%>
               document.getElementsByName("egen")[1].checked=true; 
            <%}%>
            document.getElementById("success").innerHTML="Welcome Page";
            document.getElementsByName("sub")[0].style.visibility="hidden";
            document.getElementsByName("sub")[1].style.visibility="visible";
            document.getElementsByName("sub")[1].style.position="absolute";
            document.getElementsByName("sub")[1].style.left="720px";
            document.getElementsByName("sub")[1].style.top="318px";
            document.getElementById("cpwd").innerHTML="Current Password";
            document.getElementById("new_pwd").style.visibility="visible"; 
            document.getElementById("h1").innerHTML="Update Your Details";
</script>	 	 
	 	 
	 <% }
	 else
	 {
			response.sendRedirect("Empinfo.jsp?check=Login");
	 }
	 
  }
  else
  {
	  if(null!=session.getAttribute("name"))response.sendRedirect("Success.jsp");
  }%>
 
</body>
</html>
........................
<%@page import="db.Empoperation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<body>
<%! Integer id;
boolean check;%>
 <%
 id =Integer.parseInt(session.getAttribute("empid").toString());
  Empoperation.delete(id);
 %>
</body>
</html>
...................
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Login</title>
<% if(null!=session.getAttribute("name"))
{
	response.sendRedirect("Success.jsp?check=Login");
	} %>
<script>
function check()
{ 
	  var check=true;
	  var length=document.getElementsByTagName("span").length;
	  document.getElementsByTagName("span")[0].innerHTML="";
	  for(var i=0;i<length;i++)
		 {
              document.getElementsByTagName("span")[i].innerHTML="";
	      }
	  var name = document.getElementById("name").value;
	  var pwd=document.getElementById("pass").value;
      var id=document.getElementById("id").value;
	  var reg=/^[A-za-z ]{4,25}$/;
	  var id1=/^[0-9]{1,7}$/;
	  
	  
	  if(id.search(id1))
		 {
        
	     	 document.getElementById("sp0").innerHTML="Enter Valid Id";
			 document.getElementById("str0").innerHTML="*";
			 document.getElementById("last").innerHTML="* All Fields Mandatory";
			 check=false;
		 }
      if(pwd==null||pwd=="")
		  {
		  	document.getElementById("sp8").innerHTML="Enter Password";
		  	document.getElementById("str2").innerHTML="*";
		  	document.getElementById("last").innerHTML="* All Fields Mandatory";
		 	check=false;
		  }
	    if(name.search(reg)||name==""||name==null)
		 {
			 document.getElementById("sp1").innerHTML="Enter Valid Name";
			 document.getElementById("name").value = "";
			 document.getElementById("str1").innerHTML="*";
			 document.getElementById("last").innerHTML="* All Fields Mandatory";
		     check=false;
		 }
   
	    if(check)
		  {
	    	document.forms["myform"].submit();
		    }
	    
	  } 

</script>
</head>
<body>
<center>
  <h1>Employee Login</h1>
  <form action="Logincontroller" name="myform">
  <table>
  <tr>
  <tr>
    <td> Emp Id:  <span id="str0" style="color:red;"></span></td>
    <td> <input type="text" name="eid" id="id"/></td>
    <td> <span id="sp0"style="color:red;"></span></td>
 </tr>
 <tr>
    <td> User Name: <span id="str1" style="color:red;"></span></td>
    <td> <input type="text" name="uname" id="name" /></td>
     <td> <span id="sp1" style="color:red;"></span></td>
 </tr>
 <tr>
    <td>Password: <span id="str2" style="color:red;"></span></td>
    <td> <input type="password" name="pwd" id="pass" /></td>
     <td> <span id="sp8"style="color:red;"></span></td>
 </tr>
  <tr>
    <td> <input type="reset" name="reset" Value="Reset"/></td>
    <td><input type="button" name="sub" value="Submit" onclick="check()" /></td>
    <td><span id="last" style="color:blue;"></span></td>
   </tr>
   
   <tr>
   <td>
     <a href="Empinfo.jsp">Registration Link</a>
     </td>
   </tr>
 
    </table>
    </form>
   </center> 
</body>
</html>
