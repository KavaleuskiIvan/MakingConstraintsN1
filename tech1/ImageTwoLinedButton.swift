//
//  ImageTwoLinedButton.swift
//  tech
//
//  Created by Kavaleuski Ivan on 05/07/2022.
//

import UIKit

struct ImageTwoLinedButtonViewModel {
    let primaryText: String
    let secondaryText: String
    let image: UIImage
}

class ImageTwoLinedButton: UIButton {
    let primaryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    let secondaryText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    let circleImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(primaryLabel)
        addSubview(secondaryText)
        addSubview(circleImage)
        
        clipsToBounds = true
        layer.cornerRadius = 8
        layer.borderWidth = 1
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: ImageTwoLinedButtonViewModel, borderColor: CGColor, imageColor: UIColor) {
        primaryLabel.text = viewModel.primaryText
        secondaryText.text = viewModel.secondaryText
        circleImage.image = viewModel.image
        circleImage.tintColor = imageColor
        layer.borderColor = UIColor.white.cgColor
    }
    
    func setSelected() {
        circleImage.image = UIImage(systemName: "circle.inset.filled") ?? UIImage()
        circleImage.tintColor = .red
        layer.borderColor = UIColor.red.cgColor
    }
    
    func setUnselected() {
        circleImage.image = UIImage(systemName: "circle") ?? UIImage()
        circleImage.tintColor = .white
        layer.borderColor = UIColor.white.cgColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(30)
            make.centerY.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        primaryLabel.snp.makeConstraints { make in
            make.trailing.equalTo(circleImage.snp.leading)
            make.top.equalToSuperview().inset(5)
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
        secondaryText.snp.makeConstraints { make in
            make.trailing.equalTo(circleImage.snp.leading)
            make.bottom.equalToSuperview().inset(5)
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
    }
}
