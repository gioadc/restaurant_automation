/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manager;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.FieldExpressionValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ExceptionMapping;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.struts2.convention.annotation.Results;
import sample.RES_User.RES_UserDAO;

/**
 *
 * @author KIETTTSE62520
 */
@ResultPath("/")
@Results({
    @Result(name = "success", location = "manageEmployee.jsp")
    ,
    @Result(name = "input", location = "createNewEmployee.jsp")
})

public class CreateNewEmployeeAction extends ActionSupport {

    private String userID;
    private String password;
    private String name;
    private String phone;
    private int role;
    private final String SUCCESS = "success";
    private final String FAIL = "fail";

    public CreateNewEmployeeAction() {
    }

    @Action(exceptionMappings = {
        @ExceptionMapping(exception = "java.sql.SQLException", result = "input")
    })

    public String execute() throws Exception {
        RES_UserDAO dao = new RES_UserDAO();
        boolean result = dao.createNewEmployee(userID, password, name, phone, role);
        String url = FAIL;
        if (result) {
            url = SUCCESS;
        }
        return url;
    }

    @RequiredStringValidator(trim = true,
            message = "User Id is required")
    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    @RequiredStringValidator(trim = true,
            message = "Password is required")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @RequiredStringValidator(trim = true,
            message = "Fullname is required")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @RequiredStringValidator(trim = true,
            message = "Phone is required")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

}
