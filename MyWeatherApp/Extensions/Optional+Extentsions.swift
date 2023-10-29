//
//  Optional+Extentsions.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 29/10/2023.
//

import Foundation

enum AppError: LocalizedError {
    case development
    
    var description: String? {
        switch self {
        case .development:
            return "Development Error"
        }
    }
}

extension Optional {

    /// Throws error if no data required
    func throwing(error: Error = AppError.development) throws -> Wrapped {
        if let wrapped = self {
            return wrapped
        } else {
            throw error
        }
    }
}
