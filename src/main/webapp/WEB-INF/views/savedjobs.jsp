<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Saved Jobs - Mahi's Job Portal</title>
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
                <li class="nav-item"><a class="nav-link active" href="savedjobs">Saved Jobs</a></li>
                <li class="nav-item"><a class="nav-link" href="appliedjobs">Applied Jobs</a></li>
                <li class="nav-item"><a class="nav-link" href="https://www.linkedin.com/in/sai-mahendra-penumakula/">Contact</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <h2 class="mb-4 text-center section-title">Your Saved Jobs</h2>

    <c:if test="${not empty message}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <c:choose>
        <c:when test="${not empty jobPosts}">
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
                                    <form action="removeSavedJob" method="post" class="d-inline">
                                        <input type="hidden" name="jobId" value="${jobPost.postId}">
                                        <button type="submit" class="btn btn-remove">Remove</button>
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
        </c:when>
        <c:otherwise>
            <div class="empty-state text-center py-5">
                <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" fill="currentColor" class="bi bi-bookmark-x mb-3" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M6.146 5.146a.5.5 0 0 1 .708 0L8 6.293l1.146-1.147a.5.5 0 1 1 .708.708L8.707 7l1.147 1.146a.5.5 0 0 1-.708.708L8 7.707 6.854 8.854a.5.5 0 1 1-.708-.708L7.293 7 6.146 5.854a.5.5 0 0 1 0-.708z"/>
                    <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
                </svg>
                <h4 class="mb-3">No saved jobs yet</h4>
                <p class="text-muted mb-4">Start browsing jobs and save ones you're interested in</p>
                <a href="/viewalljobs" class="btn btn-primary">Browse Jobs</a>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<div class="copyright">
    <p> Copyright &copy; Sai Mahendra Penumakula. Made with <i class="fas fa-heart"></i> Spring Boot, Java, JSP, and Bootstrap</p>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
