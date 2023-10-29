//
//  SearchRequest.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 29/10/2023.
//

import Foundation
import NgNetworkModuleCore

struct SearchRequest: NetworkRequest {
    let path = "geo/1.0/direct"
    let method: NetworkRequestType = .get
    let parameters: [String : String]?
}
