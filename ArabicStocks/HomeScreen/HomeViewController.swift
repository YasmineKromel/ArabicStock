//
//  HomeViewController.swift
//  ArabicStocks
//
//  Created by Yasmina Sobhi on 12/6/19.
//  Copyright © 2019 Yasmina. All rights reserved.
//

import UIKit

protocol HomeViewControllerdelegate {
    func showLoader()
    func hideLoader()
    func updateCountries()
    func updateCompanies()
}

class HomeViewController: UIViewController, HomeViewControllerdelegate {
    
    func updateCompanies() {
        companiesTableView.reloadData()
    }
    
    func showLoader() {
        //show loader
        loader.isHidden = false
        loader.startAnimating()
    }
    
    func hideLoader() {
        //hide loader
        loader.startAnimating()
        loader.isHidden = true
    }
    
    func updateCountries() {
        countriesCollection.reloadData()
        presenter.getCountryDetails(with: "EG")
    }
    
    @IBOutlet weak var countriesCollection: UICollectionView!
    @IBOutlet weak var companiesTableView: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    lazy var presenter = HomePresenter(controllerDelegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getCountries()
        registercells()
        
    }
    
    func registercells()  {
        countriesCollection.register(UINib(nibName: K.Nibnames.countrycell, bundle: nil), forCellWithReuseIdentifier: K.CellIdentifiers.CountryCollectionViewCell)
        companiesTableView.register(UINib(nibName: K.Nibnames.CompanyTableViewCell, bundle: nil), forCellReuseIdentifier: K.CellIdentifiers.CompanyTableViewCell)
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getCountryCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.CellIdentifiers.CountryCollectionViewCell, for: indexPath) as? CountryCollectionViewCell
        cell?.countryImage.image = UIImage(named: presenter.getImageName(at: indexPath.row))
        cell?.countryName.text = presenter.getCountryName(at: indexPath.row)
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.getCountryDetails(with: presenter.getImageName(at: indexPath.row))
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getCompaniesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CellIdentifiers.CompanyTableViewCell, for: indexPath) as! CompanyTableViewCell
        cell.setup(company: presenter.getCompany(at: indexPath.row))
        return cell
    }
    

}

