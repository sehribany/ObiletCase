//
//  DetailViewController.swift
//  ObiletCase
//
//  Created by Şehriban Yıldırım on 28.10.2024.
//

import UIKit

class DetailViewController: BaseViewController<DetailViewModel>{
    
    //MARK: - Properties
    private lazy var detailCardView = ProductDetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configure()
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

// MARK: - UILayout and Configure
extension DetailViewController {
    
    private func addSubViews() {
        view.backgroundColor = .appWhite
        addDetailView()
    }
    
    private func addDetailView() {
        view.addSubview(detailCardView)
        detailCardView.snp.makeConstraints { make in
            make.bottom.top.leading.trailing.equalToSuperview()
        }
    }

    private func configure() {
        detailCardView.imageView.setImage(viewModel.productDetail.image)
        detailCardView.titleLabel.text = viewModel.productDetail.title
        detailCardView.descriptionLabel.text = viewModel.productDetail.description
        detailCardView.priceLabel.text = String(viewModel.productDetail.price)
        detailCardView.personLabel.text =  String(viewModel.productDetail.rating.count)
        detailCardView.rateLabel.text = String(viewModel.productDetail.rating.rate)
    }
}
