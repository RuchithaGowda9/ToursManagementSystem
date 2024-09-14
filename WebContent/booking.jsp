<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Your Tour</title>
<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
    padding-top: 56px; /* Adjust for fixed navbar */
}

/* Adjust navbar styling to match the login page */
.navbar-custom {
    background-color: #0047AB; /* Background color matching the login page */
    height: 70px; /* Height to match the login page */
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.navbar-brand img {
    height: 60px; /* Height to match the logo size in the login page */
}

.navbar-brand.mx-auto {
    color: #ffffff; /* Text color for the title */
    background-color: #0047AB; /* Background color for the title */
    border-radius: 0; /* No rounded corners */
}

.navbar-toggler {
    border-color: transparent; /* Clean look for the toggler button */
}

.navbar-nav .nav-link {
    color: #ffffff; /* Text color for the links */
    background-color: #0047AB; /* Background color for the links */
    border-radius: 5px; /* Rounded corners for the links */
    padding: 8px 16px; /* Padding for better appearance */
    transition: background-color 0.3s; /* Smooth transition effect */
}

.navbar-nav .nav-link:hover {
    color: #ffffff; /* Text color on hover */
    background-color: #f96714; /* Background color on hover */
}

.dropdown-menu {
    background-color: #0047AB; /* Match dropdown background color with navbar */
    border: none; /* Remove border from dropdown */
    border-radius: 5px; /* Rounded corners for dropdown */
    padding: 0; /* Remove padding from dropdown */
}

.dropdown-item {
    color: #ffffff; /* Text color for dropdown items */
}

.dropdown-item:hover {
    background-color: #f96714; /* Background color on hover */
    color: #ffffff; /* Text color on hover */
}

.btn-custom {
    background-color: #f96714; /* Background color matching the login button */
    color: #fff; /* Text color */
    border: none; /* Remove any border */
    border-radius: 0.25rem; /* Border radius for consistent button shape */
    padding: 0.375rem 0.75rem; /* Padding for better appearance */
    font-size: 1rem; /* Font size */
    font-weight: 400; /* Font weight */
    line-height: 1.5; /* Line height */
    transition: background-color 0.15s ease-in-out; /* Smooth transition for hover effect */
}

.btn-custom:hover {
    background-color: #f96714; /* Hover background color matching the login button */
    color: #fff; /* Text color on hover */
    text-decoration: none; /* Remove underline on hover */
}


.form-container {
    max-width: 600px;
    margin: 20px auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #f8f9fa;
}

.footer {
    background-color: #343a40;
    color: #fff;
    padding: 20px 0;
    text-align: center;
}

.payment-details {
    display: none;
}

.required:after {
    content: "*";
    color: red;
    margin-left: 5px;
}

.error-message {
    color: red;
    font-size: 0.875em;
    display: none;
}

.price-info {
    font-weight: bold;
}
</style>
</head>
<body>
    <header>
        <nav
            class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
            <a class="navbar-brand" href="userDashboard.jsp"> <img
                src="resources/images/logo.png" alt="Urban Adventure Logo"
                height="50">
            </a> <a class="navbar-brand mx-auto" href="userDashboard.jsp">Urban
                Adventure</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link btn btn-custom mx-2"
                        href="userDashboard.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link btn btn-custom mx-2"
                        href="userProfile.jsp">User Profile</a></li>
                </ul>
            </div>
        </nav>
    </header>

    <main role="main">
    <div class="container mt-5">
        <h1>
            <c:choose>
                <c:when test="${not empty user}">
                    <p class="mt-3">${user.firstName}, continue with your booking</p>
                </c:when>
                <c:otherwise>
                    <p class="mt-3">User not found. Please log in again.</p>
                </c:otherwise>
            </c:choose>
        </h1>
        <c:choose>
            <c:when test="${not empty tour}">
                <div class="form-container">
                    <form action="${pageContext.request.contextPath}/processbooking"
                        method="post" onsubmit="return validateForm()">
                        <input type="hidden" name="tourId" value="${tour.tourId}" /> <input
                            type="hidden" name="userId" value="${user.userId}" /> <input
                            type="hidden" id="tourPrice" value="${tour.price}" /> <input
                            type="hidden" id="tourAvailability"
                            value="${tour.availability}" />
                            <input type="hidden" name="totalPrice" id="totalPriceHidden" />

                        <div class="form-group">
                            <label for="numPeople" class="required">Number of People:</label>
                            <input type="number" id="numPeople" name="numPeople"
                                class="form-control" min="1" oninput="updatePrice()" />
                            <div id="numPeopleError" class="error-message">Please enter a valid number. The number of people cannot be greater than the available spots.</div>
                        </div>

                        <div class="form-group">
                            <label for="tourDate" class="required">Select Tour Date
                                (September only):</label> <input type="date" id="tourDate"
                                name="tourDate" class="form-control" min="2024-09-01"
                                max="2024-09-30" />
                            <div id="tourDateError" class="error-message">Please select a valid date within September 2024.</div>
                        </div>

                        <div class="form-group">
                            <label for="paymentMethod" class="required">Payment
                                Method:</label> <select id="paymentMethod" name="paymentMethod"
                                class="form-control" onchange="togglePaymentDetails()">
                                <option value="" disabled selected>Select Payment Method</option>
                                <option value="credit_card">Credit Card</option>
                                <option value="debit_card">Debit Card</option>
                                <option value="paypal">PayPal</option>
                                <!-- Add other payment methods if needed -->
                            </select>
                            <div id="paymentMethodError" class="error-message">Please select a payment method.</div>
                        </div>

                        <div id="paymentDetails" class="payment-details">
                            <div class="form-group">
                                <label for="cardNumber" class="required">Card Number:</label> <input
                                    type="text" id="cardNumber" name="cardNumber"
                                    class="form-control" placeholder="Enter card number" />
                                <div id="cardNumberError" class="error-message">Please enter a valid card number (13-19 digits).</div>
                            </div>
                            <div class="form-group">
                                <label for="cardExpiry" class="required">Expiry Date:</label> <input
                                    type="text" id="cardExpiry" name="cardExpiry"
                                    class="form-control" placeholder="MM/YY" />
                                <div id="cardExpiryError" class="error-message">Please enter a valid expiry date (MM/YY) and ensure it is not in the past.</div>
                            </div>
                            <div class="form-group">
                                <label for="cardCVC" class="required">CVC:</label> <input
                                    type="password" id="cardCVC" name="cardCVC" class="form-control"
                                    placeholder="CVC" />
                                <div id="cardCVCError" class="error-message">Please enter a valid CVC code (3 or 4 digits).</div>
                            </div>
                        </div>

                        <div class="price-info" id="priceInfo">
                             <span id="totalPrice"></span>
                        </div>

                        <button type="submit" class="btn btn-custom btn-block">Proceed
                            to Payment</button>
                    </form>
                </div>

            </c:when>
            <c:otherwise>
                               <p>Tour details not found. Please check the tour information or contact support.</p>
            </c:otherwise>
        </c:choose>
    </div>
    </main>

    <footer class="footer">
        <p>© 2024 Urban Adventure. All rights reserved.</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var today = new Date().toISOString().split('T')[0]; // Get current date in YYYY-MM-DD format
            document.getElementById('tourDate').setAttribute('min', today);
        });

        function togglePaymentDetails() {
            var paymentMethod = document.getElementById("paymentMethod").value;
            var paymentDetails = document.getElementById("paymentDetails");
            if (paymentMethod === "credit_card" || paymentMethod === "debit_card") {
                paymentDetails.style.display = "block";
            } else {
                paymentDetails.style.display = "none";
            }
        }

        function validateForm() {
            var isValid = true;

            var numPeople = document.getElementById("numPeople");
            var tourDate = document.getElementById("tourDate");
            var paymentMethod = document.getElementById("paymentMethod");

            var tourAvailability = parseInt(document.getElementById("tourAvailability").value) || 0;

            // Clear previous error messages
            document.querySelectorAll(".error-message").forEach(function(el) {
                el.style.display = "none";
            });

            if (numPeople.value.trim() === "" || numPeople.value <= 0) {
                document.getElementById("numPeopleError").innerText = "Please enter a valid number of people. It must be at least 1.";
                document.getElementById("numPeopleError").style.display = "block";
                isValid = false;
            } else if (parseInt(numPeople.value) > tourAvailability) {
                document.getElementById("numPeopleError").innerText = "The number of people exceeds the available spots. Please reduce the number.";
                document.getElementById("numPeopleError").style.display = "block";
                isValid = false;
            }

            if (tourDate.value.trim() === "" || !isValidDate(tourDate.value)) {
                document.getElementById("tourDateError").innerText = "Please select a valid date within September 2024.";
                document.getElementById("tourDateError").style.display = "block";
                isValid = false;
            }

            if (paymentMethod.value.trim() === "") {
                document.getElementById("paymentMethodError").innerText = "Please select a payment method.";
                document.getElementById("paymentMethodError").style.display = "block";
                isValid = false;
            } else if (paymentMethod.value === "credit_card" || paymentMethod.value === "debit_card") {
                var cardNumber = document.getElementById("cardNumber").value.trim();
                var cardExpiry = document.getElementById("cardExpiry").value.trim();
                var cardCVC = document.getElementById("cardCVC").value.trim();

                if (!validateCardNumber(cardNumber)) {
                    document.getElementById("cardNumberError").innerText = "Card number must be between 13 and 19 digits.";
                    document.getElementById("cardNumberError").style.display = "block";
                    isValid = false;
                }
                if (!validateExpiryDate(cardExpiry)) {
                    document.getElementById("cardExpiryError").innerText = "Enter a valid expiry date in MM/YY format and ensure it is not in the past.";
                    document.getElementById("cardExpiryError").style.display = "block";
                    isValid = false;
                }
                if (!validateCVC(cardCVC)) {
                    document.getElementById("cardCVCError").innerText = "CVC code should be 3 or 4 digits.";
                    document.getElementById("cardCVCError").style.display = "block";
                    isValid = false;
                }
            }

            return isValid;
        }

        function validateCardNumber(cardNumber) {
            cardNumber = cardNumber.replace(/[\s\-]/g, '');
            var regex = /^\d{13,19}$/;
            return regex.test(cardNumber);
        }

        function validateExpiryDate(expiryDate) {
            var regex = /^(0[1-9]|1[0-2])\/([0-9]{2})$/;
            if (!regex.test(expiryDate)) {
                return false;
            }

            var today = new Date();
            var [month, year] = expiryDate.split('/');
            var expiryMonth = parseInt(month, 10);
            var expiryYear = parseInt("20" + year, 10); 

            var expiryDateObj = new Date(expiryYear, expiryMonth, 0); 

            return expiryDateObj >= today;
        }

        function validateCVC(cvc) {
            var regex = /^\d{3,4}$/;
            return regex.test(cvc);
        }

        function updatePrice() {
            var numPeople = parseInt(document.getElementById("numPeople").value) || 0;
            var tourPrice = parseFloat(document.getElementById("tourPrice").value) || 0;
            var totalPrice = numPeople * tourPrice;
            document.getElementById("totalPrice").innerText = "Total Price: Rs "
                    + totalPrice.toFixed(2);
            document.getElementById("totalPriceHidden").value = "Rs " + totalPrice.toFixed(2);
        }

        function isValidDate(dateString) {
            var regex = /^(2024-09-([0-2][0-9]|3[01]))$/;
            return regex.test(dateString);
        }
    </script>
</body>
</html>
               
