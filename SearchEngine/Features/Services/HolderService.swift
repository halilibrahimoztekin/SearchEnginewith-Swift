//
//  HolderService.swift
//  MovieReviewAppwithSwift
//
//  Created by Halil İbrahim Öztekin on 7.11.2021.
//

import Foundation
import Alamofire

protocol SearchTableViewHolderProtocol {
    func fetchAllResults(keyword : String, onSuccess : @escaping (ResultsViewModel) -> Void, onFail : @escaping (String?) -> Void)
}

enum SearchQueryPath : String {
    case QUERY = "q=sumeyye+sivkin&num=100"
    case gg = "https://google-search3.p.rapidapi.com/api/v1/search/"
}

extension SearchQueryPath {
    
    func withBaseUrl() -> String {
        return "https://google-search3.p.rapidapi.com/api/v1/search/\(self.rawValue)"
    }
}

extension SearchQueryService {
    func QueryGenerator (keyword  : String ) -> String {
        var nkeyword  = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        var query  = URLComponents()
        query.scheme = "https"
        query.host = "google-search3.p.rapidapi.com"
        query.path  = "/api/v1/search/"
        
        
        
        
        guard let urlString = query.string else {return ""}
        let urlStringvar = "\(urlString)q=\(nkeyword!)&num=100"
        return urlStringvar
    }
}

struct SearchQueryService : SearchTableViewHolderProtocol {
    let headers : HTTPHeaders = [
        "x-user-agent": "desktop",
        "x-proxy-location": "US",
        "x-rapidapi-host": "google-search3.p.rapidapi.com",
        "x-rapidapi-key": "30e213f749msh5ae361614ae9956p11097ejsn346ac0b84227"
    ]
    
    func fetchAllResults(keyword : String, onSuccess: @escaping (ResultsViewModel) -> Void, onFail: @escaping (String?) -> Void) {
        let url = QueryGenerator(keyword: keyword )
        print(url)
        AF.request(url, method: .get, headers: headers).validate().responseDecodable(of: ResultsViewModel.self) { (response) in
            guard let data  = response.value
            else {
                onFail(response.debugDescription)
                return
            }
            print(data.results[0].title)
            onSuccess(data)
        }
    }
    
    
}

