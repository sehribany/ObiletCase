//
//  HomeViewController.swift
//  ObiletCase
//
//  Created by Şehriban Yıldırım on 9.10.2024.
//

import UIKit

class HomeViewController: BaseViewController<HomeViewModel>{

    //MARK: - Properties
    private lazy var searchBar: CustomSearchBar = {
        let searchBar = CustomSearchBar()
        return searchBar
    }()
    
    private lazy var productCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.identifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appWhite
        navigationConfigure()
        configureContents()
        viewModel.fetchProduct()
        bindViewModel()
        setUp()
    }

    private func navigationConfigure() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Match Your Style"
        addNavigationBarLogo()
    }
    
    private func configureContents() {
        productCollectionView.delegate   = self
        productCollectionView.dataSource = self
    }
    
    private func bindViewModel() {
        viewModel.didSelectProduct = { [weak self] product in
            guard let self = self else { return }
            self.navigateToDetailViewController(with: product)
        }
        
        viewModel.didSuccessFetchProduct = { [weak self] in
            DispatchQueue.main.async {
                self?.productCollectionView.reloadData()
            }
        }
        
        viewModel.didFailWithError = { error in
            print("Veri çekme hatası: \(error)")
        }
    }
    
    private func navigateToDetailViewController(with product: Product) {
        let detailViewModel = DetailViewModel(productDetail: product)
        let detailVC = DetailViewController(viewModel: detailViewModel)
        detailVC.title = product.title
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

//MARK: - UILayout
extension HomeViewController{
    private func addSubViews(){
        view.addSubview(searchBar)
        view.addSubview(productCollectionView)
    }
    
    private func setUp(){
        addSubViews()
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(44)
        }
        productCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(8)
            make.bottom.equalToSuperview()
        }
    }
}

//MARK: - HeaderViewEventSource
extension HomeViewController: HeaderViewEventSource{
    func didSelectHeaderItem(at index: IndexPath) {
        switch index.item {
        case 0:
            viewModel.fetchProductsByCategory(.electronics)
        case 1:
            viewModel.fetchProductsByCategory(.jewelery)
        case 2:
            viewModel.fetchProductsByCategory(.menSClothing)
        case 3:
            viewModel.fetchProductsByCategory(.womenSClothing)
        default:
            break
        }
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as! ProductCell
        let cellViewModel = viewModel.cellItemAt(indexPath: indexPath)
        cell.set(viewModel: cellViewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.showProductDetailScreen(at: indexPath)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else { return UICollectionReusableView()}
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.identifier, for: indexPath) as! HeaderView
        headerView.delegate = self
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = collectionView.frame.width - 10
        let widthPerItem = availableWidth / 2
        return CGSize(width: widthPerItem, height: widthPerItem)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat { return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
