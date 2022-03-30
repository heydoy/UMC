//
//  RegisterViewController.swift
//  Catstagram
//
//  Created by Doy Kim on 2022/03/30.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    //  유효성 검사를 위한 프로퍼티
    var isValidEmail = false
    
    var isValidName = false
    
    var isValidNickname = false
    
    var isValidPasssword = false
    
    // Textfields
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    //  computed property로 처리하기
    var textFields: [UITextField] {
        [emailTextField, nameTextField, nicknameTextField, passwordTextField]
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
    }
    
    // MARK: - Actions
    
    @objc
    func textFieldEditingChanged(_ sender: UITextField) {
        
        let text = sender.text ?? ""
        switch sender {
        case emailTextField:
            print("email")
        case nameTextField:
            print("name")
        case nicknameTextField:
            print("nickname")
        case passwordTextField:
            print("password")
        default:
            fatalError("Missing TextField")
        }
        
        
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
    


}
