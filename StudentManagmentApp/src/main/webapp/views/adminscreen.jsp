<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management System</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background: linear-gradient(135deg, #667eea, #764ba2);
    min-height: 100vh;
}

.navbar-custom {
    background: linear-gradient(to right, #ff9966, #ff5e62);
}

.enroll {
    background: rgba(255, 255, 255, 0.15);
    backdrop-filter: blur(10px);
    border-radius: 20px;
}

.view {
    background: #f8f9fa;
    border-radius: 15px;
}

.heading {
    font-weight: bold;
    color: #2c3e50;
}

.btn-custom {
    background: linear-gradient(to right, #36d1dc, #5b86e5);
    color: white;
    border: none;
}

.btn-custom:hover {
    transform: scale(1.05);
    transition: 0.3s;
}
</style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-custom px-4 shadow">
    <img src="images/logo.png" width="90">

    <ul class="nav nav-pills ms-auto">
        <li class="nav-item">
            <button class="nav-link active" data-bs-toggle="pill" data-bs-target="#registerTab">
                Register Student
            </button>
        </li>
        <li class="nav-item">
            <button class="nav-link" data-bs-toggle="pill" data-bs-target="#viewTab">
                Student Details
            </button>
        </li>
        <li class="nav-item ms-3">
            <button class="btn btn-outline-dark">Logout</button>
        </li>
    </ul>
</nav>

<!-- TAB CONTENT -->
<div class="tab-content container my-4">

    <!-- REGISTER STUDENT -->
    <div class="tab-pane fade show active" id="registerTab">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card enroll p-4 shadow">
                    <h3 class="text-center heading mb-4">🎓 Student Registration</h3>

                    <form action="enroll_student" method="post">
                        <div class="row g-3">

                            <div class="col-md-6">
                                <label>Full Name</label>
                                <input type="text" class="form-control" name="studentFullName" required>
                            </div>

                            <div class="col-md-6">
                                <label>Email</label>
                                <input type="email" class="form-control" name="studentEmail" required>
                            </div>

                            <div class="col-md-4">
                                <label>Age</label>
                                <input type="number" class="form-control" name="studentAge">
                            </div>

                            <div class="col-md-8">
                                <label>College Name</label>
                                <input type="text" class="form-control" name="studentCollegeName">
                            </div>

                            <div class="col-md-6">
                                <label>Fees Paid</label>
                                <input type="number" class="form-control" name="feesPaid">
                            </div>

                            <div class="col-md-6">
                                <label>Course</label><br>
                                <input type="radio" name="studentCourse" value="Java" checked> Java
                                <input type="radio" name="studentCourse" value="Python" class="ms-3"> Python
                                <input type="radio" name="studentCourse" value="Testing" class="ms-3"> Testing
                            </div>

                            <div class="col-md-6">
                                <label>Batch Mode</label>
                                <select class="form-select" name="batchMode">
                                    <option>Online</option>
                                    <option>Offline</option>
                                </select>
                            </div>

                            <div class="col-md-6">
                                <label>Batch Number</label>
                                <select class="form-select" name="batchNumber">
                                    <option>FDJ-160</option>
                                    <option>REG-160</option>
                                    <option>FDJ-161</option>
                                    <option>REG-161</option>
                                </select>
                            </div>
                        </div>

                        <div class="text-center mt-4">
                            <button class="btn btn-custom btn-lg px-5">Register Student</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- VIEW STUDENTS -->
    <div class="tab-pane fade" id="viewTab">
        <div class="view p-4 shadow">

            <h3 class="text-center mb-3">📋 Student Details</h3>

            <form action="search" class="text-center mb-3">
                <select class="form-select d-inline w-25" name="batchNumber">
                    <option>Select Batch</option>
                    <option>FDJ-160</option>
                    <option>REG-160</option>
                    <option>FDJ-161</option>
                </select>
                <button class="btn btn-outline-primary ms-2">Search</button>
            </form>

            <table class="table table-hover table-bordered text-center">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Course</th>
                        <th>Batch</th>
                        <th>Mode</th>
                        <th>Fees</th>
                        <th>Actions</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${data}" var="s">
                        <tr>
                            <td>${s.studentId}</td>
                            <td>${s.studentFullName}</td>
                            <td>${s.studentEmail}</td>
                            <td>${s.studentCourse}</td>
                            <td>${s.batchNumber}</td>
                            <td>${s.batchMode}</td>
                            <td>₹ ${s.feesPaid}</td>
                            <td>
                                <button class="btn btn-success btn-sm">Pay Fees</button>
                                <button class="btn btn-primary btn-sm">Shift Batch</button>
                                <a href="delete?studentId=${s.studentId}" 
                                   class="btn btn-danger btn-sm">Remove</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <h6 class="text-danger text-center">${message}</h6>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
