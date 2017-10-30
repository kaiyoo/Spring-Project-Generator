package los.vo;

import java.util.List;

public class GenVO {

	private String pr_gen_no;
	private String pr_no;
	private String pr_tbl_nm;
	private String pr_ctr_yn;
	private String pr_svc_yn;
	private String pr_dao_yn;
	private String pr_xml_yn;
	private String pr_vo_yn;
	private String yn_chk_tbl;
	private List<GenVO> createTblList;
	
	public String getPr_gen_no() {
		return pr_gen_no;
	}
	public void setPr_gen_no(String pr_gen_no) {
		this.pr_gen_no = pr_gen_no;
	}
	public String getPr_no() {
		return pr_no;
	}
	public void setPr_no(String pr_no) {
		this.pr_no = pr_no;
	}
	public String getPr_tbl_nm() {
		return pr_tbl_nm;
	}
	public void setPr_tbl_nm(String pr_tbl_nm) {
		this.pr_tbl_nm = pr_tbl_nm;
	}
	public String getPr_ctr_yn() {
		return pr_ctr_yn;
	}
	public void setPr_ctr_yn(String pr_ctr_yn) {
		this.pr_ctr_yn = pr_ctr_yn;
	}
	public String getPr_svc_yn() {
		return pr_svc_yn;
	}
	public void setPr_svc_yn(String pr_svc_yn) {
		this.pr_svc_yn = pr_svc_yn;
	}
	public String getPr_dao_yn() {
		return pr_dao_yn;
	}
	public void setPr_dao_yn(String pr_dao_yn) {
		this.pr_dao_yn = pr_dao_yn;
	}
	public String getPr_xml_yn() {
		return pr_xml_yn;
	}
	public void setPr_xml_yn(String pr_xml_yn) {
		this.pr_xml_yn = pr_xml_yn;
	}
	public String getPr_vo_yn() {
		return pr_vo_yn;
	}
	public void setPr_vo_yn(String pr_vo_yn) {
		this.pr_vo_yn = pr_vo_yn;
	}
	public String getYn_chk_tbl() {
		return yn_chk_tbl;
	}
	public void setYn_chk_tbl(String yn_chk_tbl) {
		this.yn_chk_tbl = yn_chk_tbl;
	}
	public List<GenVO> getCreateTblList() {
		return createTblList;
	}
	public void setCreateTblList(List<GenVO> createTblList) {
		this.createTblList = createTblList;
	}
	
	
}
