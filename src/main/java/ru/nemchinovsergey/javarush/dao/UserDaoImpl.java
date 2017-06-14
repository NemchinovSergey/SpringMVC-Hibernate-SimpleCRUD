package ru.nemchinovsergey.javarush.dao;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.*;
import org.springframework.stereotype.Repository;
import ru.nemchinovsergey.javarush.model.User;

import javax.annotation.Resource;
import java.util.List;

@Repository(value = "userDao")
public class UserDaoImpl implements UserDao {

    private static final Logger logger = LogManager.getLogger(UserDaoImpl.class);

    private SessionFactory sessionFactory;

    @Resource(name = "hibernateSessionFactory")
    public void setSessionFactory(SessionFactory sessionFactory) {
        logger.debug("setSessionFactory()");

        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addUser(User user) {
        logger.debug("addUser() user : {}", user);

        Session session = sessionFactory.getCurrentSession();
        session.persist(user);

        logger.info("User successfully added. User details: {}", user);
    }

    @Override
    public void updateUser(User user) {
        logger.debug("updateUser() user : {}", user);

        Session session = sessionFactory.getCurrentSession();
        session.update(user);

        logger.info("User successfully updated. User details: {}", user);
    }

    @Override
    public void removeUser(int id) {
        logger.debug("removeUser() id : {}", id);

        Session session = sessionFactory.getCurrentSession();
        User user = (User) session.get(User.class, id);

        if (user != null) {
            session.delete(user);
        }

        logger.info("User successfully removed. User details: {}", user);
    }

    @Override
    public User getUserById(int id) {
        logger.debug("getUserById() id : {}", id);
        Session session = sessionFactory.getCurrentSession();
        User user = (User) session.get(User.class, id);
        logger.info("User successfully loaded. User details: {}", user);
        return user;
    }

    @Override
    public List<User> getUsersList() {
        logger.debug("getUsersList()");

        Session session = sessionFactory.getCurrentSession();
        List<User> userList = (List<User>)session.createQuery("FROM User").list();

        for (User user : userList) {
           logger.info("User: {}" + user);
        }

        return userList;
    }

    @Override
    public List<User> searchUsers(String str) {
        logger.debug("searchUsers() str : {}", str);

        Session session = sessionFactory.getCurrentSession();

        Query query = session.createQuery("FROM User u WHERE u.name LIKE :str");
        query.setParameter("str", "%" + str + "%");

        List<User> userList = (List<User>)query.list();

        for (User user : userList) {
            logger.info("User: {}" + user);
        }

        return userList;
    }

}
