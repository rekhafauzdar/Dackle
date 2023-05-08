<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DackleSystem</title>
<meta content="" name="description">
<meta content="" name="keywords">

<link rel="stylesheet" href="assets/style.css" type="text/css">


<!-- Favicons -->
<!--  <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon"> -->
    
     <!-- Fontawesome CDN Link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script src="assets/script.js"></script>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>


<style>

@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins',sans-serif;
}
body{
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 10px;
  background-color:#04888d;
}
.container{
  max-width: 700px;
  width: 100%;
  background-color: #fff;
  padding: 25px 30px;
  border-radius: 5px;
  box-shadow: 0 5px 10px rgba(0,0,0,0.15);
}
.container .title{
  font-size: 25px;
  font-weight: 500;
  position: relative;
}
.container .title::before{
  content: "";
  position: absolute;
  left: 0;
  bottom: 0;
  height: 3px;
  width: 30px;
  border-radius: 5px;
 background: linear-gradient(135deg, #71b7e6, #04888d);
}
.content form .user-details{
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  margin: 20px 0 12px 0;
}
form .user-details .input-box{
  margin-bottom: 15px;
  width: calc(100% / 2 - 20px);
}
form .input-box span.details{
  display: block;
  font-weight: 500;
  margin-bottom: 5px;
}
.user-details .input-box input{
  height: 45px;
  width: 100%;
  outline: none;
  font-size: 16px;
  border-radius: 5px;
  padding-left: 15px;
  border: 1px solid #ccc;
  border-bottom-width: 2px;
  transition: all 0.3s ease;
}
.user-details .input-box input:focus,
.user-details .input-box input:valid{
  border-color: #04888d;
}
 form .gender-details .gender-title{
  font-size: 20px;
  font-weight: 500;
 }
 form .category{
   display: flex;
   width: 80%;
   margin: 14px 0 ;
   justify-content: space-between;
 }
 form .category label{
   display: flex;
   align-items: center;
   cursor: pointer;
 }
 form .category label .dot{
  height: 18px;
  width: 18px;
  border-radius: 50%;
  margin-right: 10px;
  background: #04888d;
  border: 5px solid transparent;
  transition: all 0.3s ease;
}
 #dot-1:checked ~ .category label .one,
 #dot-2:checked ~ .category label .two,
 #dot-3:checked ~ .category label .three{
   background: #d9d9d9;
   border-color: #04888d;
 }
 form input[type="radio"]{
   display: none;
 }
 form .button{
   height: 45px;
   margin: 35px 0
 }
 form .button input{
   height: 100%;
   width: 100%;
   border-radius: 5px;
   border: none;
   color: #fff;
   font-size: 18px;
   font-weight: 500;
   letter-spacing: 1px;
   cursor: pointer;
   transition: all 0.3s ease;
   background: linear-gradient(135deg, #71b7e6, #04888d);
 }
 form .button input:hover{
  /* transform: scale(0.99); */
  background: linear-gradient(-135deg, #71b7e6, #04888d);
  }
 @media(max-width: 584px){
 .container{
  max-width: 100%;
}
form .user-details .input-box{
    margin-bottom: 15px;
    width: 100%;
  }
  form .category{
    width: 100%;
  }
  .content form .user-details{
    max-height: 300px;
    overflow-y: scroll;
  }
  .user-details::-webkit-scrollbar{
    width: 5px;
  }
  }
  @media(max-width: 459px){
  .container .content .category{
    flex-direction: column;
  }
}


 .sign-up-text{
  text-align: center;
  margin-top: 5px;
  
}

.input-box i{
  position: absolute;
  color: #04888d;
  font-size: 17px;
}


</style>


<script type="text/javascript">
	
	 function registration() {
		 
		 
	    $.ajax({
	        url: '/registration',
	        type: 'get',
	        dataType: 'json',
	        data: $('form#registrationform').serialize(),     
	        
	        success: function(data) {
	        	if(data){
	        		alert("Registration is successfully!");
	        		window.open("/","_self");
	        		
	        	}
	        	else{
	        		
	        		alert("Something went wrong!");
	        	}
	        }
	        	  	
	//console.log(data);	                 
	    });
	};
	</script>
	
	<script type="text/javascript">
	
	function validateForm() {  
	    //collect form data in JavaScript variables  
	    var pw1 = document.getElementById("password").value;  
	    var pw2 = document.getElementById("confirmpassword").value;  
	    var name = document.getElementById("name").value;  
	    var email = document.getElementById("mailId").value;  
	    var userName = document.getElementById("userName").value;  
	      
	    //check empty first name field  
	    if(name == "") {  
	      document.getElementById("blankMsg").innerHTML = "**Fill the name ";  
	      return false;  
	    }  
	      
	    //character data validation  
	    if(!isNaN(userName)){  
	      document.getElementById("charMsg").innerHTML = "**Only characters are allowed";  
	      return false;  
	    }  
	    
	    //check correct email validation
	    if (!/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)) {
	    	 document.getElementById("mailmsg").innerHTML = "**You have entered an invalid email address!"; 
	    	 return false;
 			 }
   			 
 			 
	  
	    
	  
	   
	    //check empty password field  
	    if(pw1 == "") {  
	      document.getElementById("message1").innerHTML = "**Fill the password please!";  
	      return false;  
	    }  
	    
	    //check empty confirm password field  
	    if(pw2 == "") {  
	      document.getElementById("message2").innerHTML = "**Enter the password please!";  
	      return false;  
	    }   
	     
	    //minimum password length validation  
	    if(pw1.length < 8) {  
	      document.getElementById("message1").innerHTML = "**Password length must be atleast 8 characters";  
	      return false;  
	    }  
	  
	    //maximum length of password validation  
	    if(pw1.length > 15) {  
	      document.getElementById("message1").innerHTML = "**Password length must not exceed 15 characters";  
	      return false;  
	    }  
	    
	    if(pw1 != pw2) {  
	      document.getElementById("message2").innerHTML = "**Passwords are not same";  
	      return false;  
	    }     
	     
	    $.ajax({
	        url: '/registration',
	        type: 'get',
	        dataType: 'json',
	        data: $('form#registrationform').serialize(),     
	        
	        success: function(data) {
	        	if(data){
	        		alert("Registration successfully!");
	        		window.open("/","_self");
	        		
	        	}
	        	else{
	        		
	        		alert("Something went wrong!");
	        	}
	        }
	        	  	
	                
	    });
	  	        	  	
	    
	    
	 }  
	</script>
   
    
   </head>
<body>


  <div class="container" style="margin-top:40px" >
  <div style="text-align:right;"><a href="/"><i class="fa fa-close" title="close" style="font-size:24px; text-align:right;"></i></a></div>
  
    <div class="title">Registration Form</div>
    
   
    <div class="content">
      <form action="#" id="registrationform" >
        <div class="user-details">
          <div class="input-box">
            <span class="details">Full Name<span style="color:red;">*</span></span>
            <input type="text" placeholder="Enter your name" name="name" id="name" onkeypress="return((event.charCode >= 65 && event.charCode <= 90) || (event.charCode >= 97 && event.charCode <= 122) || (event.charCode == 32 )  )" required>
            <span id = "blankMsg" style="color:red"> </span>
          </div>
          <div class="input-box">
            <span class="details">Username<span style="color:red;">*</span></span>
            <input type="text" placeholder="Enter your username" name="userName" id="userName" minlength="6" onkeypress="return((event.charCode >= 65 && event.charCode <= 90) || (event.charCode >= 97 && event.charCode <= 122) ||(event.charCode == 95 ))" required>
            <span id = "charMsg" style="color:red"> </span>
          </div>
          <div class="input-box">
            <span class="details">Email</span>
            <input type="email" placeholder="Enter your email" name="mailId" id="mailId" >
             <span id = "mailmsg" style="color:red"> </span>
          </div>
          <div class="input-box">
            <span class="details">Phone Number</span>
            <input type="text" placeholder="Enter your number" name="contactNo" id="contactNo" minlength="10" maxlength="10" onkeypress="return(event.charCode >= 48 && event.charCode <= 57)">
          </div>
          <div class="input-box">
            <span class="details">Password<span style="color:red;">*</span></span>
            <input type="password" placeholder="Enter your password" name="password" id="password"  required>
            <span id = "message1" style="color:red"> </span> 
          </div>
          <div class="input-box">
            <span class="details">Confirm Password<span style="color:red;">*</span></span>
            <input type="password" placeholder="Confirm your password" name="confirmpassword"  id="confirmpassword" required>
          <span id = "message2" style="color:red"> </span> 
          </div>
        </div>
        <div class="gender-details">
          <input type="radio" name="gender" id="dot-1" value="1">
          <input type="radio" name="gender" id="dot-2" value="2">
          <input type="radio" name="gender" id="dot-3" value="3">
          <span class="gender-title">Gender<span style="color:red;">*</span></span>
          <div class="category">
            <label for="dot-1">
            <span class="dot one"></span>
            <span class="gender">Male</span>
          </label>
          <label for="dot-2">
            <span class="dot two"></span>
            <span class="gender">Female</span>
          </label>
          <label for="dot-3" >
            <span class="dot three"></span>
            <span class="gender">Prefer not to say</span>
            </label>
          </div>
        </div>
        <div class="button">
          <input type="button" value="Register" onClick="validateForm()">
        </div>
        <div>
        <div class="text sign-up-text">Already a User? <label for="flip"><a href="/">Login Here</a></label></div>
        
        </div>
      </form>
    </div>
  </div>
</body>
</html>