<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Home</title>
<meta content="" name="description">
<meta content="" name="keywords">

<link rel="stylesheet" href="assets/style.css" type="text/css">

<!-- Favicons -->
<!--  <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon"> -->
    
    <!-- Fontawesome CDN Link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

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
   /* Google Font Link */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins" , sans-serif;
}
body{
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
   background: #71b7e6;
  
  padding: 20px;
}
.container{
  position: relative;
  max-width: 850px;
  width: 100%;
  min-height:70vh;
  background: #fff;
  padding: 40px 30px;
  box-shadow: 0 5px 10px rgba(0,0,0,0.2);
  perspective: 2700px;
  border-radius:40px;
}
.container .cover{
  position: absolute;
  top: 0;
  left: 50%;
  height: 100%;
  width: 50%;
  z-index: 98;
  transition: all 1s ease;
  transform-origin: left;
 
}



.container .cover::before,
.container .cover::after{
  content: '';
  position: absolute;
  height: 100%;
  width: 100%;
 
  opacity: 0.5;
  z-index: 12;
}
.container .cover::after{
 
  transform: rotateY(180deg);

}
.container .cover img{
  position: absolute; 
margin-top:60px;
text-align: center;  
 
 max-width: 100%; 
  height: auto; 
  
  
}


.container .forms{
  height: 100%;
  width: 100%;
  background: #fff;
}
.container .form-content{
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.form-content .login-form,
.form-content .signup-form{
  width: calc(100% / 2 - 25px);
}
.forms .form-content .title{
  position: relative;
  font-size: 24px;
  font-weight: 500;
  color: #333;
}
.forms .form-content .title:before{
  content: '';
  position: absolute;
  left: 0;
  bottom: 0;
  height: 3px;
  width: 25px;
  background:  linear-gradient(135deg, #71b7e6, #04888d);
}
.forms .signup-form  .title:before{
  width: 20px;
}
.forms .form-content .input-boxes{
  margin-top: 30px;
}
.forms .form-content .input-box{
  display: flex;
  align-items: center;
  height: 50px;
  width: 100%;
  margin: 10px 0;
  position: relative;
}
.form-content .input-box input{
  height: 100%;
  width: 100%;
  outline: none;
  border: none;
  padding: 0 30px;
  font-size: 16px;
  font-weight: 500;
  border-bottom: 2px solid rgba(0,0,0,0.2);
  transition: all 0.3s ease;
}
.form-content .input-box input:focus,
.form-content .input-box input:valid{
  border-color: #04888d;
}
.form-content .input-box i{
  position: absolute;
  color: #04888d;
  font-size: 17px;
}
.forms .form-content .text{
  font-size: 14px;
  font-weight: 500;
  color: #333;
}
.forms .form-content .text a{
  text-decoration: none;
}
.forms .form-content .text a:hover{
  text-decoration: underline;
}
.forms .form-content .button{
  color: #fff;
  margin-top: 40px;
}
.forms .form-content .button input{
  color: #fff;
  background:  linear-gradient(135deg, #71b7e6, #04888d);
  border-radius: 6px;
  padding: 0;
  cursor: pointer;
  transition: all 0.4s ease;
}
.forms .form-content .button input:hover{
  background: #5b13b9;
}
.forms .form-content label{
  color: #5b13b9;
  cursor: pointer;
}
.forms .form-content label:hover{
  text-decoration: underline;
}
.forms .form-content .login-text,
.forms .form-content .sign-up-text{
  text-align: center;
  margin-top: 25px;
}
.container #flip{
  display: none;
}
@media (max-width: 730px) {
  .container .cover{
    display: none;
  }
  .form-content .login-form,
  .form-content .signup-form{
    width: 100%;
  }
  .form-content .signup-form{
    display: none;
  }
  .container #flip:checked ~ .forms .signup-form{
    display: block;
  }
  .container #flip:checked ~ .forms .login-form{
    display: none;
  }
}
   </style>
  
	
	
	<script type="text/javascript">
	
	function validateForm() {  
	    //collect form data in JavaScript variables  
	    	   
	    var userName = document.getElementById("username").value;  
	    var pw1 = document.getElementById("password").value; 
	      
	    //check empty first name field  
	    if(userName == "") {  
	      document.getElementById("blankMsg").innerHTML = "**Fill the Username ";  
	      return false;  
	    } 
	    
	    //check empty password field  
	    if(pw1 == "") {  
	      document.getElementById("blankpass").innerHTML = "**Fill the password please!";  
	      return false;  
	    }  
	    
	    
		    $.ajax({
		        url: '/login',
		        type: 'get',
		        dataType: 'json',
		        data: $('form#loginform').serialize(),
		        success: function(data) {
		        	if(data){
		        		window.open("/home","_self");
		        	}
		        	else{
		        		alert("Username or password is wrong");
		        	}
		        }
		        	  	
			                 
		    });
	
	   
	 }  
	</script>
   
   
	
	

</head>


 <body  >
 
  
 
 <div class="container">
 	 <section  class="about" >
    
    	 <div class="cover">
      <div class="front">
        <img src="images/innoblooms1.png" alt=""  >
       
      </div>
     
    </div>
    
   
    <div class="forms">
        <div class="form-content">
          <div class="login-form">
            <div class="title">Login</div>
           <form action="#" id="loginform" >
            <div class="input-boxes">
              <div class="input-box">
                <i class="fas fa-user-alt"></i>                
                <input type="text" class="form-control" name="username" id="username" placeholder="Enter Username" required>
                 <span id = "blankMsg" style="color:red"> </span>
              </div>
              <div class="input-box">
                <i class="fas fa-lock"></i>                
                <input name="password" type="password" class="form-control" id="password" placeholder="Enter password" required>
                 <span id = "blankpass" style="color:red"> </span>
              </div>
             <!--  <div class="text"><a href="#">Forgot password?</a></div>  --> 
              <div class="button input-box">
                <input type="button" value="Login" onClick="validateForm()" >
              </div>
              <div class="text sign-up-text">Don't have an account? <label for="flip"><a href="/registrationPage">Registration</a></label></div>
            </div>
        </form>
      </div>
        
    </div>
    </div>
    
    
    </section>
 </div>  
         



 

        
        
       
           
    </body>
        



</html>