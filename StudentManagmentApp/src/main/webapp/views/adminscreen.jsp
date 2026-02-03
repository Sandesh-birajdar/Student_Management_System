<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background: linear-gradient(135deg, #667eea, #764ba2);
}

.navbar-custom {
    background: linear-gradient(to right, #ff9966, #ff5e62);
}

.enroll {
    background: rgba(255,255,255,0.15);
    backdrop-filter: blur(10px);
    border-radius: 20px;
}

.heading {
    font-family: 'Poppins', sans-serif;
    font-weight: bold;
    color: #2c3e50;
}

.form-control:focus {
    box-shadow: 0 0 8px rgba(102,126,234,0.6);
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

.view {
    background: linear-gradient(135deg, #fdfbfb, #ebedee);
}
</style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-custom px-4 shadow">
    <img src="images/logo.png" width="90">
    <div class="ms-auto">
        <a href="#enroll" class="btn btn-light me-2">Enroll Student</a>
        <a href="#view" class="btn btn-light me-2">View Students</a>
        <a href="/" class="btn btn-outline-dark">Logout</a>
    </div>
</nav>

<!-- ENROLL SECTION -->
<section class="container my-5" id="enroll">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card enroll shadow-lg p-4">
                <h3 class="text-center heading mb-4">🎓 Student Enrollment Form</h3>

                <form action="enroll_student" method="post">

                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Full Name</label>
                            <input type="text" class="form-control" name="studentFullName" required>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" name="studentEmail" required>
                        </div>

                        <div class="col-md-4">
                            <label class="form-label">Age</label>
                            <input type="number" class="form-control" name="studentAge">
                        </div>

                        <div class="col-md-8">
                            <label class="form-label">College Name</label>
                            <input type="text" class="form-control" name="studentCollegeName">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Fees Paid</label>
                            <input type="number" class="form-control" name="feesPaid">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Course</label><br>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="StudentCourse" value="Java" checked>
                                <label class="form-check-label">Java</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="StudentCourse" value="Python">
                                <label class="form-check-label">Python</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="StudentCourse" value="Testing">
                                <label class="form-check-label">Testing</label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Batch Mode</label>
                            <select class="form-select" name="batchMode">
                                <option disabled selected>Select</option>
                                <option>Online</option>
                                <option>Offline</option>
                            </select>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Batch Number</label>
                            <select class="form-select" name="batchNumber">
                                <option disabled selected>Select</option>
                                <option>FDJ-160</option>
                                <option>REG-160</option>
                                <option>FDJ-161</option>
                                <option>REG-161</option>
                            </select>
                        </div>
                    </div>

                    <div class="text-center mt-4">
                        <button class="btn btn-custom btn-lg px-5">Submit</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</section>

<!-- VIEW SECTION -->
<section class="view py-5" id="view">
    <div class="container">
        <h2 class="text-center mb-4">📋 Enrolled Students</h2>
        <div class="alert alert-info text-center">
            Student list will be displayed here using Table / JSTL / Database
        </div>
    </div>
</section>

</body>
</html>
