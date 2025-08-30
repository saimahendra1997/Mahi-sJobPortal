<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mahi's Job Post List</title>
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
                <li class="nav-item"><a class="nav-link active" href="viewalljobs">All Jobs</a></li>
                <li class="nav-item"><a class="nav-link" href="savedjobs">Saved Jobs</a></li>
                <li class="nav-item"><a class="nav-link" href="appliedjobs">Applied Jobs</a></li>
                <li class="nav-item"><a class="nav-link" href="https://www.linkedin.com/in/sai-mahendra-penumakula/">Contact</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <h2 class="mb-4 text-center section-title">Available Job Positions</h2>

    <c:if test="${not empty message}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <div class="row row-cols-1 row-cols-md-2 g-4">
        <c:forEach var="jobPost" items="${jobPosts}">
            <div class="col">
                <div class="card job-card h-100">
                    <div class="card-body">
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

                        <div class="d-flex gap-2 mt-3">
                            <form action="applyJob" method="post" class="d-inline">
                                <input type="hidden" name="jobId" value="${jobPost.postId}">
                                <button type="submit" class="btn btn-apply" ${jobPost.applied ? 'disabled' : ''}>
                                    ${jobPost.applied ? 'Already Applied' : 'Apply Now'}
                                </button>
                            </form>
                            <form action="saveJob" method="post" class="d-inline">
                                <input type="hidden" name="jobId" value="${jobPost.postId}">
                                <button type="submit" class="btn btn-save" ${jobPost.saved ? 'disabled' : ''}>
                                    ${jobPost.saved ? 'Already Saved' : 'Save Job'}
                                </button>
                            </form>
                        </div>
                    </div>
                    <div class="card-footer">
                        <small class="text-muted">Job ID: ${jobPost.postId}</small>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>