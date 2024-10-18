//
//  HomeViewController.swift
//  ObiletCase
//
//  Created by Şehriban Yıldırım on 9.10.2024.
//

import UIKit

class HomeViewController: BaseViewController<HomeViewModel> {
    
    //MARK: - Properties
    private lazy var searchBar: CustomSearchBar = {
        let searchBar = CustomSearchBar()
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appWhite
        navigationConfigure()
        setUp()
    }

    private func navigationConfigure() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Match Your Style"
        addNavigationBarLogo()
    }
}

//MARK: - UI Layout
extension HomeViewController{
    private func addSubViews(){
        view.addSubview(searchBar)
    }
    
    private func setUp(){
        addSubViews()
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(44)
        }
    }
}
