
public class Customer{
       
	private String name ;
	private String address;
	private String phoneNo;
	private String email;
	private String type;
	private double balance;
	private String dob;
	private String password;
	private int status;
	private String id_proof_type;
	private String id_proof_no;
	private String accountNo;
	
    public Customer(String name,String address,String phoneNo,String email,String type,double balance,String dob,String id_proof_type,String id_proof_no,String accountNo,String password,int status) {
        this.name=name;
        this.address=address;
        this.phoneNo=phoneNo;
        this.email=email;
        this.type=type;
        this.balance=balance;
        this.dob=dob;
        this.id_proof_type=id_proof_type;
        this.id_proof_no=id_proof_no;
        this.accountNo=accountNo;
        this.password=password;
        this.status=status;
    }



    public String getName() {
        return this.name;
    }
    
    public String getPassword() {
        return this.password;
    }
    
    public boolean setPassword(String new_password,String old) {
        if (this.getPassword().equals(old)) {
        	this.password=new_password;
        	return true;
        }
        else {
        	return false;
        }
    }
    
    
    public void setStatus(int name) {
        this.status = name;
    }

    public int getStatus() {
        return this.status;
    }
    

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNo() {
        return this.phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getBalance() {
        return this.balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public String getDob() {
        return this.dob;
    }

    public boolean setDob(String old_dob,String new_dob) {
        if (this.getDob()==old_dob){
            this.dob=new_dob;
            return true;
        }
        else{
            return false;
        }
    }
    
    public String getId_proof_type() {
		return this.id_proof_type;
	}

	

	public String getId_proof_no() {
		return this.id_proof_no;
	}

	
	public  void setAccountNo (String accountNo) {
        this.accountNo = accountNo;
    }

    public String getAccountNo() {
        return this.accountNo;
    }


    
    public boolean withdraw(double amount){
        if (this.getBalance()>=amount){
            this.setBalance(this.getBalance()-amount);
            return true;
        }
        else{
            return false;
        }

    }

    public boolean deposit(double amount){
        this.setBalance(this.getBalance()+amount);
        return true;
    }

}
