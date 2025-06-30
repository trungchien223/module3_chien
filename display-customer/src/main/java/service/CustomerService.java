package service;
import model.Customer;
import java.util.*;

public class CustomerService {
    public static List<Customer> getCustomers() {
        List<Customer> list = new ArrayList<>();
        list.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://demoda.vn/wp-content/uploads/2022/08/hinh-anh-avatar-nu-de-thuong.jpg"));
        list.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "https://timbaby.net/wp-content/uploads/2022/11/anh-avatar-dep-cho-con-gai-1.jpg"));
        list.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "https://thuthuatnhanh.com/wp-content/uploads/2020/09/hinh-anh-avatar-nu-dep-cho-con-gai-cute-de-thuong-nhat.jpg"));
        list.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây", "https://khoinguonsangtao.vn/wp-content/uploads/2022/08/hinh-anh-avatar-cho-con-gai-dep-dang-yeu.jpg"));
        list.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Nội", "https://img.freepik.com/premium-photo/cute-avatar_1025480-794.jpg"));
        return list;
    }
}