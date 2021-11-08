//
//  SearchTableView.swift
//  MovieReviewAppwithSwift
//
//  Created by Halil İbrahim Öztekin on 7.11.2021.
//

import UIKit


protocol SearchTableViewProtocol {
    func update( items : [Result])
}

protocol SearchTableViewOutput : class {
    func onSelected(item: Result)
}

class SearchTableView : NSObject  {
    
    weak var delegate : SearchTableViewOutput?
    
    private lazy var items : [Result] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellSearch", for: indexPath) as! SearchTableViewCell
        let item = items[indexPath.row]
        cell.titleLabel.text = item.title
        cell.descLabel.text = item.description
        cell.linkLabel.text = item.link
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.onSelected(item: items[indexPath.row])
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}

extension SearchTableView : UITableViewDataSource, UITableViewDelegate {
    
}
extension SearchTableView : SearchTableViewProtocol{
    func update(items: [Result]) {
        self.items = items
    }
}
