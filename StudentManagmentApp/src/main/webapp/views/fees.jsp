<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Installment Details</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">

</head>
<body class="bg-light">

	<div class="container d-flex justify-content-center align-items-center min-vh-100">

		<div class="card shadow-lg w-50 border-info border-2">
			<div class="card-header bg-info text-white text-center">
				<h5 class="mb-0">Installment Details</h5>
			</div>

			<div class="card-body">

				<table class="table table-bordered table-hover">
					<tbody>
						<tr class="table-light">
							<th>Student ID</th>
							<td>${st.studentId}</td>
						</tr>

						<tr class="table-light">
							<th>Student Name</th>
							<td>${st.studentFullName}</td>
						</tr>

						<tr class="table-light">
							<th>Course Name</th>
							<td>${st.studentCourse}</td>
						</tr>

						<tr class="table-light">
							<th>Batch Number</th>
							<td>${st.batchNumber}</td>
						</tr>

						<tr class="table-danger">
							<th>Fees Paid</th>
							<td><b>₹ ${st.feesPaid}</b></td>
						</tr>
					</tbody>
				</table>

				<hr>

				<form action="payfees">
					<input type="hidden" name="studentId" value="${st.studentId}">

					<div class="mb-3">
						<label for="amount" class="form-label text-primary fw-bold">
							Enter Installment Amount
						</label>
						<input type="number" name="amount" class="form-control"
							placeholder="Enter amount" required>
					</div>

					<div class="text-center">
						<button class="btn btn-success px-4">
							Add Installment
						</button>
					</div>
				</form>

			</div>
		</div>

	</div>

</body>
</html>
