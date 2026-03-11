<%-- Import the base User class and AdminUser subclass to handle polymorphic data --%>
<%@ page import="model.User" %>
<%@ page import="model.AdminUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // 1. Get the logged-in user from the session as a 'User' type.
    // We use the base 'User' class here to avoid ClassCastException when an Admin logs in.
    User currentUser = (User) session.getAttribute("loggedInUser");

    // 2. Security Check: Redirect to login page if user is not logged in or doesn't have an admin role.
    if (currentUser == null || (!"main_admin".equals(currentUser.getRole()) && !"sub_admin".equals(currentUser.getRole()))) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Dashboard - EventHorizon</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap');
        * { font-family: 'Plus Jakarta Sans', sans-serif; }
    </style>
</head>
<body class="bg-slate-50 flex h-screen overflow-hidden">

<aside class="w-64 bg-slate-900 text-white flex flex-col">
    <div class="p-6">
        <h2 class="text-2xl font-bold italic text-indigo-400">EventHorizon.</h2>
        <p class="text-xs text-slate-400 mt-1">Admin Control Panel</p>
    </div>

    <nav class="flex-1 px-4 space-y-2 mt-4">
        <%-- Updated link to point back to the main dashboard --%>
        <a href="adminDashboard.jsp" class="block px-4 py-3 bg-indigo-600 rounded-xl font-semibold shadow-lg shadow-indigo-500/30">Dashboard Overview</a>
        <a href="#" class="block px-4 py-3 text-slate-300 hover:bg-slate-800 rounded-xl transition">Manage Events</a>
        <a href="#" class="block px-4 py-3 text-slate-300 hover:bg-slate-800 rounded-xl transition">All Bookings</a>

        <%-- This section is restricted to Main Admins only --%>
        <% if ("main_admin".equals(currentUser.getRole())) { %>
        <div class="pt-4 mt-4 border-t border-slate-700">
            <p class="px-4 text-xs font-bold text-slate-500 uppercase mb-2">Super Admin Only</p>
            <%-- Updated this link to point to our Premium User Management Table --%>
            <a href="userManagement.jsp" class="block px-4 py-3 text-slate-300 hover:bg-red-500/10 hover:text-red-400 rounded-xl transition">User Management</a>
            <a href="#" class="block px-4 py-3 text-slate-300 hover:bg-red-500/10 hover:text-red-400 rounded-xl transition">System Settings</a>
        </div>
        <% } %>
    </nav>

    <div class="p-4 border-t border-slate-800">
        <a href="login.jsp" class="block w-full text-center py-3 bg-slate-800 hover:bg-slate-700 rounded-xl text-sm font-bold text-white transition">Log Out</a>
    </div>
</aside>

<main class="flex-1 flex flex-col h-screen overflow-y-auto">
    <header class="bg-white border-b border-slate-200 px-8 py-5 flex justify-between items-center">
        <h1 class="text-2xl font-bold text-slate-800">Dashboard</h1>
        <div class="flex items-center gap-4">
            <div class="text-right">
                <%-- Using Encapsulation to access user data --%>
                <p class="text-sm font-bold text-slate-900"><%= currentUser.getName() %></p>
                <p class="text-xs font-bold text-indigo-600 uppercase"><%= currentUser.getRole().replace("_", " ") %></p>
            </div>
            <div class="w-11 h-11 bg-indigo-100 text-indigo-600 rounded-full flex items-center justify-center font-bold text-xl border-2 border-indigo-200">
                <%= currentUser.getName().substring(0,1).toUpperCase() %>
            </div>
        </div>
    </header>

    <div class="p-8">
        <%-- Statistics Grid --%>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
            <div class="bg-white p-6 rounded-2xl shadow-sm border border-slate-100 hover:shadow-md transition">
                <p class="text-sm font-bold text-slate-400 mb-1 uppercase tracking-wider">Total Users</p>
                <h3 class="text-4xl font-extrabold text-slate-800">1,248</h3>
            </div>
            <div class="bg-white p-6 rounded-2xl shadow-sm border border-slate-100 hover:shadow-md transition">
                <p class="text-sm font-bold text-slate-400 mb-1 uppercase tracking-wider">Active Events</p>
                <h3 class="text-4xl font-extrabold text-slate-800">42</h3>
            </div>
            <div class="bg-white p-6 rounded-2xl shadow-sm border border-slate-100 hover:shadow-md transition">
                <p class="text-sm font-bold text-slate-400 mb-1 uppercase tracking-wider">Pending Bookings</p>
                <h3 class="text-4xl font-extrabold text-slate-800">156</h3>
            </div>
        </div>

        <div class="bg-white p-10 rounded-3xl shadow-sm border border-slate-100 text-center py-20">
            <h2 class="text-2xl font-bold text-slate-800 mb-2">Welcome to the Command Center, <%= currentUser.getName() %>!</h2>
            <p class="text-slate-500 text-lg">Select an option from the sidebar to start managing the system.</p>
        </div>
    </div>
</main>
</body>
</html>