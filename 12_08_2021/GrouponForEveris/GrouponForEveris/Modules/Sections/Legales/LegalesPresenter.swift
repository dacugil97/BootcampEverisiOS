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

protocol LegalesPresenterRouterInterface: PresenterRouterInterface {
    
}

protocol LegalesPresenterInteractorInterface: PresenterInteractorInterface {
    func setModelData(model: TerminosViewModel)
}

protocol LegalesPresenterViewInterface: PresenterViewInterface {
    
    func fetchData()
    func numberOfRows() -> Int
    func getLegalTitleFrom(index: Int) -> String?
    func updateView()
    func showDetailVC(index: Int)
}

final class LegalesPresenter: PresenterInterface {
    
    var router: LegalesRouterPresenterInterface!
    var interactor: LegalesInteractorPresenterInterface!
    weak var view: LegalesViewPresenterInterface!
    
    var legalModel: TerminosViewModel?
    var legalMirror: Mirror?
    
}

extension LegalesPresenter: LegalesPresenterRouterInterface {
    
}

extension LegalesPresenter: LegalesPresenterInteractorInterface {
    func setModelData(model: TerminosViewModel) {
        self.legalModel = model
        self.legalMirror = Mirror(reflecting: model)
    }
    
    
}

extension LegalesPresenter: LegalesPresenterViewInterface {
    func getLegalTitleFrom(index: Int) -> String? {
        if let legalDes = legalMirror {
            let idx = legalDes.children.index(legalDes.children.startIndex, offsetBy: index, limitedBy: legalDes.children.endIndex)
            let childAtIndex =  legalDes.children[idx!]
                        
            if childAtIndex.label == "customerSupport" {
                let content = childAtIndex.value as! SoporteCliente
                
                if (content.title?.isEmpty ?? false) {
                    return childAtIndex.label
                } else {
                    return content.title ?? ""
                }
                
            } else {
                let content = childAtIndex.value as! PoliticaMercado
                
                if (content.title?.isEmpty ?? false) {
                    return childAtIndex.label
                } else {
                    return content.title ?? ""
                }
            }
        }
        
        return ""
    }
    
    func fetchData() {
        interactor.fetchData()
    }
    
    func numberOfRows() -> Int {
        self.legalMirror?.children.count ?? 0
    }
    
    func updateView() {
        self.view.reloadInformationInView()
    }
    
    func showDetailVC(index: Int) {
        if let legalDes = legalMirror {
            let idx = legalDes.children.index(legalDes.children.startIndex, offsetBy: index, limitedBy: legalDes.children.endIndex)
            let childAtIndex =  legalDes.children[idx!]
            
            self.router.showDetailVC(content: childAtIndex)
            
        }
    }
    
}

