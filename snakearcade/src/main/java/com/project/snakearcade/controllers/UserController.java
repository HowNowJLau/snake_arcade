package com.project.snakearcade.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.snakearcade.models.ArchivedReward;
import com.project.snakearcade.models.LoginUser;
import com.project.snakearcade.models.User;
import com.project.snakearcade.services.RewardService;
import com.project.snakearcade.services.UserService;

@Controller
public class UserController {
	
	private final UserService userServ;
	private final RewardService rewardServ;
	
	public UserController(UserService userServ, RewardService rewardServ) {
		this.userServ = userServ;
		this.rewardServ = rewardServ;
	}

	@GetMapping("/")
    public String index(Model model, HttpSession session) {
    	if (session.getAttribute("user_id") != null) {
    		return "redirect:/arcade";
    	}
        // Bind empty User and LoginUser objects to the JSP
        // to capture the form input
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "/user/index.jsp";
    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
    	
        // TO-DO Later -- call a register method in the service 
        // to do some extra validations and create a new user!
    	User userToRegister = userServ.register(newUser, result);
        if(result.hasErrors()) {
            // Be sure to send in the empty LoginUser before 
            // re-rendering the page.
            model.addAttribute("newLogin", new LoginUser());
            return "/user/index.jsp";
        }
        
        // No errors! 
        // TO-DO Later: Store their ID from the DB in session, 
        // in other words, log them in.
        session.setAttribute("user_id", userToRegister.getId());
        rewardServ.create(userToRegister.getId(), Long.valueOf(1), Boolean.TRUE);
        return "redirect:/arcade";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        
        // Add once service is implemented:
        User user = userServ.login(newLogin, result);
    
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "/user/index.jsp";
        }
    
        // No errors! 
        session.setAttribute("user_id", user.getId());
        return "redirect:/arcade";
    }
    
    @GetMapping("/arcade")
    public String dashboard(HttpSession session, Model model) {
    	if (session.getAttribute("user_id") == null) {
    		return "redirect:/";
    	}
    	User loggedUser = userServ.getOne((Long) session.getAttribute("user_id"));
    	ArchivedReward avatar = loggedUser.getAvatar().getArchivedReward();
    	model.addAttribute("loggedUser", loggedUser);
    	model.addAttribute("avatar", avatar);
    	return "/main/dashboard.jsp";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
}
