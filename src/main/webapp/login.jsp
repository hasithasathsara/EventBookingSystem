<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - EventHorizon</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700&display=swap');
        * { font-family: 'Plus Jakarta Sans', sans-serif; }

        .image-side {

            background: linear-gradient(135deg, rgba(99, 102, 241, 0.8) 0%, rgba(168, 85, 247, 0.8) 100%),
            url('images/EventHorizonLogingPage.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center bg-slate-50 p-6">

<div class="max-w-6xl w-full min-h-[700px] grid md:grid-cols-2 bg-white rounded-[40px] overflow-hidden shadow-2xl">

    <div class="hidden md:flex image-side p-16 flex-col justify-between text-white relative">
        <div class="relative z-10">
            <h1 class="text-3xl font-bold tracking-tight italic">EventHorizon</h1>
        </div>
        <div class="relative z-10">
            <h2 class="text-5xl font-extrabold leading-tight mb-4">Book the Moment <br>Experience the Event</h2>
            <p class="text-indigo-100 text-lg">The world's most advanced event management platform.</p>
        </div>
    </div>

    <div class="p-8 md:p-20 flex flex-col justify-center">
        <div class="mb-10 text-center md:text-left">
            <h3 class="text-4xl font-extrabold text-slate-900 mb-2">Welcome Back</h3>
            <p class="text-slate-500">Sign in to your account.</p>
        </div>

        <% if(request.getAttribute("errorMessage") != null) { %>
        <div class="mb-6 p-4 bg-red-50 border-l-4 border-red-500 text-red-700 text-sm">
            ⚠️ <%= request.getAttribute("errorMessage") %>
        </div>
        <% } %>

        <form action="LoginServlet" method="POST" class="space-y-6">
            <div>
                <label class="block text-sm font-bold text-slate-700 mb-2 ml-1">Email Address</label>
                <input type="email" name="userEmail" required
                       class="w-full px-6 py-4 bg-slate-50 border border-slate-200 rounded-2xl focus:ring-2 focus:ring-indigo-500 outline-none transition-all"
                       placeholder="name@company.com">
            </div>

            <div>
                <div class="flex justify-between mb-2 ml-1">
                    <label class="block text-sm font-bold text-slate-700">Password</label>
                    <a href="#" class="text-xs font-bold text-indigo-600 hover:underline">Forgot?</a>
                </div>
                <div class="relative">
                    <input type="password" name="userPassword" id="userPassword" required
                           class="w-full px-6 py-4 bg-slate-50 border border-slate-200 rounded-2xl focus:ring-2 focus:ring-indigo-500 outline-none transition-all"
                           placeholder="••••••••">
                    <button type="button" onclick="togglePassword()"
                            class="absolute right-5 top-1/2 -translate-y-1/2 opacity-40 hover:opacity-100 transition">
                        <img id="eyeIcon" src="images/show.png" alt="Toggle" class="w-5 h-5">
                    </button>
                </div>
            </div>

            <button type="submit" class="w-full py-4 bg-slate-900 text-white rounded-2xl font-bold text-xl hover:bg-slate-800 transform transition active:scale-[0.98] shadow-xl">
                Sign In
            </button>
        </form>

        <p class="mt-10 text-center text-slate-600 text-sm">
            Don't have an account?
            <a href="signup.jsp" class="font-bold text-indigo-600 hover:underline">Join free</a>
        </p>
    </div>
</div>

<script>
    function togglePassword() {
        const input = document.getElementById('userPassword');
        const icon = document.getElementById('eyeIcon');
        if (input.type === "password") {
            input.type = "text";
            icon.src = "images/hide.png";
        } else {
            input.type = "password";
            icon.src = "images/show.png";
        }
    }
</script>
</body>
</html>