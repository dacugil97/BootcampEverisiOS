//
//  EverLegalesServerModel.swift
//  GrouponForEveris
//
//  Created by David Cuñado Gil on 12/8/21.
//

import Foundation

// MARK: - GrouponLegales
struct GrouponLegalesServerModel: Decodable {
    let contents: Contents?
    
    enum CodingKeys: String, CodingKey {
        case contents = "contents"
    }
}

// MARK: - Contents
struct Contents: Decodable {
    let emeaMarketplaceReturnsPolicy: EmeaMarketplaceReturnsPolicy?
    let termsOfSaleGoods: EmeaMarketplaceReturnsPolicy?
    let customerdatafaq: EmeaMarketplaceReturnsPolicy?
    let accessibility: EmeaMarketplaceReturnsPolicy?
    let giftcardterms: EmeaMarketplaceReturnsPolicy?
    let accessibilityApp: EmeaMarketplaceReturnsPolicy?
    let termsOfSaleTravel: EmeaMarketplaceReturnsPolicy?
    let termsOfSale3Pip: EmeaMarketplaceReturnsPolicy?
    let merchantdatafaq: EmeaMarketplaceReturnsPolicy?
    let travelreferenceprices: EmeaMarketplaceReturnsPolicy?
    let finePrint: EmeaMarketplaceReturnsPolicy?
    let privacyPolicy: EmeaMarketplaceReturnsPolicy?
    let termsOfSale: EmeaMarketplaceReturnsPolicy?
    let vendorCodeOfConduct: EmeaMarketplaceReturnsPolicy?
    let faq: EmeaMarketplaceReturnsPolicy?
    let customerSupport: CustomerSupport?
    let cookieList: EmeaMarketplaceReturnsPolicy?
    let termsOfSaleReservations: EmeaMarketplaceReturnsPolicy?
    let cookieConsent2020: EmeaMarketplaceReturnsPolicy?
    let cookiePolicy: EmeaMarketplaceReturnsPolicy?
    let contentsPrivacyPolicy: EmeaMarketplaceReturnsPolicy?
    let termsOfService: EmeaMarketplaceReturnsPolicy?
    let cookieConsent: EmeaMarketplaceReturnsPolicy?
    let privacyCenter: EmeaMarketplaceReturnsPolicy?
    let travelconsumerrights: EmeaMarketplaceReturnsPolicy?
    let termsOfSaleLocal: EmeaMarketplaceReturnsPolicy?
    
    enum CodingKeys: String, CodingKey {
        case emeaMarketplaceReturnsPolicy = "EMEA-Marketplace-Returns-Policy"
        case termsOfSaleGoods = "termsOfSaleGoods"
        case customerdatafaq = "customerdatafaq"
        case accessibility = "accessibility"
        case giftcardterms = "giftcardterms"
        case accessibilityApp = "accessibility_app"
        case termsOfSaleTravel = "termsOfSaleTravel"
        case termsOfSale3Pip = "termsOfSale3PIP"
        case merchantdatafaq = "merchantdatafaq"
        case travelreferenceprices = "travelreferenceprices"
        case finePrint = "finePrint"
        case privacyPolicy = "privacy-policy"
        case termsOfSale = "termsOfSale"
        case vendorCodeOfConduct = "vendor-code-of-conduct"
        case faq = "faq"
        case customerSupport = "customerSupport"
        case cookieList = "cookie-list"
        case termsOfSaleReservations = "termsOfSaleReservations"
        case cookieConsent2020 = "cookie-consent-2020"
        case cookiePolicy = "cookiePolicy"
        case contentsPrivacyPolicy = "privacyPolicy"
        case termsOfService = "termsOfService"
        case cookieConsent = "cookie-consent"
        case privacyCenter = "privacy-center"
        case travelconsumerrights = "travelconsumerrights"
        case termsOfSaleLocal = "termsOfSaleLocal"
    }
}

// MARK: - EmeaMarketplaceReturnsPolicy
struct EmeaMarketplaceReturnsPolicy: Decodable {
    let content: String?
    let contentType: ContentType?
    let version: String?
    let permalink: String?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case content = "content"
        case contentType = "contentType"
        case version = "version"
        case permalink = "permalink"
        case title = "title"
    }
}

enum ContentType: String, Decodable {
    case html = "html"
}

// MARK: - CustomerSupport
struct CustomerSupport: Decodable {
    let content: Content?
    let contentType: String?
    let version: String?
    let permalink: String?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case content = "content"
        case contentType = "contentType"
        case version = "version"
        case permalink = "permalink"
        case title = "title"
    }
}

// MARK: - Content
struct Content: Decodable {
    let phoneNumber: String?
    let operatingHours: String?
    let phoneInternationalNumber: String?
    let callCharges: String?
    let email: String?
    
    enum CodingKeys: String, CodingKey {
        case phoneNumber = "phoneNumber"
        case operatingHours = "operatingHours"
        case phoneInternationalNumber = "phoneInternationalNumber"
        case callCharges = "callCharges"
        case email = "email"
    }
}

extension GrouponLegalesServerModel {
    static var stubContents: Contents? {
        do {
            let response: GrouponLegalesServerModel? = try Bundle.main.loadAndDecoadJSON(filename: "grouponLegales")
            return response?.contents
        } catch {
            
        }
        return nil
    }
}

extension Bundle {
    func loadAndDecoadJSON<D: Decodable>(filename: String) throws -> D? {
        guard let url = self.url(forResource: filename, withExtension: ".json") else {
            return nil
        }
        let data = try? Data(contentsOf: url)
        let jsonDecoder = Utils.jsonDecoder
        let decodeModel = try? jsonDecoder.decode(D.self, from: data!)
        return decodeModel
    }
}

class Utils {
    static let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "(yyyy-mm-dd)"
        return dateFormatter
    }()
    
}
