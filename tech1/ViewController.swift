//
//  ViewController.swift
//  tech
//
//  Created by Kavaleuski Ivan on 05/07/2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "man-talking-on-the-phone") ?? UIImage()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let restoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("Восстановить", for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.minimumScaleFactor = 0.6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let numbOfCallsLabel: UILabel = {
        let label = UILabel()
        label.text = "ЛЮБОЕ КОЛИЧЕСТВО ЗВОНКОВ"
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let selectYourPlanLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберите план для себя"
        label.font = .systemFont(ofSize: 28, weight: .heavy)
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let capabilitiesScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let capabilitiesPageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var weeklyPlanButton: ImageTwoLinedButton = {
        let button = ImageTwoLinedButton()
        button.configure(with: ImageTwoLinedButtonViewModel(primaryText: "Недельный план", secondaryText: "229 в неделю", image: UIImage(systemName: "circle") ?? UIImage()), borderColor: UIColor.white.cgColor, imageColor: .white)
        button.addTarget(self, action: #selector(weeklyPlanButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let annualPlanButton: ImageTwoLinedButton = {
        let button = ImageTwoLinedButton()
        button.configure(with: ImageTwoLinedButtonViewModel(primaryText: "Годовой план", secondaryText: "4390 в неделю", image: UIImage(systemName: "circle") ?? UIImage()), borderColor: UIColor.white.cgColor, imageColor: .white)
        button.addTarget(self, action: #selector(annualPlanButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let continueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.layer.cornerRadius = 35
        button.setTitle("Продолжить", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        
        let imageView = UIImageView()
        button.addSubview(imageView)
        imageView.image = UIImage(systemName: "chevron.compact.right") ?? UIImage()
        imageView.tintColor = .white
        imageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(25)
        }
        
        return button
    }()
    
    let termsButtonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let termsOfUseButton: UIButton = {
        let button = UIButton()
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightGray,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let str = NSAttributedString(string: "Правила использования", attributes: attributes)
        button.setAttributedTitle(str, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        return button
    }()

    let privacyPolicyButton: UIButton = {
        let button = UIButton()
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightGray,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let str = NSAttributedString(string: "Политика конфиденциальности", attributes: attributes)
        button.setAttributedTitle(str, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        return button
    }()
    
    var pageViews = [UIView]()
    let containerView = UIView()
    
    var selectedPlan: Plans?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setupConstraints()
        configureScrollView()
        
        capabilitiesScrollView.delegate = self
    }
    
    @objc func weeklyPlanButtonPressed() {
        if selectedPlan == .weekly {
            weeklyPlanButton.setUnselected()
            selectedPlan = .none
        } else {
            annualPlanButton.setUnselected()
            weeklyPlanButton.setSelected()
            selectedPlan = .weekly
        }
    }
    
    @objc func annualPlanButtonPressed() {
        if selectedPlan == .annual {
            annualPlanButton.setUnselected()
            selectedPlan = .none
        } else {
            weeklyPlanButton.setUnselected()
            annualPlanButton.setSelected()
            selectedPlan = .annual
        }
    }
}

enum Plans {
    case weekly
    case annual
}

private extension ViewController {
    func addSubviews() {
        view.addSubview(backgroundImageView)
        
        view.addSubview(restoreButton)
        view.addSubview(numbOfCallsLabel)
        view.addSubview(selectYourPlanLabel)
        view.addSubview(capabilitiesScrollView)
        view.addSubview(capabilitiesPageControl)
        view.addSubview(buttonsStackView)

        buttonsStackView.addArrangedSubview(weeklyPlanButton)
        buttonsStackView.addArrangedSubview(annualPlanButton)
        buttonsStackView.addArrangedSubview(continueButton)
        
        view.addSubview(termsButtonsStackView)
        
        termsButtonsStackView.addArrangedSubview(termsOfUseButton)
        termsButtonsStackView.addArrangedSubview(privacyPolicyButton)
    }
    
    func setupConstraints() {
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        restoreButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        restoreButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        restoreButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        restoreButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/20).isActive = true
        
        numbOfCallsLabel.topAnchor.constraint(equalTo: restoreButton.bottomAnchor, constant: view.frame.height/15).isActive = true
        numbOfCallsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        numbOfCallsLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/13).isActive = true
        numbOfCallsLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3).isActive = true
        
        selectYourPlanLabel.topAnchor.constraint(equalTo: numbOfCallsLabel.bottomAnchor).isActive = true
        selectYourPlanLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        selectYourPlanLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/12).isActive = true
        selectYourPlanLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 3/4).isActive = true
        
        capabilitiesScrollView.snp.makeConstraints { make in
            make.top.equalTo(selectYourPlanLabel.snp.bottom).inset(-20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(150)
        }
        
        capabilitiesPageControl.topAnchor.constraint(equalTo: capabilitiesScrollView.bottomAnchor).isActive = true
        capabilitiesPageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        capabilitiesPageControl.heightAnchor.constraint(equalTo: capabilitiesScrollView.heightAnchor, multiplier: 1/6).isActive = true
        capabilitiesPageControl.widthAnchor.constraint(equalTo: capabilitiesScrollView.widthAnchor, multiplier: 2/5).isActive = true

//        buttonsStackView.topAnchor.constraint(equalTo: capabilitiesPageControl.bottomAnchor, constant: 60).isActive = true
        buttonsStackView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        buttonsStackView.bottomAnchor.constraint(equalTo: termsButtonsStackView.topAnchor, constant: -10).isActive = true

        termsButtonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        termsButtonsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        termsButtonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        termsButtonsStackView.heightAnchor.constraint(equalTo: restoreButton.heightAnchor).isActive = true
    }
    
    func configureScrollView() {
        let randomView1 = CapabilityCell()
        let randomView2 = CapabilityCell()
        let randomView3 = CapabilityCell()

        pageViews = [randomView1, randomView2, randomView3]
        capabilitiesPageControl.numberOfPages = pageViews.count

        capabilitiesScrollView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(CGFloat(pageViews.count)*UIScreen.main.bounds.width)
            make.height.equalTo(150)
        }

        for (i, pageView) in pageViews.enumerated() {
            containerView.addSubview(pageView)
            pageView.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview()
                make.width.equalTo(UIScreen.main.bounds.width)
                make.leading.equalToSuperview().inset(CGFloat(i)*UIScreen.main.bounds.width)
            }
        }
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        capabilitiesPageControl.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
    }
}

