package ru.nemchinovsergey.javarush.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ru.nemchinovsergey.javarush.model.User;
import ru.nemchinovsergey.javarush.service.UserService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class UserController {

    private static final Logger logger = LogManager.getLogger(UserController.class);

    private UserService userService;


    @Autowired
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        logger.debug("setUserService()");
        this.userService = userService;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model) {
        logger.debug("index()");
        return "index";
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String showAllUsers(Model model, @RequestParam(defaultValue="1", value="page", required=false) Integer page,
                               @RequestParam(defaultValue="10", value="pageSize", required=false) Integer pageSize) {
        logger.debug("showAllUsers()");

        List<User> usersList = userService.getUsersList();
        PagedListHolder<User> pagedListHolder = new PagedListHolder<>(usersList);

        pagedListHolder.setPageSize(pageSize);

        int pageCount = pagedListHolder.getPageCount();

        if (page < 1 || page > pageCount) {
            pagedListHolder.setPage(0);
            usersList = pagedListHolder.getPageList();
        }
        else if (page <= pageCount) {
            pagedListHolder.setPage(page - 1);
            usersList = pagedListHolder.getPageList();
        }

        model.addAttribute("usersList", usersList);

        model.addAttribute("pageCount", pageCount);
        model.addAttribute("page", page);

        model.addAttribute("pageSizes", new Integer[]{5, 10, 20, 50, 100});
        model.addAttribute("pageSize", pageSize);

        return "users/users";
    }

    @RequestMapping(value = "/users", method = RequestMethod.POST)
    public String saveOrUpdateUser(@ModelAttribute("user") @Validated User user, BindingResult result, final RedirectAttributes redirectAttributes) {
        logger.debug("saveOrUpdateUser() : {}", user);

        if (result.hasErrors()) {
            return "users/userform";
        }
        else {
            redirectAttributes.addFlashAttribute("css", "success");
            if (user.isNew()) {
                userService.addUser(user);
                redirectAttributes.addFlashAttribute("msg", "User added successfully!");
            }
            else {
                userService.updateUser(user);
                redirectAttributes.addFlashAttribute("msg", "User updated successfully!");
            }
            return "redirect:/users/" + user.getId();
        }
    }

    @RequestMapping(value = "/users/search", method = RequestMethod.GET)
    public String searchUsers(Model model, @RequestParam(defaultValue="", value="value", required=false) String value,
                               @RequestParam(defaultValue="1", value="page", required=false) Integer page,
                               @RequestParam(defaultValue="10", value="pageSize", required=false) Integer pageSize) {
        logger.debug("searchUsers()");

        List<User> usersList = userService.searchUsers(value);
        PagedListHolder<User> pagedListHolder = new PagedListHolder<>(usersList);

        pagedListHolder.setPageSize(pageSize);

        int pageCount = pagedListHolder.getPageCount();

        if (page < 1 || page > pageCount) {
            pagedListHolder.setPage(0);
            usersList = pagedListHolder.getPageList();
        }
        else if (page <= pageCount) {
            pagedListHolder.setPage(page - 1);
            usersList = pagedListHolder.getPageList();
        }

        model.addAttribute("usersList", usersList);

        model.addAttribute("pageCount", pageCount);
        model.addAttribute("page", page);

        model.addAttribute("pageSizes", new Integer[]{5, 10, 20, 50, 100});
        model.addAttribute("pageSize", pageSize);

        return "users/users";
    }

    @RequestMapping("/users/{id}")
    public String showUser(@PathVariable("id") int id, Model model, final RedirectAttributes redirectAttributes) {
        logger.debug("showUser() id: {}", id);

        User user = userService.getUserById(id);

        if (user == null) {
            logger.error("User not found: id", id);
            model.addAttribute("css", "danger");
            model.addAttribute("msg", "User not found");
        }
        model.addAttribute("user", user);

        return "users/userinfo";
    }

    @RequestMapping(value = "/users/add", method = RequestMethod.GET)
    public String showAddUserForm(Model model) {
        logger.debug("showAddUserForm()");

        model.addAttribute("user", new User());

        return "users/userform";
    }

    @RequestMapping("/users/{id}/delete")
    public String deleteUser(@PathVariable("id") int id) {
        logger.debug("deleteUser() id : {}", id);
        userService.removeUser(id);
        return "redirect:/users";
    }

    @RequestMapping("/users/{id}/update")
    public String editUser(@PathVariable("id") int id, Model model) {
        logger.debug("editUser() id : {}", id);

        User user = userService.getUserById(id);
        model.addAttribute("user", user);

        return "users/userform";
    }

    @ExceptionHandler(EmptyResultDataAccessException.class)
    public ModelAndView handleEmptyData(HttpServletRequest req, Exception ex) {

        logger.debug("handleEmptyData()");

        ModelAndView model = new ModelAndView();
        model.setViewName("users/userinfo");
        model.addObject("msg", "user not found");

        return model;
    }

}
