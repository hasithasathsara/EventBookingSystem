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
                   class="w-full px-4 py-2 border border-slate-300 rounded-lg focus:outline-none focus:border-indigo-500 focus:ring-1 focus:ring-indigo-500"
                   placeholder="07XXXXXXXX">
        </div>

        <div>
            <label class="block text-sm font-medium text-slate-700 mb-2">Email Address</label>
            <input type="email" name="userEmail" required class="pro-input" placeholder="you@example.com">
        </div>

        <div>
            <label class="block text-sm font-medium text-slate-700 mb-2">Password</label>
            <input type="password" name="userPassword" required class="pro-input" placeholder="••••••••">
        </div>

        <div>
            <label class="block text-sm font-medium text-slate-700 mb-2">Confirm Password</label>
            <input type="password" name="confirmPassword" required class="pro-input" placeholder="••••••••">
        </div>

        <button type="submit" class="w-full btn-primary py-3 text-lg mt-4">Create Account</button>
    </form>

    <p class="mt-6 text-center text-sm text-slate-600">
        Already have an account?
        <a href="login.jsp" class="text-indigo-600 hover:underline font-semibold ml-1">Sign in</a>
    </p>
</div>

<script>
    function validateForm() {
        // Get values from input fields
        var phone = document.getElementsByName("phone")[0].value;
        var password = document.getElementsByName("userPassword")[0].value;
        var confirmPassword = document.getElementsByName("confirmPassword")[0].value;

        // 1. Check if phone number is exactly 10 digits
        if (phone.length !== 10) {
            alert("Enter a valid Phone number !");
            return false;
        }

        // 2. Check if passwords match
        if (password !== confirmPassword) {
            alert("Passwords do not match ! Please check again.");
            return false;
        }

        return true; // All validations passed
    }
</script>
</body>
</html>