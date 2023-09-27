package dto;

public class UserManageDTO {
	private String id;
	private boolean banned;
	
	
	public UserManageDTO() {
		super();
	}
	public UserManageDTO(String id, boolean banned) {
		super();
		this.id = id;
		this.banned = banned;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public boolean isBanned() {
		return banned;
	}
	public void setBanned(boolean banned) {
		this.banned = banned;
	}
	
	

}
