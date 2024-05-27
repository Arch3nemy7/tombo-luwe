<div class="wait overlay">
        <div class="loader"></div>
    </div>
    <style>
        .input-borders{
            border-radius:30px;
        }
    </style>
    <!-- row -->
    
    <div class="container-fluid">

        <form id="signup_form" onsubmit="return false" class="login100-form">
            <div class="billing-details jumbotron">
                <div class="section-title">
                    <h2 class="login100-form-title p-b-40" >Register Here</h2>
                </div>
                <div class="form-group ">

                    <input class="input form-control input-borders" type="text" name="f_name" id="f_name" placeholder="First Name">
                </div>
                <div class="form-group">

                    <input class="input form-control input-borders" type="text" name="l_name" id="l_name" placeholder="Last Name">
                </div>
                <div class="form-group ">
                    <label style="margin-left: 5px;">Date Of Birth</label>
                    <input class="input form-control input-borders" type="date" name="dob" id="dob" placeholder="Date Of Birth">
                </div>

                <div class="form-group">
                    <select name="gender" class="form-control input-borders">
                        <option>Gender</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Prefer Not To Specify">Prefer Not To Specify</option>
                    </select>
                </div>

                <div class="form-group">
                    <input class="input form-control input-borders" type="email" name="email"  placeholder="Email">
                </div>
                
                <div class="form-group">
                    <input class="input form-control input-borders" type="number" name="mobile" id="mobile" placeholder="Mobile Number">
                </div>
                <div class="form-group">
                    <input class="input form-control input-borders" type="text" name="address1" id="address1" placeholder="Address">
                </div>
                <div class="form-group">
                    <input class="input form-control input-borders" type="text" name="address2" id="address2" placeholder="City">
                </div>

                <div class="form-group">
                    <input class="input form-control input-borders" type="text" name="postalcode" id="postalcode" placeholder="Postal Code">
                </div>

                <div class="form-group">
                    <input class="input form-control input-borders" type="text" name="country" id="country" placeholder="Country">
                </div>

                <div class="form-group">
                    <input class="input form-control input-borders" type="password" name="password" id="password" placeholder="Password">
                </div>
                <div class="form-group">
                    <input class="input form-control input-borders" type="password" name="repassword" id="repassword" placeholder="Confirm Password">
                </div>
                
                <div style="form-group">
                 <input class="primary-btn btn-block"  value="Sign Up" type="submit" name="signup_button">
             </div>
             <hr>
             <center>
                <h4>Already Registered?</h4><br>
                <button onclick="location.href='index.php'" class="btn btn-success">Login</button>
            </center>
        </form>
        <div class="login-marg">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8" id="signup_msg">
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
</div> 