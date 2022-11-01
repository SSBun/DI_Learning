//
//  DIViewController.swift
//  DI_Learning
//
//  Created by caishilin on 2022/11/1.
//

import UIKit

class DIViewController: UIViewController {
    private let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        titleLabel.font = .systemFont(ofSize: 15)
        titleLabel.textColor = .black
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.centerX.top.equalToSuperview()
            $0.height.equalTo(40)
        }
        titleLabel.text = NSStringFromClass(Self.self)
    }
}
