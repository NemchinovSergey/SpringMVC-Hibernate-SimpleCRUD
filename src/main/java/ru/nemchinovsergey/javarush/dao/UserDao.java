package ru.nemchinovsergey.javarush.dao;

import ru.nemchinovsergey.javarush.model.User;

import java.util.List;

public interface UserDao {
    void addUser(User user);

    void updateUser(User user);

    void removeUser(int id);

    User getUserById(int id);

    List<User> getUsersList();

    List<User> searchUsers(String str);
}
