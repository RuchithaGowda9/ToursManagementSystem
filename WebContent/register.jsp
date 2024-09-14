<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register - Urban Adventure</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="resources/css/styles.css">
<link rel="stylesheet" type="text/css" href="resources/css/common-styles.css">
<!-- Add Font Awesome for eye icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style type="text/css">
body {
	margin: 0;
	font-family: Arial, sans-serif;
}

.navbar-custom {
	background-color: #0047AB; /* Navbar Background Color */
	height: 70px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.navbar-brand img {
	height: 60px;
	width: auto;
}

.navbar-brand.mx-auto {
	color: #ffffff; /* Text color for the title */
	background-color: #0047AB; /* Background color for the title */
	border-radius: 0; /* No curved edges for the title */
}

.navbar-toggler {
	border-color: transparent;
	/* Remove border from toggler for a cleaner look */
}

.navbar-nav .nav-link, .navbar-nav .dropdown-item {
	color: #ffffff; /* Text color */
	background-color: #0047AB; /* Button background color */
	border-radius: 5px; /* Curved edges */
	padding: 8px 16px; /* Padding for better appearance */
	transition: background-color 0.3s;
	/* Smooth transition for hover effect */
}

.navbar-nav .nav-link:hover, .navbar-nav .dropdown-item:hover {
	color: #ffffff; /* Text color on hover */
	background-color: #f96714; /* Button background color on hover */
}

.dropdown-menu {
	background-color: #0047AB;
	/* Match dropdown background to navbar background */
	border: none; /* Remove border from dropdown */
	border-radius: 5px; /* Curved edges for dropdown */
	padding: 0; /* Remove padding */
}

.dropdown-item {
	color: #ffffff; /* Text color for dropdown items */
}

.dropdown-item:hover {
	background-color: #f96714;
	/* Background color on hover for dropdown items */
	color: #ffffff; /* Text color on hover for dropdown items */
}

.footer {
	background-color: #343a40;
	color: #ffffff;
	text-align: center;
	padding: 1rem;
	position: relative;
	bottom: 0;
	width: 100%;
}

/* Adjust footer for full height layout */
html, body {
	height: 100%;
}

body {
	display: flex;
	flex-direction: column;
}

main {
	flex: 1;
}

/* Error message styling */
.error-message {
	color: #dc3545; /* Red color for error messages */
	margin-top: 10px;
	font-size: 0.875rem;
}

/* Styling for mandatory fields */
.required:after {
	content: " *";
	color: #dc3545; /* Red color for asterisks */
}

/* Register card styles */
.register-card {
	background-color: rgba(249, 103, 20, 0.1); /* Very light orange tint */
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	padding: 20px;
	margin-bottom: 30px; /* Space between register card and footer */
}

/* Password field with checkbox */
.password-container {
	margin-top: 10px;
}

.password-container input {
	padding-right: 40px; /* Add space for the checkbox */
}

.password-container label {
	display: block;
	margin-bottom: 5px; /* Add space between label and input */
}

.show-password-container {
	margin-top: 5px;
}

.show-password-container input {
	cursor: pointer;
}

/* Aadhar/PAN number styling */
.id-number-container {
	margin-top: 10px;
}

.id-number-container input {
	width: 100%;
}
</style>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
			<a class="navbar-brand" href="home.jsp"> <img
				src="resources/images/logo.png" alt="Urban Adventure Logo"></a> <a
				class="navbar-brand mx-auto" href="home.jsp">Urban Adventures</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="contactUs.jsp">Contact
							Us</a></li>
				</ul>
			</div>
		</nav>
	</header>
	<main class="container mt-4">
	<h2 class="text-center mb-4">Register</h2>
	<div class="row justify-content-center">
		<div class="col-md-8 col-lg-6">
			<div class="register-card">
				<form id="registerForm"
					action="<%=request.getContextPath()%>/user?action=register"
					method="post">
					<div class="form-group">
						<label for="firstName" class="required">First Name:</label> <input
							type="text" id="firstName" name="firstName" class="form-control"
							placeholder="Enter your first name">
						<div id="firstNameError" class="text-danger"></div>
					</div>
					<div class="form-group">
						<label for="lastName">Last Name:</label> <input type="text"
							id="lastName" name="lastName" class="form-control"
							placeholder="Enter your last name">
						<div id="lastNameError" class="text-danger"></div>
					</div>
					<div class="form-group">
						<label for="username" class="required">User Name:</label> <input
							type="text" id="username" name="username" class="form-control"
							placeholder="Choose a username">
						<div id="usernameError" class="text-danger"></div>
					</div>
					<div class="form-group">
						<label for="email" class="required">Email Id:</label> <input
							type="email" id="email" name="email" class="form-control"
							placeholder="Enter your email">
						<div id="emailError" class="text-danger"></div>
					</div>
					<div class="form-group">
						<label for="phone" class="required">Phone Number:</label> <input
							type="tel" id="phone" name="phone" class="form-control"
							placeholder="Enter your phone number">
						<div id="phoneError" class="text-danger"></div>
					</div>
					
					<!-- Dropdown for Aadhar/PAN selection -->
					<div class="form-group">
						<label for="idType" class="required">ID Type:</label>
						<select id="idType" name="idType" class="form-control" onchange="toggleIdNumberField()">
							<option value="" disabled selected>Select ID Type</option>
							<option value="aadhar">Aadhar Number</option>
							<option value="pan">PAN Number</option>
						</select>
						<div id="idTypeError" class="text-danger"></div>
					</div>

					<!-- Input field for Aadhar/PAN number -->
					<div class="form-group id-number-container" id="idNumberContainer" style="display: none;">
						<label for="idNumber" class="required">ID Number:</label>
						<input type="text" id="idNumber" name="idNumber" class="form-control"
							placeholder="Enter your Aadhar or PAN number">
						<div id="idNumberError" class="text-danger"></div>
					</div>

					<div class="form-group password-container">
						<label for="password" class="required">Password:</label> <input
							type="password" id="password" name="password"
							class="form-control" placeholder="Choose a password">
						<div id="passwordError" class="text-danger"></div>
					</div>
					<div class="form-group show-password-container">
						<input type="checkbox" id="showPassword"> 
						<label for="showPassword">Show Password</label>
					</div>
					<button type="submit" class="btn btn-primary btn-block">Register</button>
					<div id="commonError" class="text-danger mt-3">
						<%=request.getAttribute("NOTIFICATION") != null ? request.getAttribute("NOTIFICATION") : ""%>
					</div>
				</form>
				<p class="mt-3 text-center">
					Already have an account? <a href="login.jsp">Login</a>
				</p>
			</div>
		</div>
	</div>
	</main>
	<footer class="footer">
		<p>© 2024 Urban Adventure. All rights reserved.</p>
	</footer>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function() {
			// Toggle ID number input based on ID type selection
			function toggleIdNumberField() {
				var idType = $('#idType').val();
				if (idType) {
					$('#idNumberContainer').show();
				} else {
					$('#idNumberContainer').hide();
				}
			}

			// Function to validate Aadhar number
			function validateAadhar(aadhar) {
				var aadharPattern = /^\d{12}$/;
				if (!aadharPattern.test(aadhar)) {
					return 'Aadhar Number must be exactly 12 digits.';
				}
				return '';
			}

			// Function to validate PAN number
			function validatePAN(pan) {
				var panPattern = /^[A-Z]{5}[0-9]{4}[A-Z]{1}$/;
				if (!panPattern.test(pan)) {
					return 'PAN Number must be in the format: XXXXX9999X (5 letters, 4 digits, 1 letter).';
				}
				return '';
			}

			// Function to validate the ID number based on selected ID type
			function validateIdNumber() {
				var idType = $('#idType').val();
				var idNumber = $('#idNumber').val();
				var idNumberError = '';

				if (idType === 'aadhar') {
					idNumberError = validateAadhar(idNumber);
				} else if (idType === 'pan') {
					idNumberError = validatePAN(idNumber);
				}

				$('#idNumberError').text(idNumberError);
			}

			// Function to validate username
			function validateUsername() {
				var username = $('#username').val();
				var usernamePattern = /^[a-zA-Z0-9._]+$/;
				if (username.length > 0) {
					if (!usernamePattern.test(username)) {
						$('#usernameError').text('Username can only contain letters, numbers, periods, and underscores.').css('color', 'red');
					} else {
						$.ajax({
							url: '/tmstrial/checkUsername',
							type: 'GET',
							data: {
								username: username
							},
							success: function(response) {
								try {
									var jsonResponse = JSON.parse(response);
									if (jsonResponse.available) {
										$('#usernameError').text('Username is available').css('color', 'green');
									} else {
										$('#usernameError').text('Username is already taken').css('color', 'red');
									}
								} catch (e) {
									console.error('Error parsing JSON response:', e);
								}
							},
							error: function(xhr, status, error) {
								console.error('Error checking username:', error);
							}
						});
					}
				} else {
					$('#usernameError').text('');
				}
			}

			// Function to validate first name
			function validateFirstName() {
				var firstName = $('#firstName').val();
				var firstNamePattern = /^[a-zA-Z]+$/;
				if (firstName.trim() === "") {
					$('#firstNameError').text('First Name is required.');
				} else if (!firstNamePattern.test(firstName)) {
					$('#firstNameError').text('First Name can only contain alphabets.');
				} else if (firstName.length < 3) {
					$('#firstNameError').text('First Name must contain at least 3 letters.');
				} else {
					$('#firstNameError').text('');
				}
			}

			// Function to validate last name
			function validateLastName() {
				var lastName = $('#lastName').val();
				var lastNamePattern = /^[a-zA-Z]*$/;
				if (lastName.trim() !== "" && !lastNamePattern.test(lastName)) {
					$('#lastNameError').text('Last Name can only contain letters.');
				} else {
					$('#lastNameError').text('');
				}
			}

			// Function to validate email
			function validateEmail() {
				var email = $('#email').val();
				var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
				if (email.trim() === "") {
					$('#emailError').text('Email Id is required.');
				} else if (!emailPattern.test(email)) {
					$('#emailError').text('Please enter a valid email address.');
				} else {
					$('#emailError').text('');
				}
			}

			// Function to validate phone number
			function validatePhone() {
				var phone = $('#phone').val();
				var phonePattern = /^[6-9]\d{9}$/;
				if (phone.trim() === "") {
					$('#phoneError').text('Phone Number is required.');
				} else if (!phonePattern.test(phone)) {
					$('#phoneError').text('Please enter a valid Indian phone number.');
				} else {
					$('#phoneError').text('');
				}
			}

			// Function to validate password
			function validatePassword() {
				var password = $('#password').val();
				var passwordError = '';
				if (password.trim() === "") {
					passwordError = 'Password is required.';
				} else {
					if (password.length < 8) {
						passwordError += ' Password must be at least 8 characters long.';
					}
					if (!/[a-z]/.test(password)) {
						passwordError += ' Password must include at least one lowercase letter.';
					}
					if (!/[A-Z]/.test(password)) {
						passwordError += ' Password must include at least one uppercase letter.';
					}
					if (!/[0-9]/.test(password)) {
						passwordError += ' Password must include at least one number.';
					}
					if (!/[!@#$%^&*(),.?":{}|<>]/.test(password)) {
						passwordError += ' Password must include at least one special character.';
					}
					if (password === $('#username').val()) {
						passwordError += ' Password cannot be the same as Username.';
					}
					if (password === $('#firstName').val()) {
						passwordError += ' Password cannot be the same as First Name.';
					}
				}
				$('#passwordError').text(passwordError);
			}

			// Function to toggle password visibility
			$('#showPassword').on('change', function() {
				var passwordField = $('#password');
				var type = $(this).is(':checked') ? 'text' : 'password';
				passwordField.attr('type', type);
			});

			// Attach real-time validation to fields
			$('#username').on('input', function() {
				validateUsername();
			});

			$('#firstName').on('input', function() {
				validateFirstName();
			});

			$('#lastName').on('input', function() {
				validateLastName();
			});

			$('#email').on('input', function() {
				validateEmail();
			});

			$('#phone').on('input', function() {
				validatePhone();
			});

			$('#password').on('input', function() {
				validatePassword();
			});

			$('#idType').on('change', function() {
				toggleIdNumberField();
				validateIdNumber();
			});

			$('#idNumber').on('input', function() {
				validateIdNumber();
			});

			// Perform validation on form submit
			$('#registerForm').on('submit', function(event) {
				validateFirstName();
				validateLastName();
				validateUsername();
				validateEmail();
				validatePhone();
				validatePassword();
				validateIdNumber();

				var hasErrors = $('.text-danger').filter(function() {
					return $(this).text().trim() !== '';
				}).length > 0;

				if (hasErrors) {
					event.preventDefault();
				}
			});
		});
	</script>
</body>
</html>
