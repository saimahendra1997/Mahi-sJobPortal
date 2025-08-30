package com.SpringBootJobApp.Spring.Boot.Job.APP;


import com.SpringBootJobApp.Spring.Boot.Job.APP.model.JobPost;
import com.SpringBootJobApp.Spring.Boot.Job.APP.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class JobController {


    @Autowired
    private JobService jobService;

    @GetMapping({"/", "home"})
    public String home()
    {
        return "home";
    }

    @GetMapping("addjob")
    public String addJob()
    {
        return "addjob";
    }


    @PostMapping("handleForm")
    public String handleForm(JobPost jobPost, Model model) {
        jobService.addJob(jobPost);
        model.addAttribute("job", jobPost);
        return "postsuccess";
    }

    @GetMapping("viewalljobs")
    public String viewJobs(Model model)
    {
        List<JobPost> alljobs = jobService.getAllJobs();
        model.addAttribute("jobPosts", alljobs);
        return "viewalljobs";
    }

    @PostMapping("applyJob")
    public String applyJob(@RequestParam int jobId, Model model) {
        jobService.applyForJob(jobId);
        JobPost job = jobService.getJobById(jobId);
        model.addAttribute("job", job);
        return "applysuccess";
    }

    @PostMapping("saveJob")
    public String saveJob(@RequestParam int jobId) {
        jobService.saveJob(jobId);
        return "redirect:/viewalljobs";
    }

    @PostMapping("removeSavedJob")
    public String removeSavedJob(@RequestParam int jobId, RedirectAttributes redirectAttributes) {
        String result = jobService.removeSavedJob(jobId);

        if ("success".equals(result)) {
            redirectAttributes.addFlashAttribute("message", "Saved Job Removed Successfully!");
        } else if ("not_saved".equals(result)) {
            redirectAttributes.addFlashAttribute("message", "This job was not saved.");
        } else {
            redirectAttributes.addFlashAttribute("message", "Job not found.");
        }
        return "redirect:/savedjobs";
    }

    @GetMapping("savedjobs")
    public String viewSavedJobs(Model model) {
        List<JobPost> savedJobs = jobService.getSavedJobs();
        model.addAttribute("jobPosts", savedJobs);
        return "savedjobs";
    }

    @GetMapping("appliedjobs")
    public String viewAppliedJobs(Model model) {
        List<JobPost> appliedJobs = jobService.getAppliedJobs();
        model.addAttribute("jobPosts", appliedJobs);
        return "appliedjobs";
    }

}
