//
//  CapabilityCell.swift
//  tech1
//
//  Created by Kavaleuski Ivan on 06/07/2022.
//

import UIKit
import SnapKit

class CapabilityCell: UIView {
    
    let firstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "phone.fill.arrow.down.left") ?? UIImage()
        imageView.tintColor = .white
        return imageView
    }()
    
    let firstLabel: UILabel = {
        let label = UILabel()
        label.text = "Запись входящих звонков"
        label.textColor = .white
        return label
    }()
    
    let secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "phone.arrow.up.right.fill") ?? UIImage()
        imageView.tintColor = .white
        return imageView
    }()
    
    let secondLabel: UILabel = {
        let label = UILabel()
        label.text = "Запись исходящих звонков"
        label.textColor = .white
        return label
    }()
    
    let thirdImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "doc.richtext") ?? UIImage()
        imageView.tintColor = .white
        return imageView
    }()
    
    let thirdLabel: UILabel = {
        let label = UILabel()
        label.text = "Транскрипция записи"
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        
    }
    
    func makeConstraints() {
        addSubview(firstImageView)
        addSubview(firstLabel)
        addSubview(secondImageView)
        addSubview(secondLabel)
        addSubview(thirdImageView)
        addSubview(thirdLabel)
        
        firstImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(10)
            make.width.height.equalTo(35)
        }
        firstLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(110)
            make.top.equalToSuperview().inset(10)
            make.trailing.equalToSuperview()
            make.height.equalTo(35)
        }
        
        secondImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(50)
            make.width.height.equalTo(35)
        }
        secondLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(110)
            make.top.equalToSuperview().inset(50)
            make.trailing.equalToSuperview()
            make.height.equalTo(35)
        }
        
        thirdImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(90)
            make.width.height.equalTo(35)
        }
        thirdLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(110)
            make.top.equalToSuperview().inset(90)
            make.trailing.equalToSuperview()
            make.height.equalTo(35)
        }
    }
}
