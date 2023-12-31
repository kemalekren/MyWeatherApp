//
//  HomeRequest.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import Foundation
import NgNetworkModuleCore

struct HomeRequest: NetworkRequest {
    let path = "/data/2.5/weather"
    let method: NetworkRequestType = .get
    let parameters: [String : String]?
}
