//
//  HomePresenter.swift
//  ArabicStocks
//
//  Created by Yasmina Sobhi on 12/6/19.
//  Copyright © 2019 Yasmina. All rights reserved.
//

import Foundation
import Moya

class HomePresenter {
    
    private var countries: [Country]?
    private var companies = [Company]()
    
    var delegate : HomeViewControllerdelegate
    var homeProvider = MoyaProvider<HomeEndPoint>()
    
    init(controllerDelegate: HomeViewControllerdelegate) {
        self.delegate = controllerDelegate
    }
    
    func getCountryCount() -> Int{
        return countries?.count ?? 0
    }
    
    func getCompaniesCount() -> Int{
        return companies.count ?? 0
    }
    
    func getCountries() {
        //apicall
        guard let url = Bundle.main.url(forResource: "CountryCodes", withExtension: "json") else {
            return
        }
        do {
            let countriesJson = try? Data(contentsOf: url)
            if let countries = countriesJson, let countriesItems = try? JSONDecoder().decode([Country].self, from: countries) {
                self.countries = countriesItems
                delegate.updateCountries()
            }
        }
    }
    
    func getImageName(at indx: Int) -> String {
        if let country = countries?[indx] {
            return country.code
        }
        return "eg"
    }
    func getCompany(at indx: Int) -> Company {
        let company = companies[indx]
        return company
    }
    
    
    func getCountryName(at indx: Int) -> String {
        if let country = countries?[indx] {
            return country.name
        }
        return "egypt"
    }
    
    func getCountryDetails(with code: String) {
        delegate.showLoader()
        homeProvider.request(.companies(code: code)) { [weak self](result) in
            self?.delegate.hideLoader()
            switch result{
            case .failure(let error):
               print(error)
            case .success(let response):
               let data = response.data
               do{
                let companies = try! JSONDecoder().decode(CompaniesResponse.self, from: data)
                self?.companies = companies.rows!
                self?.delegate.updateCompanies()
               }catch{
                print(error)
               }
            }
        }
    }
    
}
