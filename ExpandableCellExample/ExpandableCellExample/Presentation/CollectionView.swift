//
//  CollectionView.swift
//  ExpandableCellExample
//
//  Created by 김민성 on 4/12/25.
//

import UIKit

import ExpandableCell

final class MyCollectionView: ExpandableCellCollectionView {
    
    init() {
        super.init(sectionInsetInVertical: 20, horizontal: 20, minimumLineSpacing: 20)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

/// If you need to implement additional behavior related to `UICollectionViewDelegate` or `UIScrollViewDelegate`, subclass `ExpandableCellCollectionView` and implement the appropriate delegate methods.
extension MyCollectionView {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("collectionView did Select at \(indexPath)")
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("collectinoView did Deselect at \(indexPath)")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollView did scroll: \(scrollView.contentOffset)")
    }
    
}

