//
//  EntriesViewModel.swift
//  xint-assignment
//
//  Created by Faisal Saleem on 02/02/2023.
//

import Foundation

protocol EntriesDelegate: AnyObject {
    func didUpdateEntries(with entries: [[Entry]], _ error: String?)
}

class EntriesViewModel: NSObject {
    
    private var service: ApiServiceProtocol
    weak var delegate: EntriesDelegate?
    var cellHeight: CGFloat = EntriesConstants.defaultCellHeight.constant
    var currentIndex: CGFloat = EntriesConstants.defaultIndex.constant
    
    init(service: ApiServiceProtocol) {
        self.service = service
    }
    
    func fetchEntries() {
        self.service.getApiRequest { (result: Result<EntriesModel, DataError>) in
            DispatchQueue.main.async { [weak self] in
                guard let self else {return}
                self.manipulateEntries(with: result)
            }
        }
    }
    
    private func manipulateEntries(with result:  Result<EntriesModel, DataError>) {
        switch result {
            case .success(let success):
                self.apiSuccessResponse(with: success)
            case .failure(let failure):
                self.apiFailureResponse(with: failure)
        }
    }
    
    private func apiSuccessResponse(with success: (EntriesModel)) {
        guard let entries = success.entries.flatMap({$0}) else {return}
        self.flatedEntries(with: entries)
    }
    
    private func flatedEntries(with entries: [Entry]) {
        var model: [[Entry]] = []
        let categories = Util.unique(source: entries.map({$0.category ?? ""}))
        for category in categories {
            let list = entries.filter({$0.category?.lowercased() == category.lowercased()})
            model.append(list)
        }
        self.delegate?.didUpdateEntries(with: model, nil)
    }
    
    private func apiFailureResponse(with failure: (DataError)) {
        self.delegate?.didUpdateEntries(with: [], failure.localizedDescription)
    }
}
