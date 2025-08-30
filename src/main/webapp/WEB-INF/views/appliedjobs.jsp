<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Applied Jobs - Mahi's Job Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
            <a class="navbar-brand fs-3 fw-medium" href="home">Mahi's Job Portal</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="home">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="viewalljobs">All Jobs</a></li>
                <li class="nav-item"><a class="nav-link" href="savedjobs">Saved Jobs</a></li>
                <li class="nav-item"><a class="nav-link active" href="appliedjobs">Applied Jobs</a></li>
                <li class="nav-item"><a class="nav-link" href="https://www.linkedin.com/in/sai-mahendra-penumakula/">Contact</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <h2 class="mb-4 text-center section-title">Your Job Applications</h2>

    <c:choose>
        <c:when test="${not empty jobPosts}">
            <div class="row row-cols-1 row-cols-md-2 g-4">
                <c:forEach var="jobPost" items="${jobPosts}">
                    <div class="col">
                        <div class="card job-card h-100">
                            <div class="card-body">
                                <div class="application-status-badge mb-3">
                                    <span class="badge bg-success">Applied</span>
                                </div>
                                <h5 class="card-title job-title">${jobPost.postProfile}</h5>
                                <p class="card-text job-desc">${jobPost.postDesc}</p>
                                <p class="card-text">
                                    <strong>Experience Required:</strong> ${jobPost.reqExperience} years
                                </p>
                                <p class="card-text">
                                    <strong>Tech Stack:</strong>
                                </p>
                                <div class="tech-stack mb-3">
                                    <c:forEach var="tech" items="${jobPost.postTechStack}">
                                        <span class="tech-badge">${tech}</span>
                                    </c:forEach>
                                </div>

                                <div class="application-date mt-4">
                                    <small class="text-muted">Applied on: October 25, 2023</small>
                                </div>
                            </div>
                            <div class="card-footer">
                                <small class="text-muted">Job ID: ${jobPost.postId}</small>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div class="empty-state text-center py-5">
                <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" fill="currentColor" class="bi bi-send mb-3" viewBox="0 0 16 16">
                    <path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/>
                </svg>
                <h4 class="mb-3">No applications yet</h4>
                <p class="text-muted mb-4">Start applying to jobs to track your applications here</p>
                <a href="/viewalljobs" class="btn btn-primary">Browse Jobs</a>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>