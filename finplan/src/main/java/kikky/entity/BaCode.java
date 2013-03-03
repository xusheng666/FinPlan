package kikky.entity;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

//JPA标识
@Entity
@Table(name = "t_ba_code")
public class BaCode extends IdEntity {

	private String codeCategory;
	private String code;
	private String codeDesc;
	private String codeRemarks;
	private Date effectiveStartDate;
	private Date effectiveEndDate;
	private int code_seq;
	
	// JSR303 BeanValidator的校验规则
	@NotBlank
	public String getCodeCategory() {
		return codeCategory;
	}
	public void setCodeCategory(String codeCategory) {
		this.codeCategory = codeCategory;
	}
	// JSR303 BeanValidator的校验规则
	@NotBlank
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCodeDesc() {
		return codeDesc;
	}
	public void setCodeDesc(String codeDesc) {
		this.codeDesc = codeDesc;
	}
	public String getCodeRemarks() {
		return codeRemarks;
	}
	public void setCodeRemarks(String codeRemarks) {
		this.codeRemarks = codeRemarks;
	}
	public Date getEffectiveStartDate() {
		return effectiveStartDate;
	}
	public void setEffectiveStartDate(Date effectiveStartDate) {
		this.effectiveStartDate = effectiveStartDate;
	}
	public Date getEffectiveEndDate() {
		return effectiveEndDate;
	}
	public void setEffectiveEndDate(Date effectiveEndDate) {
		this.effectiveEndDate = effectiveEndDate;
	}
	public int getCode_seq() {
		return code_seq;
	}
	public void setCode_seq(int code_seq) {
		this.code_seq = code_seq;
	}
	
}
