package news.aggregator.flows.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.sun.istack.NotNull;
import news.aggregator.flows.model.support.ArticleSource;

import javax.persistence.*;

@Entity
@Table(name = "article")
public class Article {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotNull
    @Column(name="source", nullable = false)
    @Enumerated(EnumType.STRING)
    private ArticleSource source;

    @Lob
    @Column(name = "description")
    @JsonFormat(shape = JsonFormat.Shape.STRING)    //TODO: TO double-check when the API will be ready
    private String description;

    //TODO relation to members - likes/favorites etc


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public ArticleSource getSource() {
        return source;
    }

    public void setSource(ArticleSource source) {
        this.source = source;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
