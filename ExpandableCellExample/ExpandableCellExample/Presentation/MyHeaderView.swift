//
//  MyHeaderView.swift
//  ExpandableCellExample
//
//  Created by 김민성 on 5/25/25.
//

import UIKit

class MyHeaderView: UICollectionReusableView {
    
    let background: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title1)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(background)
        background.addSubview(title)
        
        background.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(15)
            make.verticalEdges.equalToSuperview().inset(5)
        }
        
        title.snp.makeConstraints { make in
            make.center.equalToSuperview().inset(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
