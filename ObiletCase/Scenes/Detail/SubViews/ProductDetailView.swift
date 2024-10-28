//
//  ProductDetailView.swift
//  ObiletCase
//
//  Created by Şehriban Yıldırım on 28.10.2024.
//

import UIKit

class ProductDetailView: UIView {

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = false
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = UIColor.appBlack
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment  = .left
        label.textColor = .appBlack
        label.numberOfLines = 0
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 3
        label.textColor = UIColor.appBlack
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
    }
}

//MARK: - UILaayout
extension ProductDetailView{
    private func addSubViews(){
        addImageView()
        //addTitleLabel()
        //addPriceLabel()
        //addDescriptionLabel()
    }
    
    private func addImageView(){
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(200)
        }
    }
}
