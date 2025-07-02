package repository;

import java.sql.SQLException;
import java.util.List;
import model.User;

public interface IUserDAO {
    void insertUser(User user) throws SQLException;

     User selectUser(int id);

     List<User> selectAllUsers();

     boolean deleteUser(int id) throws SQLException;

     void updateUser(User user) throws SQLException;

     List<User> searchByCountry(String country);
     List<User> sortByName();
}
