//
//  HomeViewController.swift
//  ArchitectureSample
//
//  Created by Chamsol Kim on 2023/07/18.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    
    // MARK: - Interface
    
    var actionDelegate: HomeActionDelegate?
    
    
    // MARK: - UI
    
    private let logoutButton = UIButton(type: .system)
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAttributes()
        setUpSubviews()
        setUpConstraints()
    }
    
    
    // MARK: - Setup
    
    private func setUpAttributes() {
        view.backgroundColor = .systemBackground
        
        logoutButton.setTitle("LOGOUT", for: .normal)
        logoutButton.setTitleColor(.white, for: .normal)
        logoutButton.backgroundColor = .tintColor
        logoutButton.addTarget(self, action: #selector(logoutButtonTouched(_:)), for: .touchUpInside)
    }
    
    private func setUpSubviews() {
        view.addSubview(logoutButton)
    }
    
    private func setUpConstraints() {
        logoutButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}


// MARK: - Action

private extension HomeViewController {
    
    @objc
    func logoutButtonTouched(_ sender: UIButton) {
        actionDelegate?.logoutButtonTouched()
    }
}
