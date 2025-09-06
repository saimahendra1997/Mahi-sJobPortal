package com.SpringBootJobApp.Spring.Boot.Job.APP.service;

import com.SpringBootJobApp.Spring.Boot.Job.APP.model.JobPost;
import com.SpringBootJobApp.Spring.Boot.Job.APP.repo.JobRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class JobService {

        @Autowired
        public JobRepo repo;

        public void addJob(JobPost jobPost) {
            repo.addJob(jobPost);

        }

        //method to return all JobPosts
        public List<JobPost> getAllJobs() {
            return repo.getAllJobs();
        }

        public void applyForJob(int jobId) {
            repo.applyForJob(jobId);
        }

        public void saveJob(int jobId) {
            repo.saveJob(jobId);
        }

        public String removeSavedJob(int jobId) {
            return repo.removeSavedJob(jobId);
        }

        public List<JobPost> getAppliedJobs() {
        return repo.getAllJobs().stream()
                .filter(JobPost::isApplied)
                .collect(Collectors.toList());
        }

        public List<JobPost> getSavedJobs() {
            return repo.getAllJobs().stream()
                    .filter(JobPost::isSaved)
                    .collect(Collectors.toList());
        }

        public JobPost getJobById(int jobId) {
            return repo.getJobById(jobId);
        }
}
