<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Details - Mahi's Job Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
                <li class="nav-item"><a class="nav-link" href="appliedjobs">Applied Jobs</a></li>
                <li class="nav-item"><a class="nav-link" href="https://www.linkedin.com/in/sai-mahendra-penumakula/">Contact</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <a href="viewalljobs" class="back-link d-flex align-items-center mb-3">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left me-2" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
        </svg>
        Back to All Jobs
    </a>
</div>

<div class="container mt-4 mb-5">
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <div class="card job-detail-card">
                <div class="card-body p-4">
                    <div class="job-header">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <h2 class="card-title mb-1">${job.postProfile}</h2>
                                <p class="text-muted mb-0">Job ID: ${job.postId}</p>
                            </div>
                            <div class="d-flex">
                                <c:if test="${job.applied}">
                                    <span class="badge bg-success me-2 align-self-start">Applied</span>
                                </c:if>
                                <c:if test="${job.saved}">
                                    <span class="badge bg-warning text-dark align-self-start">Saved</span>
                                </c:if>
                            </div>
                        </div>
                    </div>

                    <div class="mb-4">
                        <h5 class="mb-2">Job Description</h5>
                        <p class="card-text">${job.postDesc}</p>
                    </div>

                    <div class="row mb-4">
                        <div class="col-md-6">
                            <h5 class="mb-2">Experience Required</h5>
                            <p class="card-text">${job.reqExperience} years</p>
                        </div>
                        <div class="col-md-6">
                            <h5 class="mb-2">Status</h5>
                            <p class="card-text">
                                <c:choose>
                                    <c:when test="${job.applied}">
                                        <span class="text-success">You've applied for this position</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="text-secondary">Not applied yet</span>
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                    </div>

                    <div class="mb-4">
                        <h5 class="mb-2">Technical Skills Required</h5>
                        <div class="tech-stack">
                            <c:forEach var="tech" items="${job.postTechStack}">
                                <span class="tech-badge">${tech}</span>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="d-flex gap-2 mt-4">
                        <form action="applyJob" method="post" class="d-inline">
                            <input type="hidden" name="jobId" value="${job.postId}">
                            <button type="submit" class="btn btn-primary action-btn" ${job.applied ? 'disabled' : ''}>
                                ${job.applied ? 'Already Applied' : 'Apply Now'}
                            </button>
                        </form>

                        <form action="saveJob" method="post" class="d-inline">
                            <input type="hidden" name="jobId" value="${job.postId}">
                            <button type="submit" class="btn btn-outline-primary action-btn" ${job.saved ? 'disabled' : ''}>
                                ${job.saved ? 'Already Saved' : 'Save Job'}
                            </button>
                        </form>

                        <c:if test="${job.saved}">
                            <form action="removeSavedJob" method="post" class="d-inline">
                                <input type="hidden" name="jobId" value="${job.postId}">
                                <button type="submit" class="btn btn-outline-danger action-btn">
                                    Remove Saved Job
                                </button>
                            </form>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="copyright">
    <p> Copyright &copy; Sai Mahendra Penumakula. Made with <i class="fas fa-heart"></i> Spring Boot, Java, JSP, and Bootstrap</p>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
