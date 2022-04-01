//
//  RegisterViewController.swift
//  Catstagram
//
//  Created by Doy Kim on 2022/03/30.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    
    var email: String = ""
    var name: String = ""
    var nickName: String = ""
    var password: String = ""
    
    var userInfo: ((UserInfo) -> Void)?
    
    
    //  유효성 검사를 위한 프로퍼티
    var isValidEmail = false {
        didSet {
            self.validateUserInfo()
        }
    }

    var isValidName = false {
        didSet {
            self.validateUserInfo()
        }
    }
    
    var isValidNickname = false {
        didSet {
            self.validateUserInfo()
        }
    }
    
    var isValidPasssword = false  {
        didSet {
            self.validateUserInfo()
        }
    }
    
    // Textfields
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signupButton: UIButton!
    
    
    //  computed property로 처리하기
    var textFields: [UITextField] {
        [emailTextField, nameTextField, nicknameTextField, passwordTextField]
    }
    
    // button
    @IBOutlet weak var popToLoginButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        
        // 직접 corner radius를 주는 방법
       //signupButton.layer.cornerRadius  = 100
        
        setupAttribute()
        
        // bug fix
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    // MARK: - Actions
    
    @objc
    func textFieldEditingChanged(_ sender: UITextField) {
        
        let text = sender.text ?? ""
        switch sender {
        case emailTextField:
            self.isValidEmail = text.isValidEmail()
            self.email = text
            
        case nameTextField:
            // 글자수만 2자 이상으로 확인
            self.isValidName = text.count > 2
            self.name = text
            
        case nicknameTextField:
            // 글자수만 2자 이상으로 확인
            self.isValidNickname = text.count > 2
            self.nickName = text
            
        case passwordTextField:
            self.isValidPasssword = text.isValidPassword()
            self.password = text
            
        default:
            fatalError("Missing TextField")
        }
    }
    
    @IBAction func backButtonDidTapped(_ sender: UIBarButtonItem) {
        // 뒤로가기. 이전화면으로 돌아가는 것을  Pop View Controller라고 한다.
        // Navigation Controller가 Embeded 되어야 사용할 수 있음.
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func registerButtonDidTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
        let userInfo = UserInfo(
            email: self.email,
            name: self.name,
            nickName: self.nickName,
            password: self.password
        )
        
        self.userInfo?(userInfo)
    }
    
    
    // MARK: - Helpers
    
    // 액션과 연결해주기위한 메소드
    private func setupTextField() {
        
        // addtarget은 해당 영역에서 이벤트가 처리되면 누가 처리할 것인가 하는 메서드
       
        textFields.forEach { tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        }
        

//        // 이걸 모든 텍스트필드에 하면 코드가 중복되므로 배열로 선언한 후 forEach 를 이용해 위처럼 처리해줌

//        emailTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)

    }
    // 사용자가 입력한 회원정보를 확인하고 UI 업데이트(가입 버튼 색상 변경)
    private func validateUserInfo() {
        if isValidEmail
            && isValidName
            && isValidNickname
            && isValidPasssword {
            self.signupButton.isEnabled = true
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = UIColor(named: "facebookColor")
            }
        } else {
            self.signupButton.isEnabled = false
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = UIColor(named: "disabledButtonColor")
            }
        }
        
    }
    private func setupAttribute() {
        // poptologin button 글자별 색상 변경
        
        let text1 = "계정이 있으신가요?"
        let text2 = "로그인"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor!
        
        let attributes = generateButtonAttribute(
            self.popToLoginButton,
            texts: text1, text2,
            fonts: font1, font2,
            colors: color1, color2)
        
        self.popToLoginButton.setAttributedTitle(attributes, for: .normal) // 버튼의 일반적인 상태에서 적용한다는 뜻
        
    }
    
}

// 정규표현식
extension String {
    
    func isValidPassword() -> Bool {
        // 대문자 , 소문자, 특수문자, 숫자 8자 이상일 때 True
        let regularExpression  = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[\\d])(?=.*[~!@#\\$%\\^&\\*])[\\w~!@#\\$%\\^&\\*]{8,}$"

        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    
    func isValidEmail() -> Bool {
        // @ 2글자 이상
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: self)
    }
    
}


