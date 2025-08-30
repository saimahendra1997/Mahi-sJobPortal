<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Job Posted Successfully</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand fs-3 fw-medium" href="home">Mahi's Job Portal</a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="home">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="viewalljobs">All Jobs</a></li>
                    <li class="nav-item"><a class="nav-link" href="https://www.linkedin.com/in/sai-mahendra-penumakula/">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow">
                    <div class="card-body text-center p-5">
                        <div class="mb-4">
                            <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" fill="#28a745" class="bi bi-check-circle-fill" viewBox="0 0 16 16">
                                <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                            </svg>
                        </div>
                        <h2 class="mb-3 text-success">Job Posted Successfully!</h2>
                        <p class="mb-4">Your job posting for <strong>${job.postProfile}</strong> has been added successfully.</p>

                        <div class="card mb-4">
                            <div class="card-body text-start">
                                <h5 class="card-title">${job.postProfile}</h5>
                                <p class="card-text">${job.postDesc}</p>
                                <p><strong>Experience Required:</strong> ${job.reqExperience} years</p>
                                <p><strong>Tech Stack:</strong>
                                    <c:forEach var="tech" items="${job.postTechStack}">
                                        <span class="badge bg-secondary me-1">${tech}</span>
                                    </c:forEach>
                                </p>
                            </div>
                        </div>

                        <div class="d-grid gap-2 d-md-block">
                            <a href="/viewalljobs" class="btn btn-primary me-md-2">View All Jobs</a>
                            <a href="/addjob" class="btn btn-outline-primary">Post Another Job</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>