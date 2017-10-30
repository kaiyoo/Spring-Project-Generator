package los.vo;

import java.util.List;

public class MavVO {
	private String pr_mav_no;
	private String pr_no;
	private String pr_mav_rep_id;
	private String pr_mav_rep_url;
	private String pr_mav_rep_rel;
	private String pr_mav_rep_snap;
	
	
	private List<MavVO> mavenList;

	
	public List<MavVO> getMavenList() {
		return mavenList;
	}
	public void setMavenList(List<MavVO> mavenList) {
		this.mavenList = mavenList;
	}
	public String getPr_mav_no() {
		return pr_mav_no;
	}
	public void setPr_mav_no(String pr_mav_no) {
		this.pr_mav_no = pr_mav_no;
	}
	public String getPr_no() {
		return pr_no;
	}
	public void setPr_no(String pr_no) {
		this.pr_no = pr_no;
	}
	public String getPr_mav_rep_id() {
		return pr_mav_rep_id;
	}
	public void setPr_mav_rep_id(String pr_mav_rep_id) {
		this.pr_mav_rep_id = pr_mav_rep_id;
	}
	public String getPr_mav_rep_url() {
		return pr_mav_rep_url;
	}
	public void setPr_mav_rep_url(String pr_mav_rep_url) {
		this.pr_mav_rep_url = pr_mav_rep_url;
	}
	public String getPr_mav_rep_rel() {
		return pr_mav_rep_rel;
	}
	public void setPr_mav_rep_rel(String pr_mav_rep_rel) {
		this.pr_mav_rep_rel = pr_mav_rep_rel;
	}
	public String getPr_mav_rep_snap() {
		return pr_mav_rep_snap;
	}
	public void setPr_mav_rep_snap(String pr_mav_rep_snap) {
		this.pr_mav_rep_snap = pr_mav_rep_snap;
	}
	
}
