//
//  HomeRequest.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import Foundation
import NgNetworkModuleCore

struct HomeRequest: NetworkRequest {
    let path = "/weather"
    let method: NetworkRequestType = .get
    let parameters: [String : String]?
}
