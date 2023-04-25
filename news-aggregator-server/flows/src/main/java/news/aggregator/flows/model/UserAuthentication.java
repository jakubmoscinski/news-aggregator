package news.aggregator.flows.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class UserAuthentication {

    @JsonProperty("username")
    String username;

    @JsonProperty("password")
    String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
