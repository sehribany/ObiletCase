//
//  HomeViewController.swift
//  ObiletCase
//
//  Created by Şehriban Yıldırım on 9.10.2024.
//

import UIKit

class HomeViewController: UIViewController {

    private let viewModel = HomeViewModel()

        override func viewDidLoad() {
            super.viewDidLoad()
            setupBindings()
            viewModel.fetchProducts()
        }

        private func setupBindings() {
            viewModel.didUpdateProducts = { [weak self] in
                DispatchQueue.main.async {
                    print("Fetched products: \(self?.viewModel.products ?? [])")
                }
            }
            
            viewModel.didFailWithError = { errorMessage in
                print("Error: \(errorMessage)")
            }
        }
}
