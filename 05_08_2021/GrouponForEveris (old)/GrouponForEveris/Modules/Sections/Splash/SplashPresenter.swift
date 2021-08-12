//
//  SplashPresenter.swift
//  GrouponForEveris
//
//  Created by David Cuñado Gil on 5/8/21.
//

import Foundation

protocol SplashPresenterProtocol {
    func fetchDataFromPresent()
    func numberOfRowInsection() -> Int
    func informationForCell(indexPath: Int) -> CardDataViewModel?
    func getDataFromBusiness(data: [CardBusinessModel]?)

}

/*
protocol SplashInteractorOutputProtocol {
    func getDataFromBusiness(data: [CardBusinessModel]?)
}
*/
class SplashPresenter: BasePresenter<SplashViewControllerProtocol, SplashRouterProtocol, SplashInteractorProtocol>{
    
    var arrayData: [CardBusinessModel] = []

}

extension SplashPresenter: SplashPresenterProtocol{
    func fetchDataFromPresent() {
        self.interactor?.fetchData()
    }
    
    func numberOfRowInsection() -> Int {
        arrayData.count
    }
    
    func informationForCell(indexPath: Int) -> CardDataViewModel? {
        arrayData[indexPath].data
    }
    
    func getDataFromBusiness(data: [CardBusinessModel]?) {
        if let dataDes = data{
            self.arrayData = dataDes
            self.vc?.reloadInformationInView()
        }
    }
}

/*
extension SplashPresenter: SplashInteractorOutputProtocol{
    func getDataFromBusiness(data: [CardBusinessModel]?) {
        if let dataDes = data{
            self.arrayData = dataDes
            self.vc?.reloadInformationInView()
        }
    }
}
 */
