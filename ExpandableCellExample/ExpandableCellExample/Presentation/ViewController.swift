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
    
    let exCellCollectionViewController = MyExpandableCellCollectionVC()
//    var exCellCollectionView: ExpandableCellCollectionView { exCellCollectionViewController.defaultCollectionView }
    var exCellCollectionView: ExpandableCellCollectionView { exCellCollectionViewController.collectionView }
    
    let switchName: UILabel = {
        let label = UILabel()
        label.text = "Enable Multi Selection"
        return label
    }()
    lazy var toggleSwitch: UISwitch = {
        let toggleSwitch = UISwitch()
        toggleSwitch.isOn = false
        toggleSwitch.addTarget(self, action: #selector(toggleMultiSelection), for: .valueChanged)
        return toggleSwitch
    }()
    lazy var switchStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [switchName, toggleSwitch])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(exCellCollectionViewController)
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
        view.addSubview(exCellCollectionViewController.view)
        view.addSubview(switchStackView)
    }
    
    private func setupStyle() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupLayoutConstraints() {
        exCellCollectionView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(150)
        }
        
        switchStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(exCellCollectionView.snp.bottom).offset(40)
        }
        
    }
    
    private func setupCollectionView() {
        exCellCollectionViewController.animationSpeed = .slow
    }
    
    @objc private func toggleMultiSelection() {
        exCellCollectionView.allowsMultipleSelection = toggleSwitch.isOn
    }

}

