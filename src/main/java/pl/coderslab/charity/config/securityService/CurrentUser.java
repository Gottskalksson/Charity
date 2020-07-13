package pl.coderslab.charity.config.securityService;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Set;

public class CurrentUser extends User {

    private final pl.coderslab.charity.entity.User user;

    public CurrentUser(String username, String password, Set<GrantedAuthority> grantedAuthorities,
                       pl.coderslab.charity.entity.User user) {
        super(username, password, grantedAuthorities);
        this.user = user;
    }

    public pl.coderslab.charity.entity.User getUser() { return user;}
}
