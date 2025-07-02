package service;

import model.User;
import repository.IUserDAO;
import repository.UserDAO;
import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    private IUserDAO userDAO;

    public UserService() {
        this.userDAO = new UserDAO();
    }

    @Override
    public void insertUser(User user) throws SQLException {
        userDAO.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userDAO.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return userDAO.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userDAO.deleteUser(id);
    }

    @Override
    public void updateUser(User user) throws SQLException {
        userDAO.updateUser(user);
    }

    @Override
    public List<User> searchByCountry(String country) {
        return userDAO.searchByCountry(country);
    }

    @Override
    public List<User> sortByName() {
        return userDAO.sortByName();
    }
} 