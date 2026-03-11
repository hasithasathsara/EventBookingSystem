<%@ page import="java.util.List" %>
<%@ page import="model.AdminUser" %>
<%@ page import="dao.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Fetch all admins using the DAO method we just created
    UserDAO dao = new UserDAO();
    List<AdminUser> admins = dao.getAllAdmins();
%>
<html>
<head>
    <title>Admin Management | EventHorizon</title>
    <style>
        /* Premium Glassmorphism Design */
        body {
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            color: white;
            font-family: 'Poppins', sans-serif;
            padding: 40px;
        }
        .glass-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th {
            text-align: left;
            color: #94a3b8;
            padding: 15px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        td {
            padding: 15px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }
        /* Permission Badges */
        .badge {
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }
        .badge-green { background: rgba(34, 197, 94, 0.2); color: #4ade80; }
        .badge-red { background: rgba(239, 68, 68, 0.2); color: #f87171; }

        .action-btn {
            padding: 8px 15px;
            border-radius: 10px;
            text-decoration: none;
            color: white;
            font-size: 14px;
            transition: 0.3s;
        }
        .edit-btn { background: #6366f1; }
        .delete-btn { background: #ef4444; }
    </style>
</head>
<body>
<div class="glass-card">
    <h2>System Admin Management</h2>
    <p>Manage sub-admin roles and their specific access permissions.</p>

    <table>
        <thead>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Manage Events</th>
            <th>Approve Bookings</th>
            <th>Add Admins</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <% for(AdminUser admin : admins) { %>
        <tr>
            <td><%= admin.getName() %></td>
            <td><%= admin.getEmail() %></td>
            <td>
                        <span class="badge <%= admin.isCanManageEvents() ? "badge-green" : "badge-red" %>">
                            <%= admin.isCanManageEvents() ? "YES" : "NO" %>
                        </span>
            </td>
            <td>
                        <span class="badge <%= admin.isCanApproveBookings() ? "badge-green" : "badge-red" %>">
                            <%= admin.isCanApproveBookings() ? "YES" : "NO" %>
                        </span>
            </td>
            <td>
                        <span class="badge <%= admin.isCanAddAdmins() ? "badge-green" : "badge-red" %>">
                            <%= admin.isCanAddAdmins() ? "YES" : "NO" %>
                        </span>
            </td>
            <td>
                <a href="editAdmin.jsp?id=<%= admin.getId() %>" class="action-btn edit-btn">Edit</a>
                <a href="DeleteAdminServlet?id=<%= admin.getId() %>" class="action-btn delete-btn">Remove</a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>