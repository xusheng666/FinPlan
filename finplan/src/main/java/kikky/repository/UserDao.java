package kikky.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import kikky.entity.User;

public interface UserDao extends PagingAndSortingRepository<User, Long> {
	User findByLoginName(String loginName);
}
