<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Mahi's Job Portal</title>
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
				<li class="nav-item"><a class="nav-link active" href="home">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="viewalljobs">All Jobs</a></li>
				<li class="nav-item"><a class="nav-link" href="savedjobs">Saved Jobs</a></li>
				<li class="nav-item"><a class="nav-link" href="appliedjobs">Applied Jobs</a></li>
				<li class="nav-item"><a class="nav-link" href="https://www.linkedin.com/in/sai-mahendra-penumakula/">Contact</a></li>
			</ul>
		</div>
	</div>
</nav>

<div class="container mt-5">
    <div class="hero-section text-center mb-5">
        <h1 class="display-4 mb-3">Find Your Dream Job</h1>
        <p class="lead mb-4">Browse through hundreds of job listings and find the perfect match for your skills</p>
    </div>

	<div class="row">
		<!-- Card 1 -->
		<div class="col-md-4 mb-4">
			<div class="card h-100 action-card">
				<div class="card-body text-center p-4">
				    <div class="icon-container mb-3">
				        <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-briefcase" viewBox="0 0 16 16">
				            <path d="M6.5 1A1.5 1.5 0 0 0 5 2.5V3H1.5A1.5 1.5 0 0 0 0 4.5v8A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-8A1.5 1.5 0 0 0 14.5 3H11v-.5A1.5 1.5 0 0 0 9.5 1h-3zm0 1h3a.5.5 0 0 1 .5.5V3H6v-.5a.5.5 0 0 1 .5-.5zm1.886 6.914L15 7.151V12.5a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5V7.15l6.614 1.764a1.5 1.5 0 0 0 .772 0zM1.5 4h13a.5.5 0 0 1 .5.5v1.616L8.129 7.948a.5.5 0 0 1-.258 0L1 6.116V4.5a.5.5 0 0 1 .5-.5z"/>
				        </svg>
				    </div>
					<h5 class="card-title">Browse Jobs</h5>
					<p class="card-text">Explore all available job positions</p>
					<a href="/viewalljobs" class="btn btn-primary">View All Jobs</a>
				</div>
			</div>
		</div>

		<!-- Card 2 -->
		<div class="col-md-4 mb-4">
			<div class="card h-100 action-card">
				<div class="card-body text-center p-4">
				    <div class="icon-container mb-3">
				        <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
				            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
				            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
				        </svg>
				    </div>
					<h5 class="card-title">Post a Job</h5>
					<p class="card-text">Add a new job listing</p>
					<a href="/addjob" class="btn btn-primary">Add Job</a>
				</div>
			</div>
		</div>

		<!-- Card 3 -->
		<div class="col-md-4 mb-4">
			<div class="card h-100 action-card">
				<div class="card-body text-center p-4">
				    <div class="icon-container mb-3">
				        <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-bookmark-check" viewBox="0 0 16 16">
				            <path fill-rule="evenodd" d="M10.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
				            <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
				        </svg>
				    </div>
					<h5 class="card-title">Saved Jobs</h5>
					<p class="card-text">View your saved job positions</p>
					<a href="/savedjobs" class="btn btn-primary">View Saved Jobs</a>
				</div>
			</div>
		</div>

		<!-- Card 4 -->
		<div class="col-md-4 mb-4">
			<div class="card h-100 action-card">
				<div class="card-body text-center p-4">
				    <div class="icon-container mb-3">
				        <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-send-check" viewBox="0 0 16 16">
				            <path d="M15.964.686a.5.5 0 0 0-.65-.65L.767 5.855a.75.75 0 0 0-.124 1.329l4.995 3.178 1.531 2.406a.5.5 0 0 0 .844-.536L6.637 10.07l7.494-7.494-1.895 4.738a.5.5 0 1 0 .928.372l2.8-7Zm-2.54 1.183L5.93 9.363 1.591 6.602l11.833-4.733Z"/>
				            <path d="M16 12.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Zm-1.993-1.679a.5.5 0 0 0-.686.172l-1.17 1.95-.547-.547a.5.5 0 0 0-.708.708l.774.773a.75.75 0 0 0 1.174-.144l1.335-2.226a.5.5 0 0 0-.172-.686Z"/>
				        </svg>
				    </div>
					<h5 class="card-title">Applied Jobs</h5>
					<p class="card-text">Track your job applications</p>
					<a href="/appliedjobs" class="btn btn-primary">View Applications</a>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>