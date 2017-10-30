package los.vo;

import java.util.List;

public class LibsVO {
	
	private String pr_libs_no;
	private String pr_no;
	private String pr_grp_id;
	private String pr_arft_id;
	private String pr_version;
	private String pr_prop_yn;
	
	private List<LibsVO> jarList;
	
	public List<LibsVO> getJarList() {
		return jarList;
	}
	public void setJarList(List<LibsVO> jarList) {
		this.jarList = jarList;
	}
	public String getPr_libs_no() {
		return pr_libs_no;
	}
	public void setPr_libs_no(String pr_libs_no) {
		this.pr_libs_no = pr_libs_no;
	}
	public String getPr_no() {
		return pr_no;
	}
	public void setPr_no(String pr_no) {
		this.pr_no = pr_no;
	}
	public String getPr_grp_id() {
		return pr_grp_id;
	}
	public void setPr_grp_id(String pr_grp_id) {
		this.pr_grp_id = pr_grp_id;
	}
	public String getPr_arft_id() {
		return pr_arft_id;
	}
	public void setPr_arft_id(String pr_arft_id) {
		this.pr_arft_id = pr_arft_id;
	}
	public String getPr_version() {
		return pr_version;
	}
	public void setPr_version(String pr_version) {
		this.pr_version = pr_version;
	}
	public String getPr_prop_yn() {
		return pr_prop_yn;
	}
	public void setPr_prop_yn(String pr_prop_yn) {
		this.pr_prop_yn = pr_prop_yn;
	}
	
	
}
