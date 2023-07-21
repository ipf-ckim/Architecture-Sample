//
//  LoginViewController.swift
//  ArchitectureSample
//
//  Created by Chamsol Kim on 2023/07/18.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    // MARK: - Attribute
    
    private lazy var actionDelegate: any LoginActionDelegate = LoginPresenter(
        presentationDelegate: self,
        router: LoginRouter(window: view.window!)
    )
    
    
    // MARK: - UI
    
    private let titleLabel = UILabel()
    private let idTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = UIButton(type: .system)
    private let stackView = UIStackView()
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAttributes()
        setUpSubviews()
        setUpConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        actionDelegate.loginViewDidAppear()
    }
    
    
    // MARK: - Setup
    
    private func setUpAttributes() {
        view.backgroundColor = .systemBackground
        
        titleLabel.text = "Log In"
        titleLabel.font = .systemFont(ofSize: 48, weight: .bold)
        titleLabel.textAlignment = .center
        
        idTextField.placeholder = "ID"
        idTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "PASSWORD"
        passwordTextField.borderStyle = .roundedRect
        
        loginButton.setTitle("LOGIN", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTouched(_:)), for: .touchUpInside)
        loginButton.backgroundColor = .black
        loginButton.layer.cornerRadius = 16
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 8
    }
    
    private func setUpSubviews() {
        view.addSubview(stackView)
        [titleLabel, idTextField, passwordTextField, loginButton]
            .forEach(stackView.addArrangedSubview(_:))
    }
    
    private func setUpConstraints() {
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        idTextField.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        
        loginButton.snp.makeConstraints { make in
            make.height.equalTo(54)
        }
    }
    
    
    // MARK: - Touch Event Handling
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        view.endEditing(true)
    }
}


// MARK: - Action

private extension LoginViewController {
    
    @objc
    func loginButtonTouched(_ sender: UIButton) {
        actionDelegate.loginButtonTouched(
            id: idTextField.text ?? "",
            password: passwordTextField.text ?? ""
        )
    }
}


// MARK: - LoginPresentationDelegate

extension LoginViewController: LoginPresentationDelegate {
    
    func showErrorAlert(viewModel: LoginPresenter.Login.ViewModel) {
        let alert = UIAlertController(
            title: viewModel.errorTitle,
            message: viewModel.errorMessage,
            preferredStyle: .alert
        )
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
