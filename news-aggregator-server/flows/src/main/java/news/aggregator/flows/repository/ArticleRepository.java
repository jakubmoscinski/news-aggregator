package news.aggregator.flows.repository;

import news.aggregator.flows.model.Article;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Repository
@Transactional
public interface ArticleRepository extends JpaRepository<Article, Long> {

    @Query("SELECT a FROM Article a WHERE a.id = :id")
    Optional<Article> findArticleById(@Param("id") final long id);

    @Query("SELECT a FROM Article a ORDER BY a.id DESC")
    List<Article> findArticles(Pageable pageable);

}
