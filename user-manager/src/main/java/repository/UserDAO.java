package repository;

import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements IUserDAO {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/demo?useSSL=false";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "trungchien123";

    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, country) VALUES (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "SELECT id, name, email, country FROM users WHERE id = ?";
    private static final String SELECT_ALL_USERS = "SELECT * FROM users";
    private static final String DELETE_USERS_SQL = "DELETE FROM users WHERE id = ?;";
    private static final String UPDATE_USERS_SQL = "UPDATE users SET name = ?, email = ?, country = ? WHERE id = ?;";
    private static final String SEARCH_BY_COUNTRY_SQL = "SELECT * FROM users WHERE country LIKE ?";
    private static final String SORT_BY_NAME_SQL = "SELECT * FROM users ORDER BY name ASC";

    public UserDAO() {}

    protected Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found", e);
        }
    }

    @Override
    public void insertUser(User user) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {

            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)) {

            preparedStatement.setInt(1, id);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    String country = rs.getString("country");
                    user = new User(id, name, email, country);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);
             ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL)) {

            statement.setInt(1, id);
            return statement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public void updateUser(User user) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL)) {

            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getCountry());
            statement.setInt(4, user.getId());
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public List<User> searchByCountry(String country) {
        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_BY_COUNTRY_SQL)) {

            preparedStatement.setString(1, "%" + country + "%");
            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    String ctry = rs.getString("country");
                    users.add(new User(id, name, email, ctry));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public List<User> sortByName() {
        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SORT_BY_NAME_SQL);
             ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
}
