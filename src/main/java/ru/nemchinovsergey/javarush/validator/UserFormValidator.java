package ru.nemchinovsergey.javarush.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import ru.nemchinovsergey.javarush.model.User;
import ru.nemchinovsergey.javarush.service.UserService;

import java.util.List;

//http://docs.spring.io/spring/docs/current/spring-framework-reference/html/validation.html#validation-mvc-configuring
@Component
public class UserFormValidator implements Validator {

    private UserService userService;

    @Autowired
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty.userForm.name");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "age", "NotEmpty.userForm.age");

        if (user != null) {
            if (user.getAge() < 18) {
                errors.rejectValue("age", "Valid.userForm.age");
            }

            if (!user.getName().trim().isEmpty()) {
                List<User> users = userService.searchUsers(user.getName());
                if (users != null) {
                    if ((users.size() > 1) || (users.size() == 1 && users.get(0).getId() != user.getId())) {
                        errors.rejectValue("name", "Valid.userForm.name");
                    }
                }
            }
        }
    }
}