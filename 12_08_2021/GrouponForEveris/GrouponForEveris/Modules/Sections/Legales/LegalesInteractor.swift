/*
Copyright, everisSL
All rights reserved.
 
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.
 
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*/

import Foundation

protocol LegalesInteractorPresenterInterface: InteractorPresenterInterface {
    func fetchData()
}

final class LegalesInteractor: InteractorInterface {
    
    weak var presenter: LegalesPresenterInteractorInterface!
    let provider: LegalesProviderProtocol = LegalesProvider()
    
    private func transformToViewModel(contents: Contents) -> TerminosViewModel{
        let terms = TerminosViewModel(politicaMercado: transformToViewPolicy(politica: contents.emeaMarketplaceReturnsPolicy),
                                      termsOfSaleGoods: transformToViewPolicy(politica: contents.termsOfSaleGoods),
                                      customerdatafaq: transformToViewPolicy(politica: contents.customerdatafaq),
                                      accessibility: transformToViewPolicy(politica: contents.accessibility),
                                      giftcardterms: transformToViewPolicy(politica: contents.giftcardterms),
                                      accessibilityApp: transformToViewPolicy(politica: contents.accessibilityApp),
                                      termsOfSaleTravel: transformToViewPolicy(politica: contents.termsOfSaleTravel),
                                      termsOfSale3Pip: transformToViewPolicy(politica: contents.termsOfSale3Pip),
                                      merchantdatafaq: transformToViewPolicy(politica: contents.merchantdatafaq),
                                      travelreferenceprices: transformToViewPolicy(politica: contents.travelreferenceprices),
                                      finePrint: transformToViewPolicy(politica: contents.finePrint),
                                      privacyPolicy: transformToViewPolicy(politica: contents.privacyPolicy),
                                      termsOfSale: transformToViewPolicy(politica: contents.termsOfSale),
                                      vendorCodeOfConduct: transformToViewPolicy(politica: contents.vendorCodeOfConduct),
                                      faq: transformToViewPolicy(politica: contents.faq),
                                      customerSupport: SoporteCliente(content: transformToCustomerInfo(info: contents.customerSupport?.content), title: contents.customerSupport?.title ?? ""),
                                      cookieList: transformToViewPolicy(politica: contents.cookieList),
                                      termsOfSaleReservations: transformToViewPolicy(politica: contents.termsOfSaleReservations),
                                      cookieConsent2020: transformToViewPolicy(politica: contents.cookieConsent2020),
                                      cookiePolicy: transformToViewPolicy(politica: contents.cookiePolicy),
                                      contentsPrivacyPolicy: transformToViewPolicy(politica: contents.contentsPrivacyPolicy),
                                      termsOfService: transformToViewPolicy(politica: contents.termsOfService),
                                      cookieConsent: transformToViewPolicy(politica: contents.cookieConsent),
                                      privacyCenter: transformToViewPolicy(politica: contents.privacyCenter),
                                      travelconsumerrights: transformToViewPolicy(politica: contents.travelconsumerrights),
                                      termsOfSaleLocal: transformToViewPolicy(politica: contents.termsOfSaleLocal))
        
        
        return terms
        
    }
    
    func transformToViewPolicy(politica: EmeaMarketplaceReturnsPolicy?) -> PoliticaMercado{
        let res = PoliticaMercado(content: politica?.content ?? "", title: politica?.title ?? "")
        return res
    }
    
    func transformToCustomerInfo(info: Content?) -> ContentView{
        return ContentView(phoneNumber: info?.phoneNumber ?? "",
                            operatingHours: info?.operatingHours ?? "",
                            phoneInternationalNumber: info?.phoneInternationalNumber ?? "",
                            callCharges: info?.callCharges ?? "",
                            email: info?.email ?? "")
    }
    
}

extension LegalesInteractor: LegalesInteractorPresenterInterface {
    func fetchData() {
        LegalesProvider().getJson { (results) in
            if let resultDes = results {            
                self.presenter.setModelData(model: self.transformToViewModel(contents: resultDes))
            }
            
        }
    }
}
