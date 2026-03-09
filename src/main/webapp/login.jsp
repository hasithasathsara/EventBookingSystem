<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Login - EventHorizon</title>
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
        <h3 class="text-2xl font-bold text-slate-900 mb-2">Welcome Back</h3>
        <p class="text-slate-500">Sign in to your customer account</p>
    </div>

    <form action="LoginServlet" method="POST" class="space-y-4">
        <div>
            <label class="block text-sm font-medium text-slate-700 mb-2">Email Address</label>
            <input type="email" name="userEmail" required class="pro-input" placeholder="you@example.com">
        </div>
        <div>
            <label class="block text-sm font-medium text-slate-700 mb-2">Password</label>
            <input type="password" name="userPassword" required class="pro-input" placeholder="••••••••">
        </div>
        <button type="submit" class="w-full btn-primary py-3 text-lg mt-4">Sign In</button>
    </form>

    <p class="mt-6 text-center text-sm text-slate-600">
        Don't have an account?
        <a href="signup.jsp" class="text-indigo-600 hover:underline font-semibold ml-1">Sign up</a>
    </p>
</div>

</body>
</html>