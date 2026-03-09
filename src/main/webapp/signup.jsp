<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account - EventHorizon</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap');
        * { font-family: 'Inter', sans-serif; }

        .pro-modal {
            background: white;
            border-radius: 24px;
            box-shadow: 0 25px 50px -12px rgb(0 0 0 / 0.25);
        }

        .pro-input {
            width: 100%;
            padding: 12px 16px;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            background: white;
            color: #0f172a;
            font-size: 15px;
            transition: all 0.2s;
        }

        .pro-input:focus {
            outline: none;
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.1);
        }

        .btn-primary {
            padding: 12px 24px;
            background: linear-gradient(135deg, #6366f1 0%, #4f46e5 100%);
            color: white;
            border-radius: 12px;
            font-weight: 600;
            border: none;
            cursor: pointer;
            transition: all 0.3s;
            box-shadow: 0 4px 6px -1px rgba(99, 102, 241, 0.2);
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px -5px rgba(99, 102, 241, 0.4);
        }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center bg-slate-50">

<div class="pro-modal w-full max-w-md p-8 relative">
    <div class="text-center mb-8">
        <h3 class="text-2xl font-bold text-slate-900 mb-2">Create Account</h3>
        <p class="text-slate-500">Join EventHorizon today</p>
    </div>

    <form action="RegisterServlet" method="POST" class="space-y-4" onsubmit="return validateForm()">

        <div>
            <label class="block text-sm font-medium text-slate-700 mb-2">Full Name</label>
            <input type="text" name="userName" required class="pro-input" placeholder="John Doe">
        </div>

        <div>
            <label class="block text-sm font-medium text-slate-700 mb-1">Phone Number</label>
            <input type="text" name="phone" required
                   oninput="validatePhone(this)"
                   class="w-full px-4 py-2 border border-slate-300 rounded-lg focus:outline-none focus:border-indigo-500 focus:ring-1 focus:ring-indigo-500"
                   placeholder="07XXXXXXXX">
        </div>

        <div>
            <label class="block text-sm font-medium text-slate-700 mb-2">Email Address</label>
            <input type="email" name="userEmail" required class="pro-input" placeholder="you@example.com">
        </div>


        <div class="relative">
            <label class="block text-sm font-medium text-slate-700 mb-2">Password</label>
            <div class="relative">
                <input type="password" name="userPassword" id="userPassword" required
                       oninput="validatePasswordMatch()"
                       class="pro-input pr-12" placeholder="••••••••">
                <button type="button" onclick="togglePassword('userPassword', 'eyeIcon1')"
                        class="absolute right-3 top-1/2 -translate-y-1/2 opacity-60 hover:opacity-100 transition focus:outline-none">
                    <img id="eyeIcon1" src="images/show.png" alt="Show" style="width: 20px; height: 20px;">
                </button>
            </div>
        </div>

        <div class="relative">
            <label class="block text-sm font-medium text-slate-700 mb-2">Confirm Password</label>
            <div class="relative">
                <input type="password" name="confirmPassword" id="confirmPassword" required
                       oninput="validatePasswordMatch()"
                       class="pro-input pr-12" placeholder="••••••••">
                <button type="button" onclick="togglePassword('confirmPassword', 'eyeIcon2')"
                        class="absolute right-3 top-1/2 -translate-y-1/2 opacity-60 hover:opacity-100 transition focus:outline-none">
                    <img id="eyeIcon2" src="images/show.png" alt="Show" style="width: 20px; height: 20px;">
                </button>
            </div>
        </div>

        <button type="submit" class="w-full btn-primary py-3 text-lg mt-4">Create Account</button>
    </form>

    <p class="mt-6 text-center text-sm text-slate-600">
        Already have an account?
        <a href="login.jsp" class="text-indigo-600 hover:underline font-semibold ml-1">Sign in</a>
    </p>
</div>

<script>

        // On-time Password Matching Logic
        function validatePasswordMatch() {
            const password = document.getElementById("userPassword");
            const confirmPassword = document.getElementById("confirmPassword");

            // check the password are same
            if (password.value !== confirmPassword.value) {
                confirmPassword.setCustomValidity("Passwords do not match! Please check again.");
            } else {
                confirmPassword.setCustomValidity(""); //remove the error (corrrect)
            }


            if (document.activeElement === confirmPassword) {
                confirmPassword.reportValidity();
            }
        }

        // Show/Hide Password Logic
        function togglePassword(inputId, iconId) {
            const input = document.getElementById(inputId);
            const icon = document.getElementById(iconId);

            if (input.type === "password") {
                input.type = "text";
                icon.src = "images/hide.png";
            } else {
                input.type = "password";
                icon.src = "images/show.png";
            }
        }

        // On-time Phone number validation Logic

        function validatePhone(input) {
        const phoneValue = input.value;
        const phonePattern = /^[0-9]{10}$/; // Only 10 digits allowed

        if (phoneValue === "") {
        input.setCustomValidity("Phone number is required.");
    } else if (!/^\d+$/.test(phoneValue)) {
        input.setCustomValidity("Please enter only numbers.");
    } else if (phoneValue.length !== 10) {
        input.setCustomValidity("Invalid Phone number enter a valid number ! ");
    } else {
        // This is the most important part - clear the error to allow submission
        input.setCustomValidity("");
    }

        // This will show the error bubble "on-time" if there is an error
        input.reportValidity();
    }

        // Your existing validateForm function for the final check
        function validateForm() {
        // ... (existing code)
    }

</script>
</body>
</html>