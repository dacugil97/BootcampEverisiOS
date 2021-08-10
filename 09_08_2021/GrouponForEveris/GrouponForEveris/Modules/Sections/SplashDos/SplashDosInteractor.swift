//
//  SplashDosInteractor.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 6/8/21.
//

import Foundation

protocol SplashDosInteractorPresenterInterface: InteractorPresenterInterface {
    func fetchDataFromInteractor()
}

final class SplashDosInteractor: InteractorInterface {
    
    weak var presenter: SplashDosPresenterInteractorInterface!
    let provider: SplashProviderProtocol = SplashProvider()
    
    
    private func transformDataViewModel(data: [Card]) -> [DataViewModel] {
        var arrayData: [DataViewModel] = []
        for index in 0..<data.count{
            if let modelData = data[index].data {
                let obj = DataViewModel(pCardType: .deal, pData: self.transformDataToCardViewModel(data: modelData))
                arrayData.append(obj)
            }
        }
        return arrayData
    }
    
    private func transformDataToCardViewModel(data: CardData) -> CardViewModel {
        
        let modelData = CardViewModel(pDescriptor: data.descriptor ?? "",
                                      pType: data.type ?? "",
                                      pFinePrint: data.finePrint ?? "",
                                      pAnnouncementTitle: data.announcementTitle ?? "",
                                      pImages: self.transformDataToImageViewModel(data: data.images ?? []),
                                      pEndAt: data.endAt ?? "",
                                      pTags: self.transformDataToTagViewModel(data: data.tags ?? []),
                                      pDealUrl: data.dealUrl ?? "",
                                      pGrid4ImageUrl: data.grid4ImageUrl ?? "",
                                      pSidebarImageUrl: data.sidebarImageUrl ?? "",
                                      pHighlightsHtml: data.highlightsHtml ?? "",
                                      pPitchHtml: data.pitchHtml ?? "",
                                      pPriceSummary: self.transformDataToPriceSummaryViewModel(data: data.priceSummary ?? PriceSummary(discountPercent: nil, price: nil, minimumPurchaseQuantity: nil, redemptionOffer: nil, value: nil, quoteId: nil)),
                                      pLargeImageUrl: data.largeImageUrl ?? "",
                                      pBadge: self.transformDataToBadgeViewModel(data: data.badges ?? []),
                                      pDivision: self.transformDataToDivisionViewModel(data: data.division ?? Division(timezoneOffsetInSeconds: nil, lng: nil, timezone: nil, name: nil, id: nil, timezoneIdentifier: nil, lat: nil)))
        
        return modelData
    }
    
    private func transformDataToImageViewModel(data: [Image]) -> [ImageViewModel] {
        var arrayImage: [ImageViewModel] = []
        
        for item in 0..<data.count {
            let model = ImageViewModel(pUrl: data[item].url ?? "")
            arrayImage.append(model)
        }
        return arrayImage
    }
    
    private func transformDataToTagViewModel(data: [Tag]) -> [TagViewModel] {
        var arrayTags: [TagViewModel] = []
        
        for item in 0..<data.count {
            let model = TagViewModel(pName: data[item].name ?? "")
            arrayTags.append(model)
        }
        return arrayTags
    }
    
    private func transformDataToPriceSummaryViewModel(data: PriceSummary) -> PriceSummaryViewModel {
        let model = PriceViewModel(pFormattedAmount: data.price?.formattedAmount ?? "")
        let priceModel = PriceSummaryViewModel(pValue: model)
        return priceModel
    }
    
    private func transformDataToBadgeViewModel(data: [Badge]) -> [BadgeViewModel] {
        var arrayBadge: [BadgeViewModel] = []
        
        for item in 0..<data.count {
            let model = BadgeViewModel(pText: data[item].text ?? "", pIconImageUrl: data[item].iconImageUrl ?? "")
            arrayBadge.append(model)
        }
        return arrayBadge
    }
    
    private func transformDataToDivisionViewModel(data: Division) -> DivisionViewModel {
        let divisionModel = DivisionViewModel(plng: data.lng ?? 0.0, pName: data.name ?? "", pLat: data.lat ?? 0.0)
        return divisionModel
    }
    
}

extension SplashDosInteractor: SplashDosInteractorPresenterInterface {
    func fetchDataFromInteractor() {
        provider.fetchData { [weak self] (result) in
            guard self != nil else { return }
            self?.presenter?.getDataFromInteractor(data: self?.transformDataViewModel(data: result.cards ?? []))
        } failure: { (error) in
            //
        }
    }
}
