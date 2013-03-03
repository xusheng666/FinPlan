package kikky.web.system;

import java.util.Map;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import kikky.entity.BaCode;
import kikky.service.system.CodeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.modules.web.Servlets;

import com.google.common.collect.Maps;

/**
 * Task管理的Controller, 使用Restful风格的Urls:
 * 
 * List page     : GET /code/
 * Create page   : GET /code/create
 * Create action : POST /code/create
 * Update page   : GET /code/update/{id}
 * Update action : POST /code/update
 * Delete action : GET /code/delete/{id}
 * 
 * @author Eden
 */
@Controller
@RequestMapping(value = "/code")
public class CodeController {

	private static final int PAGE_SIZE = 3;

	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
	static {
		sortTypes.put("auto", "自动");
		sortTypes.put("code", "Code");
	}

	@Autowired
	private CodeService codeService;

	@RequestMapping(value = "")
	public String list(@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
			@RequestParam(value = "page", defaultValue = "1") int pageNumber, Model model, ServletRequest request) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		
        //String category = "test";
		Page<BaCode> codes = codeService.getCateCode(searchParams, pageNumber, PAGE_SIZE, sortType);

		model.addAttribute("codes", codes);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

		return "code/codeList";
	}

	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("code", new BaCode());
		model.addAttribute("action", "create");
		return "code/codeForm";
	}

	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(@Valid BaCode newTask, RedirectAttributes redirectAttributes) {
		
		codeService.saveCode(newTask);
		redirectAttributes.addFlashAttribute("message", "创建任务成功");
		return "redirect:/code/";
	}

	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("code", codeService.getCode(id));
		model.addAttribute("action", "update");
		return "code/codeForm";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("preloadCode") BaCode code, RedirectAttributes redirectAttributes) {
		codeService.saveCode(code);
		redirectAttributes.addFlashAttribute("message", "更新任务成功");
		return "redirect:/code/";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		codeService.deleteCode(id);
		redirectAttributes.addFlashAttribute("message", "删除任务成功");
		return "redirect:/code/";
	}

	/**
	 * 使用@ModelAttribute, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出Task对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此本方法在该方法中执行.
	 */
	@ModelAttribute("preloadCode")
	public BaCode getCode(@RequestParam(value = "id", required = false) Long id) {
		if (id != null) {
			return codeService.getCode(id);
		}
		return null;
	}

}
