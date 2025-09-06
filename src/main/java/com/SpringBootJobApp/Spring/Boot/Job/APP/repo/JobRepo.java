package com.SpringBootJobApp.Spring.Boot.Job.APP.repo;

import com.SpringBootJobApp.Spring.Boot.Job.APP.model.JobPost;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Repository
public class JobRepo {

    // ArrayList to store JobPost objects
    List<JobPost> jobs = new ArrayList<>(Arrays.asList(
            new JobPost(1, "Java Developer", "Must have good experience in core Java and advanced Java", 2,
                    List.of("Core Java", "J2EE", "Spring Boot", "Hibernate"), true, true),

            new JobPost(2, "Frontend Developer", "Experience in building responsive web applications using React", 3,
                    List.of("HTML", "CSS", "JavaScript", "React"), false, false),

            new JobPost(3, "Data Scientist", "Strong background in machine learning and data analysis", 4,
                    List.of("Python", "Machine Learning", "Data Analysis"), false, false),

            new JobPost(4, "Network Engineer", "Design and implement computer networks for efficient data communication", 5,
                    List.of("Networking", "Cisco", "Routing", "Switching"),true, true),

            new JobPost(5, "Mobile App Developer", "Experience in mobile app development for iOS and Android", 3,
                    List.of("iOS Development", "Android Development", "Mobile App"), false, false)
    ));

    public List<JobPost> getAllJobs() {
        return jobs;
    }

    public boolean addJob(JobPost job) {
        boolean exists = jobs.stream()
                .anyMatch(j -> j.getPostId() == job.getPostId());
        if (exists) return false;
        jobs.add(job);
        return true;
    }

    public void applyForJob(int jobId) {
        for (JobPost job : jobs) {
            if (job.getPostId() == jobId) {
                job.setApplied(true);
                break;
            }
        }
    }

    public void saveJob(int jobId) {
        for (JobPost job : jobs) {
            if (job.getPostId() == jobId) {
                job.setSaved(true);
                break;
            }
        }
    }

    public String removeSavedJob(int jobId) {
        for (JobPost job : jobs) {
            if (job.getPostId() == jobId) {
                if (!job.isSaved()) {
                    return "not_saved";
                }
                job.setSaved(false);
                return "success";
            }
        }
        return "not_found";
    }

    public JobPost getJobById(int jobId) {
        for (JobPost job : jobs) {
            if (job.getPostId() == jobId) {
                return job;
            }
        }
        return null;
    }
}

