$(document).ready(function() {
    function checkUsername() {
        var username = $('#username').val();
        if (username.length > 0) {
            $.ajax({
                url: '/tmstrial/checkUsername',
                type: 'GET',
                data: { username: username },
                success: function(response) {
                    
                    //var jsonResponse = JSON.parse(response);
                    if (jsonResponse.available) {
                        $('#usernameError').text('Username is available').css('color', 'green');
                    } else {
                        $('#usernameError').text('Username is not available').css('color', 'red');
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Error checking username:', error);
                }
            });
        } else {
            $('#usernameError').text('');
        }
    }

    $('#username').on('input', checkUsername);
    $('#username').on('blur', checkUsername);

    document.getElementById('registerForm').addEventListener('submit', function(event) {
        var firstName = document.getElementById('firstName').value;
        var lastName = document.getElementById('lastName').value;
        var username = document.getElementById('username').value;
        var email = document.getElementById('email').value;
        var phone = document.getElementById('phone').value;
        var password = document.getElementById('password').value;

        var commonError = document.getElementById('commonError');
        var firstNameError = document.getElementById('firstNameError');
        var lastNameError = document.getElementById('lastNameError');
        var usernameError = document.getElementById('usernameError');
        var emailError = document.getElementById('emailError');
        var phoneError = document.getElementById('phoneError');
        var passwordError = document.getElementById('passwordError');

        // Clear previous error messages
        commonError.innerHTML = '';
        firstNameError.innerHTML = '';
        lastNameError.innerHTML = '';
        usernameError.innerHTML = '';
        emailError.innerHTML = '';
        phoneError.innerHTML = '';
        passwordError.innerHTML = '';

        var isValid = true;

        if (firstName === "" || username === "" || email === "" || phone === "" || password === "") {
            commonError.innerHTML = "Please fill out the form before submitting.";
            isValid = false;
        }

        var usernamePattern = /^[A-Za-z]+$/;
        if (username === "") {
            usernameError.innerHTML = "Please enter your User Id.";
            isValid = false;
        } else if (!usernamePattern.test(username)) {
            usernameError.innerHTML = "Username must contain only alphabets.";
            isValid = false;
        }

        var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (email === "") {
            emailError.innerHTML = "Please enter your Email Id.";
            isValid = false;
        } else if (!emailPattern.test(email)) {
            emailError.innerHTML = "Please enter a valid email address.";
            isValid = false;
        }

        var phonePattern = /^[6-9]\d{9}$/;
        if (phone === "") {
            phoneError.innerHTML = "Please enter your Phone Number.";
            isValid = false;
        } else if (!phonePattern.test(phone)) {
            phoneError.innerHTML = "Please enter a valid Indian phone number.";
            isValid = false;
        }

        if (password === "") {
            passwordError.innerHTML = "Please enter your Password.";
            isValid = false;
        } else {
            if (password.length < 8) {
                passwordError.innerHTML = "Password must be at least 8 characters long.";
                isValid = false;
            }
            if (!/[a-z]/.test(password)) {
                passwordError.innerHTML += " Password must include at least one lowercase letter.";
                isValid = false;
            }
            if (!/[A-Z]/.test(password)) {
                passwordError.innerHTML += " Password must include at least one uppercase letter.";
                isValid = false;
            }
            if (!/[0-9]/.test(password)) {
                passwordError.innerHTML += " Password must include at least one number.";
                isValid = false;
            }
            if (!/[!@#$%^&*(),.?":{}|<>]/.test(password)) {
                passwordError.innerHTML += " Password must include at least one special character.";
                isValid = false;
            }
        }

        if (!isValid) {
            event.preventDefault();
        }
    });
});
