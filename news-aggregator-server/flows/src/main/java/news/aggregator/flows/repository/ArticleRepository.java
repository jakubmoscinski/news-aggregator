package news.aggregator.flows.repository;

import news.aggregator.flows.model.Article;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
@Transactional
public interface ArticleRepository extends JpaRepository<Article, Long> {

}
