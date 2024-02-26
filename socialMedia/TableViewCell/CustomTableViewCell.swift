//
//  CustomTableViewCell.swift
//  socialMedia
//
//  Created by Zhamilia Zhanakeeva on 26/2/24.
//

import UIKit
class CustomTableViewCell: UITableViewCell {
    private let bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        bgView.translatesAutoresizingMaskIntoConstraints = false
        return bgView
    }()
    private let userLabel = MakerView().makerLabel(weight: .bold)
    private let userImage = MakerView().makerImageView()
    private let foodImage = MakerView().makerImageView()
    private let userAction = MakerView().makerLabel()
    private let dateLabel = MakerView().makerLabel(size: 14, textColor: .darkGray)
    private let timeLabel = MakerView().makerLabel(size: 14, textColor: .darkGray)
    private let threeDotsBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "threeDots"), for: .normal)
        return button
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bgView)
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo:contentView.topAnchor),
            bgView.leadingAnchor.constraint(equalTo:contentView.leadingAnchor),
            bgView.trailingAnchor.constraint(equalTo:contentView.trailingAnchor),
            bgView.bottomAnchor.constraint(equalTo:contentView.bottomAnchor),
            bgView.heightAnchor.constraint(equalToConstant: 120)
        ])
        contentView.addSubview(userImage)
        NSLayoutConstraint.activate([
            userImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            userImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            userImage.heightAnchor.constraint(equalToConstant: 60),
            userImage.widthAnchor.constraint(equalToConstant: 60)
        ])
        contentView.addSubview(userLabel)
        NSLayoutConstraint.activate([
            userLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            userLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 10)
        ])
        contentView.addSubview(threeDotsBtn)
        NSLayoutConstraint.activate([
            threeDotsBtn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            threeDotsBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            threeDotsBtn.heightAnchor.constraint(equalToConstant: 20),
            threeDotsBtn.widthAnchor.constraint(equalToConstant: 20)
        ])
        contentView.addSubview(foodImage)
        NSLayoutConstraint.activate([
            foodImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            foodImage.trailingAnchor.constraint(equalTo: threeDotsBtn.leadingAnchor, constant: -10),
            foodImage.heightAnchor.constraint(equalToConstant: 80),
            foodImage.widthAnchor.constraint(equalToConstant: 80)
        ])
        contentView.addSubview(userAction)
        NSLayoutConstraint.activate([
            userAction.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 5),
            userAction.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 10),
            userAction.trailingAnchor.constraint(equalTo: foodImage.leadingAnchor, constant: 5)
        ])
        contentView.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            dateLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 10)
        ])
        contentView.addSubview(timeLabel)
        NSLayoutConstraint.activate([
            timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            timeLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 15)
        ])
    }
    func sendData(name: String, image: UIImage?,foodPicture: UIImage?, action: String, date: String, time: String) {
        userImage.image = image
        userLabel.text = name
        foodImage.image = foodPicture
        userAction.text = action
        dateLabel.text = date
        timeLabel.text = time
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

   


