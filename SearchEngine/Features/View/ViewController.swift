//
//  ViewController.swift
//  MovieReviewAppwithSwift
//
//  Created by Halil İbrahim Öztekin on 7.11.2021.
//

import UIKit

class ViewController: UIViewController {
    var url = ""
    var keyword = "Türkiye"
    @IBOutlet var searchBar: UISearchBar!
    private let searchTableView : SearchTableView = SearchTableView()
    private let searchService : SearchTableViewHolderProtocol = SearchQueryService()
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initDelegate()
        initService()
        
    }
    private func initDelegate(){
        
        tableView.delegate = searchTableView
        tableView.dataSource = searchTableView
        searchTableView.delegate = self
        searchBar.delegate = self
    }
    
    private func initService(){
        
        searchService.fetchAllResults(keyword:keyword) { [weak self] (ResultsViewModel) in
            self?.searchTableView.update(items: ResultsViewModel.results)
            self?.tableView.reloadData()
        } onFail: { (data) in
            print(data ?? "")
        }
        
    }
    
    
}




extension ViewController : SearchTableViewOutput {
    func onSelected(item: Result) {
        url = item.link
       performSegue(withIdentifier: "toWebViewVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toWebViewVC" {
            let destinatitonVC = segue.destination as! WebViewViewController
            destinatitonVC.url = url
        }
    }
}
extension ViewController : UISearchBarDelegate {
    
}

extension ViewController {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        initService()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        keyword  = searchText
    }
    
}
