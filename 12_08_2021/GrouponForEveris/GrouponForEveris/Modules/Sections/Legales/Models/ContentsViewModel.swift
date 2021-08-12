//
//  ContentsViewModel.swift
//  GrouponForEveris
//
//  Created by David Cuñado Gil on 12/8/21.
//

import Foundation

struct TerminosViewModel {
    
    let politicaMercado: PoliticaMercado?
    let termsOfSaleGoods: PoliticaMercado?
    let customerdatafaq: PoliticaMercado?
    let accessibility: PoliticaMercado?
    let giftcardterms: PoliticaMercado?
    let accessibilityApp: PoliticaMercado?
    let termsOfSaleTravel: PoliticaMercado?
    let termsOfSale3Pip: PoliticaMercado?
    let merchantdatafaq: PoliticaMercado?
    let travelreferenceprices: PoliticaMercado?
    let finePrint: PoliticaMercado?
    let privacyPolicy: PoliticaMercado?
    let termsOfSale: PoliticaMercado?
    let vendorCodeOfConduct: PoliticaMercado?
    let faq: PoliticaMercado?
    let customerSupport: SoporteVendedor?
    let cookieList: PoliticaMercado?
    let termsOfSaleReservations: PoliticaMercado?
    let cookieConsent2020: PoliticaMercado?
    let cookiePolicy: PoliticaMercado?
    let contentsPrivacyPolicy: PoliticaMercado?
    let termsOfService: PoliticaMercado?
    let cookieConsent: PoliticaMercado?
    let privacyCenter: PoliticaMercado?
    let travelconsumerrights: PoliticaMercado?
    let termsOfSaleLocal: PoliticaMercado?
    
    init(politicaMercado: PoliticaMercado,
         termsOfSaleGoods: PoliticaMercado,
         customerdatafaq: PoliticaMercado,
         accessibility: PoliticaMercado,
         giftcardterms: PoliticaMercado,
         accessibilityApp: PoliticaMercado,
         termsOfSaleTravel: PoliticaMercado,
         termsOfSale3Pip: PoliticaMercado,
         merchantdatafaq: PoliticaMercado,
         travelreferenceprices: PoliticaMercado,
         finePrint: PoliticaMercado,
         privacyPolicy: PoliticaMercado,
         termsOfSale: PoliticaMercado,
         vendorCodeOfConduct: PoliticaMercado,
         faq: PoliticaMercado,
         customerSupport: SoporteVendedor,
         cookieList: PoliticaMercado,
         termsOfSaleReservations: PoliticaMercado,
         cookieConsent2020: PoliticaMercado,
         cookiePolicy: PoliticaMercado,
         contentsPrivacyPolicy: PoliticaMercado,
         termsOfService: PoliticaMercado,
         cookieConsent: PoliticaMercado,
         privacyCenter: PoliticaMercado,
         travelconsumerrights: PoliticaMercado,
         termsOfSaleLocal: PoliticaMercado) {
        
        self.politicaMercado = politicaMercado
        self.termsOfSaleGoods = termsOfSaleGoods
        self.customerdatafaq = customerdatafaq
        self.accessibility = accessibility
        self.giftcardterms = giftcardterms
        self.accessibilityApp = accessibilityApp
        self.termsOfSaleTravel = termsOfSaleTravel
        self.termsOfSale3Pip = termsOfSale3Pip
        self.merchantdatafaq = merchantdatafaq
        self.travelreferenceprices = travelreferenceprices
        self.finePrint = finePrint
        self.privacyPolicy = privacyPolicy
        self.termsOfSale = termsOfSale
        self.vendorCodeOfConduct = vendorCodeOfConduct
        self.faq = faq
        self.customerSupport = customerSupport
        self.cookieList = cookieList
        self.termsOfSaleReservations = termsOfSaleReservations
        self.cookieConsent2020 = cookieConsent2020
        self.cookiePolicy = cookiePolicy
        self.contentsPrivacyPolicy = contentsPrivacyPolicy
        self.termsOfService = termsOfService
        self.cookieConsent = cookieConsent
        self.privacyCenter = privacyCenter
        self.travelconsumerrights = travelconsumerrights
        self.termsOfSaleLocal = termsOfSaleLocal
    }
}

struct PoliticaMercado {
    let content: String?
    let title: String?
    
    init(content: String, title: String) {
        self.content = content
        self.title = title
    }
}

struct SoporteVendedor{
    let content: ContentView
    let title: String?
    
    init(content: ContentView, title: String) {
        self.content = content
        self.title = title
    }
}

struct ContentView {
    let phoneNumber: String?
    let operatingHours: String?
    let phoneInternationalNumber: String?
    let callCharges: String?
    let email: String?
    
    init(phoneNumber: String,
         operatingHours: String,
         phoneInternationalNumber: String,
         callCharges: String,
         email: String) {
        self.phoneNumber = phoneNumber
        self.operatingHours = operatingHours
        self.phoneInternationalNumber = phoneInternationalNumber
        self.callCharges = callCharges
        self.email = email
    }
    
}
