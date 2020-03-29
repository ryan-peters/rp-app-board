//
//  RPAppBoardTableViewCell.swift
//
//  Created by Ryan Peters on 2/1/19.
//  Copyright © 2019 Ryan Peters. All rights reserved.
//

import UIKit

struct RPAppInfo {
    var iconFilename: String
    var title: String?
    var description: String?
}

class RPAppBoardTableViewCell: UITableViewCell {

    var iconView = UIImageView(frame: .zero)
    var titleLabel = UILabel(frame: .zero)
    var descriptionContainer = UIView(frame: .zero)
    var descriptionLabel = UILabel(frame: .zero)
    var backgroundImage = UIImageView(frame: .zero)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension RPAppBoardTableViewCell {
    func setupViews() {
        clipsToBounds = true
        
        iconView.layer.cornerRadius = 18
        iconView.clipsToBounds = true
        
        titleLabel.font = UIFont(name: "Helvetica-Bold", size: 22.0)
        
        descriptionLabel.font = UIFont(name: "Helvetica-Thin", size: 13.0)
        descriptionLabel.numberOfLines = 0
        
        descriptionContainer.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        descriptionContainer.layer.cornerRadius = 10
        descriptionContainer.layer.shadowColor = UIColor.black.cgColor
        descriptionContainer.layer.shadowOffset = CGSize.zero
        descriptionContainer.layer.shadowOpacity = 0.2
        
        backgroundImage.alpha = 0.3
        
        addSubview(backgroundImage)
        addSubview(iconView)
        addSubview(titleLabel)
        addSubview(descriptionContainer)
        addSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(bounds.width / -4)).isActive = true
        backgroundImage.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        backgroundImage.heightAnchor.constraint(equalTo: widthAnchor).isActive = true
        backgroundImage.widthAnchor.constraint(equalTo: widthAnchor).isActive = true

        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(5)).isActive = true
        iconView.leftAnchor.constraint(equalTo: leftAnchor, constant: CGFloat(5)).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: CGFloat(100)).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: CGFloat(100)).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(10)).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: CGFloat(10)).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: CGFloat(25)).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: CGFloat(-5)).isActive = true
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: CGFloat(-50)).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: CGFloat(-50)).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: CGFloat(-15)).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat(-15)).isActive = true
        
        descriptionContainer.translatesAutoresizingMaskIntoConstraints = false
        descriptionContainer.topAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: CGFloat(-5)).isActive = true
        descriptionContainer.leftAnchor.constraint(equalTo: descriptionLabel.leftAnchor, constant: CGFloat(-5)).isActive = true
        descriptionContainer.rightAnchor.constraint(equalTo: descriptionLabel.rightAnchor, constant: CGFloat(5)).isActive = true
        descriptionContainer.bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: CGFloat(5)).isActive = true
    }
}

extension RPAppBoardTableViewCell {
    func updateViews(with appInfo: RPAppInfo) {
        titleLabel.text = appInfo.title
        descriptionLabel.text = appInfo.description
        
        let image = UIImage(named: appInfo.iconFilename)
        iconView.image = image
        
        backgroundImage.image = image
    }
}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }
}
