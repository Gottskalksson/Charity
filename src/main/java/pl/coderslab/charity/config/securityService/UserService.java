package pl.coderslab.charity.config.securityService;

import pl.coderslab.charity.entity.User;

public interface UserService {

    User findByUserName(String name);

    void saveUser(User user);
}
