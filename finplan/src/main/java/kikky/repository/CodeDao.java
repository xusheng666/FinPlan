package kikky.repository;

import kikky.entity.BaCode;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface CodeDao extends PagingAndSortingRepository<BaCode, Long>, JpaSpecificationExecutor<BaCode> {

	//Page<BaCode> findByCategory(String category, Pageable pageRequest);
	
	//Page<BaCode> findByCodeId(Long id, Pageable pageRequest);

	@Modifying
	@Query("delete from BaCode code where code.id=?1")
	void deleteByCodeId(Long id);
}
