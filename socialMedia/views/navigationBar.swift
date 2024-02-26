//
//  navigationBar.swift
//  socialMedia
//
//  Created by Zhamilia Zhanakeeva on 26/2/24.
//

import UIKit
class NavigationBar: UIView {
    private let labelStack = MakerView().makerStack()
    private let generalLabel = MakerView().makerLabel(text: "General", size: 18, weight: .bold, textColor: .systemRed, textAlignment: .center)
    private let systemLabel = MakerView().makerLabel(text: "System", size: 18, textColor: .gray, textAlignment: .center)
    
    private let lineStack = MakerView().makerStack()
    let generalLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    let systemLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        labelStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(labelStack)
        NSLayoutConstraint.activate([
            labelStack.topAnchor.constraint(equalTo: topAnchor),
            labelStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelStack.heightAnchor.constraint(equalToConstant: 30)
        ])
        labelStack.addArrangedSubview(generalLabel)
        labelStack.addArrangedSubview(systemLabel)
        
        lineStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(lineStack)
        NSLayoutConstraint.activate([
            lineStack.topAnchor.constraint(equalTo: labelStack.bottomAnchor),
            lineStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineStack.heightAnchor.constraint(equalToConstant: 5)
        ])
        lineStack.addArrangedSubview(generalLineView)
        lineStack.addArrangedSubview(systemLineView)
        
        generalLineView.heightAnchor.constraint(equalToConstant: 3).isActive = true
        systemLineView.heightAnchor.constraint(equalToConstant: 3).isActive = true
    }
}
