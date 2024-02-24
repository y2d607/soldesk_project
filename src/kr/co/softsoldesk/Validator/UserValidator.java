package kr.co.softsoldesk.Validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.UserBean;
 
public class UserValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return UserBean.class.isAssignableFrom(clazz) || ProUserBean.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        String beanName = errors.getObjectName();

        if (target instanceof UserBean && "joinUserBean".equals(beanName)) {
            UserBean userBean = (UserBean) target;
            if (!userBean.isUserEmailExist()) {
                errors.rejectValue("user_email", "DonCheckuserIdExist");
            }
        } else if (target instanceof ProUserBean && "joinProuserBean".equals(beanName)) {
            ProUserBean proUserBean = (ProUserBean) target;
            if (!proUserBean.isProuserEmailExist()) {
                errors.rejectValue("pro_email", "DonCheckProuserIdExist");
            }
        }
    }
}