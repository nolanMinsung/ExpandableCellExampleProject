//
//  MyExpandableCell.swift
//  FoldableCellExample
//
//  Created by 김민성 on 3/24/25.
//

import UIKit

import ExpandableCell
import SnapKit

final class MyExpandableCell: ExpandableCell {
    
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let chevron = UIImageView(image: UIImage(systemName: "chevron.down"))
    let descriptionBackground = UIView()
    let summaryLabel = UILabel()
    let separator = UIView()
    let detailLabel = UILabel()
    
    lazy var detailStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [summaryLabel, separator, detailLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViewHierarchy()
        setupViewStyle()
        setupLayoutConstraints()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func animateExpansion() {
        chevron.transform = CGAffineTransform(rotationAngle: .pi * 0.99)
        descriptionBackground.alpha = 1
    }
    
    override func animateCollapse() {
        chevron.transform = .identity
        descriptionBackground.alpha = 0
    }
    
    override func applyExpansionState() {
//        chevron.transform = CGAffineTransform(rotationAngle: .pi * 0.99)
//        descriptionBackground.alpha = 1
    }
    
    override func applyCollapsingState() {
//        chevron.transform = .identity
//        descriptionBackground.alpha = 0
    }
    
    private func setupViewHierarchy() {
        // show image and title at 'mainContentView'
        mainContentView.addSubview(imageView)
        mainContentView.addSubview(titleLabel)
        mainContentView.addSubview(chevron)
        
        // show summary and detail description at 'detailContentView'
        detailContentView.addSubview(descriptionBackground)
        detailContentView.addSubview(separator)
        descriptionBackground.addSubview(detailStackView)
    }
    
    private func setupViewStyle() {
        contentView.backgroundColor = .systemGray5
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 15
        
        imageView.contentMode = .scaleAspectFit
        chevron.contentMode = .scaleAspectFit
        
        [titleLabel, summaryLabel, detailLabel].forEach {
            $0.adjustsFontForContentSizeCategory = true
            $0.textAlignment = .left
        }
        [summaryLabel, detailLabel].forEach { $0.numberOfLines = 0 }
        
        titleLabel.font = .preferredFont(forTextStyle: .title2)
        summaryLabel.font = .preferredFont(forTextStyle: .title3)
        detailLabel.font = .preferredFont(forTextStyle: .body)
        
        descriptionBackground.backgroundColor = .systemGray4
        descriptionBackground.clipsToBounds = true
        descriptionBackground.layer.cornerRadius = 10
        
        separator.clipsToBounds = true
        separator.layer.cornerRadius = 1
        separator.backgroundColor = .systemGray2
    }
    
    private func setupLayoutConstraints() {
        imageView.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.leading.equalToSuperview().inset(15)
            make.size.equalTo(35)
        }
        
        titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        titleLabel.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(15)
            make.leading.equalTo(imageView.snp.trailing).offset(15).priority(.high)
            make.trailing.equalTo(chevron.snp.leading).offset(-15)
        }
        
        chevron.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.trailing.equalToSuperview().inset(15)
            make.size.equalTo(25)
        }
        
        descriptionBackground.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.bottom.equalToSuperview().inset(12)
        }
        
        separator.snp.makeConstraints { make in
            make.height.equalTo(2)
        }
        
        detailStackView.translatesAutoresizingMaskIntoConstraints = false
        detailStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(15).priority(.init(999))
        }
        
    }
    
    internal func configure(with data: DataModel) {
        self.imageView.image = data.icon
        self.titleLabel.text = data.title
        self.summaryLabel.text = data.summary
        self.detailLabel.text = data.details
    }
    
    internal func configure(with movie: Movie) {
        self.imageView.image = movie.icon
        self.titleLabel.text = movie.title
        self.summaryLabel.text = movie.shortDescription
        self.detailLabel.text = movie.detailedDescription
    }
    
}
