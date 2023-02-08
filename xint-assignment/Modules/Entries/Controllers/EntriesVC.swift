//
//  EntriesVC.swift
//  xint-assignment
//
//  Created by Faisal Saleem on 02/02/2023.
//

import UIKit
import JGProgressHUD

class EntriesVC: UIViewController {
    
    @IBOutlet weak var entriesCollectionView: UICollectionView!
    lazy var viewModel = EntriesViewModel(service: ApiService())
    var model: [[Entry]] = []
    private lazy var hud = JGProgressHUD(style: .light)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hud.show(in: self.view)
        self.entriesCollectionView.delegate = self
        self.entriesCollectionView.dataSource = self
        self.viewModel.delegate = self
        self.viewModel.fetchEntries()
    }
    
    
    @IBAction func didBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension EntriesVC: EntriesDelegate {
    func didUpdateEntries(with entries: [[Entry]], _ error: String?) {
        self.hud.dismiss(animated: true)
        if let error {
            Util.showAlert(caller: self, message: error)
        } else {
            self.model = entries
            self.entriesCollectionView.reloadData()
        }
    }
}



