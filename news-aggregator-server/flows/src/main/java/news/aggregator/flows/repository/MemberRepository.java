package news.aggregator.flows.repository;

import news.aggregator.flows.model.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.Optional;

/**
 * Provides JPA functionalities together with custom HQL (Hibernate SQL) queries - for 'member' table.
 * Single objects fetch from db are wrapped in Optional<> to prevent
 * from null pointer exceptions in other modules calling this service methods
 */

@Repository
@Transactional
public interface MemberRepository extends JpaRepository<Member, Long> {

    @Query("SELECT m FROM Member m WHERE m.username = :username")
    Optional<Member> getMemberByUsername(@Param("username") final String username);

}
