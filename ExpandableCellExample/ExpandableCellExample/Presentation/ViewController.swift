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
    
    private var sectionTitles: [String] = ["⚙️", "🎬"]
    private var settingDataList: [DataModel] = dummySettings
    private var movieList: [Movie] = movieData
    
    private var exCellCollectionView = MyCollectionView()
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
        view.addSubview(exCellCollectionView)
        view.addSubview(switchStackView)
    }
    
    private func setupStyle() {
        view.backgroundColor = .systemBackground
        exCellCollectionView.isMultipleTouchEnabled = true
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
        exCellCollectionView.animationSpeed = .slow

        exCellCollectionView.register(MyExpandableCell.self, forCellWithReuseIdentifier: "MyExpandableCell")
        exCellCollectionView.register(
            MyHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "MyHeaderView"
        )
        
        exCellCollectionView.dataSource = self
        // exCellCollectionView.delegate = self 🚨 Error!
        
    }
    
    @objc private func toggleMultiSelection() {
        exCellCollectionView.allowsMultipleSelection = multiSelectionSwitch.isOn
    }

}


extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return settingDataList.count
        } else {
            return movieList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "MyExpandableCell", for: indexPath
        ) as? MyExpandableCell else { fatalError() }
        
        if indexPath.section == 0 {
            let data = self.settingDataList[indexPath.item]
            cell.configure(with: data)
        } else {
            let data = self.movieList[indexPath.item]
            cell.configure(with: data)
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MyHeaderView", for: indexPath) as? MyHeaderView else { fatalError() }
        view.title.text = sectionTitles[indexPath.section]
        return view
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: 5, height: 100)
    }
    
}

