//
//  MyExpandableCellCollectionVC.swift
//  FoldableCellExample
//
//  Created by 김민성 on 3/25/25.
//

import UIKit

import ExpandableCell

class MyExpandableCellCollectionVC: ExpandableCellCollectionViewController {
    
    private var sectionTitles: [String] = ["⚙️", "🎬"]
    private var settingDataList: [DataModel] = dummySettings
    private var movieList: [Movie] = movieData
    
    init() {
        super.init(
            sectionInset: .init(top: 15, left: 15, bottom: 15, right: 15),
            minimumLineSpacing: 15
        )
        
        // additional settings during initializing...
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // register cell for collection view.
        self.collectionView.register(MyExpandableCell.self, forCellWithReuseIdentifier: "MyExpandableCell")
        self.collectionView.register(MyHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MyHeaderView")
    }
    
}

// implement methods related to UICollectionViewDataSource
extension MyExpandableCellCollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return settingDataList.count
        } else {
            return movieList.count
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView,
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
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MyHeaderView", for: indexPath) as? MyHeaderView else { fatalError() }
        view.title.text = sectionTitles[indexPath.section]
        return view
    }
    
}

extension MyExpandableCellCollectionVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: 5, height: 100)
    }
    
}
