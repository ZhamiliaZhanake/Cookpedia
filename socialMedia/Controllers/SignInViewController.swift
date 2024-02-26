//
//  ViewController.swift
//  socialMedia
//
//  Created by Zhamilia Zhanakeeva on 25/2/24.
//

import UIKit
class SignInViewController: UIViewController {
    private let createPasswdLabel = MakerView().makerLabel(text: "Create New Password", size: 24, weight: .bold)
    private let passwordImage = MakerView().makerImageView(image: UIImage(named: "password"))
    private let enterPasswdLabel = MakerView().makerLabel(text: "Enter your new password. If you forget it, then you have to do forgot password.")
    private let passwordLabel = MakerView().makerLabel(text: "Password", weight: .bold)
    private let passwordTF: UITextField = {
        let tf = UITextField()
        tf.layer.cornerRadius = 16
        tf.translatesAutoresizingMaskIntoConstraints = false
        let rightView = UIButton()
        rightView.setImage(UIImage(systemName: "eye"), for: .normal)
        rightView.tintColor = .systemRed
        rightView.addTarget(self, action: #selector(eyeBtnTapped), for: .touchUpInside)
        tf.rightView = rightView
        tf.rightViewMode = .always
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.red
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        tf.addSubview(bottomLine)
        NSLayoutConstraint.activate([
            bottomLine.heightAnchor.constraint(equalToConstant: 1),
            bottomLine.leadingAnchor.constraint(equalTo: tf.leadingAnchor),
            bottomLine.trailingAnchor.constraint(equalTo: tf.trailingAnchor),
            bottomLine.bottomAnchor.constraint(equalTo: tf.bottomAnchor)
        ])
        return tf
    }()
    
    private let confirmPasswdLabel = MakerView().makerLabel(text: "Confirm password", weight: .bold)
    private let confirmPasswdTF: UITextField = {
        let tf = UITextField()
        tf.layer.cornerRadius = 16
        tf.translatesAutoresizingMaskIntoConstraints = false
        let rightView = UIButton()
        rightView.setImage(UIImage(systemName: "eye"), for: .normal)
        rightView.tintColor = .systemRed
        rightView.addTarget(self, action: #selector(eyeButtonTapped), for: .touchUpInside)
        tf.rightView = rightView
        tf.rightViewMode = .always
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.red
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        tf.addSubview(bottomLine)
        NSLayoutConstraint.activate([
            bottomLine.heightAnchor.constraint(equalToConstant: 1),
            bottomLine.leadingAnchor.constraint(equalTo: tf.leadingAnchor),
            bottomLine.trailingAnchor.constraint(equalTo: tf.trailingAnchor),
            bottomLine.bottomAnchor.constraint(equalTo: tf.bottomAnchor)
        ])
        return tf
    }()
    private let checkBoxBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        button.tintColor = .systemRed
        return button
    }()
    private let rememberLabel = MakerView().makerLabel(text: "Remember me")
    private let continueBtn = MakerView().makerButton(title: "Continue")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .white
        checkBoxBtn.addTarget(self, action: #selector(checkBoxBtnTapped), for: .touchUpInside)
        continueBtn.addTarget(self, action: #selector(continueBtnTapped), for: .touchUpInside)
        passwordTF.addTarget(self, action: #selector(validateTF), for: .editingChanged)
        confirmPasswdTF.addTarget(self, action: #selector(validateTF), for: .editingChanged)
        
    }
    private func setupUI() {
        view.addSubview(createPasswdLabel)
        NSLayoutConstraint.activate([
            createPasswdLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            createPasswdLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        view.addSubview(passwordImage)
        NSLayoutConstraint.activate([
            passwordImage.centerYAnchor.constraint(equalTo: createPasswdLabel.centerYAnchor),
            passwordImage.leadingAnchor.constraint(equalTo: createPasswdLabel.trailingAnchor, constant: 10),
            passwordImage.heightAnchor.constraint(equalToConstant: 45),
            passwordImage.widthAnchor.constraint(equalToConstant: 45)
        ])
        view.addSubview(enterPasswdLabel)
        NSLayoutConstraint.activate([
            enterPasswdLabel.topAnchor.constraint(equalTo: createPasswdLabel.bottomAnchor, constant: 15),
            enterPasswdLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            enterPasswdLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        view.addSubview(passwordLabel)
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: enterPasswdLabel.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        view.addSubview(passwordTF)
        NSLayoutConstraint.activate([
            passwordTF.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTF.heightAnchor.constraint(equalToConstant: 40)
        ])
        view.addSubview(confirmPasswdLabel)
        NSLayoutConstraint.activate([
            confirmPasswdLabel.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 20),
            confirmPasswdLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        view.addSubview(confirmPasswdTF)
        NSLayoutConstraint.activate([
            confirmPasswdTF.topAnchor.constraint(equalTo: confirmPasswdLabel.bottomAnchor, constant: 5),
            confirmPasswdTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            confirmPasswdTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            confirmPasswdTF.heightAnchor.constraint(equalToConstant: 40)
        ])
        view.addSubview(checkBoxBtn)
        NSLayoutConstraint.activate([
            checkBoxBtn.topAnchor.constraint(equalTo: confirmPasswdTF.bottomAnchor, constant: 20),
            checkBoxBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 2),
            checkBoxBtn.heightAnchor.constraint(equalToConstant: 50),
            checkBoxBtn.widthAnchor.constraint(equalToConstant: 50)
        ])
        view.addSubview(rememberLabel)
        NSLayoutConstraint.activate([
            rememberLabel.centerYAnchor.constraint(equalTo: checkBoxBtn.centerYAnchor),
            rememberLabel.leadingAnchor.constraint(equalTo: checkBoxBtn.trailingAnchor)
        ])
        view.addSubview(continueBtn)
        NSLayoutConstraint.activate([
            continueBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            continueBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            continueBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            continueBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    @objc func validateTF(_ sender: UITextField){
        guard let text = sender.text else {return}
        if text.count >= 4 && passwordTF.text == confirmPasswdTF.text {
            continueBtn.isEnabled = true
            continueBtn.backgroundColor = .red
        } else {
            continueBtn.isEnabled = false
            continueBtn.backgroundColor = .gray
        }
    }
    @objc func checkBoxBtnTapped() {
        if checkBoxBtn.currentImage == UIImage(systemName: "checkmark.square") {
            checkBoxBtn.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        } else {
            checkBoxBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
    }
    @objc func eyeBtnTapped(_ sender: UIButton) {
        passwordTF.isSecureTextEntry = !passwordTF.isSecureTextEntry
    }
    @objc func eyeButtonTapped(_ sender: UIButton) {
        confirmPasswdTF.isSecureTextEntry = !confirmPasswdTF.isSecureTextEntry
    }
    @objc func continueBtnTapped() {
        let vc = NotificationViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
