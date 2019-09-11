
import UIKit
import Cartography

class LoginView: UIView {
    
    var tapLoginButton: ((_ username: String, _ password: String) -> ())?
    
    let userNameTextField = { () -> UITextField in
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.accessibilityLabel = "Username"
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        textField.autocapitalizationType = .none
        return textField
    }()
    
    let passwordTextField = { () -> UITextField in
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.accessibilityLabel = "Password"
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let loginButton = { () -> UIButton in
        let button = UIButton()
        button.accessibilityLabel = "Login"
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.isHidden = true
        return button
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        build()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func build() {
        buildViewHierarchy()
        buildConstrains()
        setup()
    }
    
    func buildViewHierarchy() {
        addSubview(userNameTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
    }
    
    func buildConstrains() {
        
        let verticalMargin: CGFloat = 16.0
        let horizontalMargin: CGFloat = 8.0
        
        constrain(self, userNameTextField, passwordTextField, loginButton) { view, username, password, login in
            
            username.top == view.top + verticalMargin
            username.left == view.left + horizontalMargin
            username.right == view.right - horizontalMargin
            
            password.top == username.bottom + verticalMargin
            password.left == username.left
            password.right == username.right
            
            login.top == password.bottom + verticalMargin
            login.left == password.left
            login.right == password.right
            login.bottom == view.bottom - verticalMargin
        }
    }
    
    func setup() {
        self.loginButton.addTarget(self, action: #selector(tapLogin), for: .touchUpInside)
    }
    
    func tapLogin() {
        
        guard let username = userNameTextField.text, let password = passwordTextField.text else {
            return
        }
        
        self.tapLoginButton?(username, password)
    }
    
    func textFieldDidChange(_ textField: UITextField) {
        if self.userNameTextField.isEmpty() || self.passwordTextField.isEmpty() {
            self.loginButton.isHidden = true
        } else {
            self.loginButton.isHidden = false
        }
    }
}
