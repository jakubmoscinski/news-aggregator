package news.aggregator.processors.domain;

import com.fasterxml.jackson.annotation.JsonProperty;

public class NewsApiSource {

//    @JsonProperty("Id")
//    private Long id;

    @JsonProperty("Name")
    private String name;

//    public long getId() {
//        return id;
//    }
//
//    public void setId(long id) {
//        this.id = id;
//    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
