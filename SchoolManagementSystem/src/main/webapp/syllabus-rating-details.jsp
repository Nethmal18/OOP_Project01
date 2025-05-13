<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Syllabus Rating Details</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        :root {
            --primary: #4361ee;
            --secondary: #3f37c9;
            --success: #4cc9f0;
            --warning: #f72585;
            --light: #f8f9fa;
            --dark: #212529;
        }

        body {
            background-color: #f5f7fb;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .content-container {
            padding: 2rem 1.5rem;
        }

        .page-header {
            padding: 1.5rem 0;
            margin-bottom: 2rem;
        }

        .page-header h1 {
            font-weight: 700;
            color: var(--dark);
            margin-bottom: 0.5rem;
        }

        .page-header p {
            color: #6c757d;
            font-size: 1.1rem;
        }

        .card {
            border: none;
            border-radius: 12px;
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
            margin-bottom: 25px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
        }

        .card-header {
            font-weight: 600;
            font-size: 1.1rem;
            padding: 1rem 1.5rem;
            border-bottom: none;
            background: linear-gradient(45deg, #ffbe0b, #fb5607);
            color: white;
        }

        .card-body {
            padding: 1.75rem;
        }

        .btn {
            padding: 0.375rem 1rem;
            border-radius: 50px;
            font-weight: 500;
            transition: all 0.3s;
        }

        .btn-primary {
            background-color: var(--primary);
            border-color: var(--primary);
            box-shadow: 0 4px 10px rgba(67, 97, 238, 0.3);
        }

        .btn-primary:hover {
            background-color: var(--secondary);
            border-color: var(--secondary);
            box-shadow: 0 6px 15px rgba(67, 97, 238, 0.4);
        }

        .alert {
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }

        .syllabus-info {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 25px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .syllabus-info h3 {
            margin-bottom: 15px;
            font-weight: 600;
            color: #333;
        }

        .rating-stars {
            color: #ffc107;
        }

        .badge-department {
            background-color: #8338ec;
            color: white;
            font-weight: 500;
        }

        .badge-semester {
            background-color: #3a86ff;
            color: white;
            font-weight: 500;
        }

        .rating-summary-card {
            background-color: #fff;
            border-radius: 10px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .rating-average {
            text-align: center;
            padding: 20px 0;
        }

        .rating-average .number {
            font-size: 48px;
            font-weight: 700;
            color: #333;
            line-height: 1;
        }

        .rating-average .stars {
            font-size: 24px;
            margin: 10px 0;
        }

        .rating-average .count {
            color: #6c757d;
        }

        .rating-distribution .progress {
            height: 10px;
            border-radius: 5px;
        }

        .rating-distribution .progress-bar {
            background-color: #ffc107;
        }

        .rating-item {
            background-color: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 15px;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .rating-item:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .rating-item .rating-date {
            color: #6c757d;
            font-size: 0.85rem;
        }

        .rating-item .comment {
            margin-top: 10px;
            padding-top: 10px;
            border-top: 1px solid #dee2e6;
        }

        .no-ratings {
            text-align: center;
            padding: 30px;
        }

        .no-ratings i {
            font-size: 48px;
            color: #dee2e6;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="container content-container">
        <!-- Page Header -->
        <div class="page-header d-flex justify-content-between align-items-center">
            <div>
                <h1>Syllabus Rating Details</h1>
                <p>View all ratings for this syllabus</p>
            </div>
            <a href="RatingController?action=summary" class="btn btn-outline-primary">
                <i class="fas fa-arrow-left mr-2"></i> Back to Ratings
            </a>
        </div>

        <!-- Flash Message -->
        <c:if test="${not empty sessionScope.message}">
            <div class="alert alert-${sessionScope.messageType} alert-dismissible fade show" role="alert">
                <i class="fas fa-info-circle mr-2"></i> ${sessionScope.message}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <c:remove var="message" scope="session" />
            <c:remove var="messageType" scope="session" />
        </c:if>

        <!-- Syllabus Information -->
        <div class="syllabus-info">
            <h3>${syllabus.syllabusDescription}</h3>
            <div class="row">
                <div class="col-md-6">
                    <p><strong>Subject ID:</strong> ${syllabus.subId}</p>
                    <p><strong>Department:</strong> <span class="badge badge-department">${syllabus.cmId}</span></p>
                </div>
                <div class="col-md-6">
                    <p><strong>Semester:</strong> <span class="badge badge-semester">Semester ${syllabus.syllabusDuration}</span></p>
                    <p><strong>Last Updated:</strong> ${syllabus.syllabusDate}</p>
                </div>
            </div>
        </div>

        <div class="row">
            <!-- Rating Summary -->
            <div class="col-md-4">
                <div class="rating-summary-card">
                    <h4>Rating Summary</h4>
                    
                    <div class="rating-average">
                        <div class="number">
                            <c:choose>
                                <c:when test="${ratingCount > 0}">
                                    <fmt:formatNumber value="${averageRating}" pattern="#.#" />
                                </c:when>
                                <c:otherwise>0.0</c:otherwise>
                            </c:choose>
                        </div>
                        <div class="stars">
                            <c:forEach begin="1" end="5" var="star">
                                <c:choose>
                                    <c:when test="${star <= Math.floor(averageRating)}">
                                        <i class="fas fa-star"></i>
                                    </c:when>
                                    <c:when test="${star == Math.ceil(averageRating) && averageRating % 1 != 0}">
                                        <i class="fas fa-star-half-alt"></i>
                                    </c:when>
                                    <c:otherwise>
                                        <i class="far fa-star"></i>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </div>
                        <div class="count">${ratingCount} ratings</div>
                    </div>
                    
                    <div class="rating-distribution mt-4">
                        <c:forEach begin="5" end="1" step="-1" var="rating">
                            <div class="d-flex align-items-center mb-2">
                                <div style="width: 35px;">${rating} <i class="fas fa-star" style="font-size: 12px;"></i></div>
                                <div class="progress flex-grow-1 mx-2">
                                    <c:set var="percentage" value="${ratingCount > 0 ? (distribution[rating] * 100) / ratingCount : 0}" />
                                    <div class="progress-bar" role="progressbar" style="width: ${percentage}%" 
                                        aria-valuenow="${percentage}" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <div style="width: 30px; text-align: right;">${distribution[rating]}</div>
                            </div>
                        </c:forEach>
                    </div>
                    
                    <div class="mt-4 text-center">
                        <a href="RatingController?action=add&syllabusId=${syllabus.syllabusId}" class="btn btn-primary">
                            <i class="fas fa-star mr-1"></i> Rate Now
                        </a>
                    </div>
                </div>
            </div>
            
            <!-- Rating List -->
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-comments mr-2"></i> All Ratings
                    </div>
                    <div class="card-body">
                        <c:choose>
                            <c:when test="${empty ratings}">
                                <div class="no-ratings">
                                    <i class="far fa-comment-dots d-block"></i>
                                    <h4>No Ratings Yet</h4>
                                    <p>Be the first to rate this syllabus!</p>
                                    <a href="RatingController?action=add&syllabusId=${syllabus.syllabusId}" class="btn btn-primary mt-2">
                                        <i class="fas fa-star mr-1"></i> Add Rating
                                    </a>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${ratings}" var="rating">
                                    <div class="rating-item">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="rating-stars">
                                                <c:forEach begin="1" end="5" var="star">
                                                    <c:choose>
                                                        <c:when test="${star <= rating.ratingValue}">
                                                            <i class="fas fa-star"></i>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <i class="far fa-star"></i>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </div>
                                            <span class="rating-date">
                                                <fmt:formatDate value="${rating.ratingDate}" pattern="MMM d, yyyy" />
                                            </span>
                                        </div>
                                        
                                        <c:if test="${not empty rating.comment}">
                                            <div class="comment">
                                                ${rating.comment}
                                            </div>
                                        </c:if>
                                        
                                        <!-- Admin Actions - In a real app, check if user is admin or the rating creator -->
                                        <div class="text-right mt-2">
                                            <a href="RatingController?action=delete&ratingId=${rating.ratingId}&syllabusId=${syllabus.syllabusId}" 
                                               class="btn btn-sm btn-outline-danger"
                                               onclick="return confirm('Are you sure you want to delete this rating?')">
                                                <i class="fas fa-trash-alt"></i>
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>