package news.aggregator.processors.domain;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * Serializable domain consistent with 'newsapi.org' 'source' representation
 */
public class NewsApiSource {

    @JsonProperty("Name")
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
