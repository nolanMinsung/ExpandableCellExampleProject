//
//  ViewController.swift
//  FoldableCellExample
//
//  Created by 김민성 on 3/24/25.
//

import UIKit

import ExpandableCell
import SnapKit

class ViewController: UIViewController {
    
    private let exCellCollectionVC = MyExpandableCellCollectionVC()
    private var exCellCollectionView: ExpandableCellCollectionView { exCellCollectionVC.collectionView }
    
    private let switchLabel: UILabel = {
        let label = UILabel()
        label.text = "Enable Multi Selection"
        return label
    }()
    private lazy var multiSelectionSwitch: UISwitch = {
        let toggleSwitch = UISwitch()
        toggleSwitch.isOn = false
        toggleSwitch.addTarget(self, action: #selector(toggleMultiSelection), for: .valueChanged)
        return toggleSwitch
    }()
    private lazy var switchStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [switchLabel, multiSelectionSwitch])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(exCellCollectionVC)
        setupViewHierarchy()
        setupStyle()
        setupLayoutConstraints()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        exCellCollectionView.collectionViewLayout.invalidateLayout()
        exCellCollectionView.performBatchUpdates(nil)
    }
    
    private func setupViewHierarchy() {
        view.addSubview(exCellCollectionVC.view)
        view.addSubview(switchStackView)
    }
    
    private func setupStyle() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupLayoutConstraints() {
        exCellCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(150)
        }
        
        switchStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(exCellCollectionView.snp.bottom).offset(40)
        }
    }
    
    private func setupCollectionView() {
        exCellCollectionVC.animationSpeed = .slow
    }
    
    @objc private func toggleMultiSelection() {
        exCellCollectionView.allowsMultipleSelection = multiSelectionSwitch.isOn
    }

}

