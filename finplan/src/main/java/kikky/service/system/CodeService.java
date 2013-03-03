package kikky.service.system;

import java.util.List;
import java.util.Map;

import kikky.entity.BaCode;
import kikky.repository.CodeDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;
import org.springside.modules.persistence.SearchFilter.Operator;

/**
 * Code管理类.
 * 
 * @author Eden
 */
// Spring Service Bean的标识.
@Component
@Transactional(readOnly = true)
public class CodeService {

	private CodeDao codeDao;

	public BaCode getCode(Long id) {
		return codeDao.findOne(id);
	}

	@Transactional(readOnly = false)
	public void saveCode(BaCode entity) {
		codeDao.save(entity);
	}

	@Transactional(readOnly = false)
	public void deleteCode(Long id) {
		codeDao.delete(id);
	}

	public List<BaCode> getAllTask() {
		return (List<BaCode>) codeDao.findAll();
	}

	public Page<BaCode> getCateCode(Map<String, Object> searchParams, int pageNumber, int pageSize,
			String sortType) {
		PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
		Specification<BaCode> spec = buildSpecification(searchParams);

		return codeDao.findAll(spec, pageRequest);
	}

	/**
	 * 创建分页请求.
	 */
	private PageRequest buildPageRequest(int pageNumber, int pagzSize, String sortType) {
		Sort sort = null;
		if ("auto".equals(sortType)) {
			sort = new Sort(Direction.DESC, "id");
		} else if ("title".equals(sortType)) {
			sort = new Sort(Direction.ASC, "title");
		}

		return new PageRequest(pageNumber - 1, pagzSize, sort);
	}

	/**
	 * 创建动态查询条件组合.
	 */
	private Specification<BaCode> buildSpecification(Map<String, Object> searchParams) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		//filters.put("codeCategory", new SearchFilter("codeCategory", Operator.EQ, category));
		Specification<BaCode> spec = DynamicSpecifications.bySearchFilter(filters.values(), BaCode.class);
		return spec;
	}

	@Autowired
	public void setCodeDao(CodeDao codeDao) {
		this.codeDao = codeDao;
	}
}
