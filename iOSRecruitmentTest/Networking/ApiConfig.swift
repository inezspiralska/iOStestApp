//
//  ApiConfig.swift
//  iOSRecruitmentTest
//

struct ApiConfig{
    static let baseURLString = "http://localhost:8080/api"
}

extension ApiConfig{
    static func URLString(_ endpointPath: String) -> String {
        return "\(baseURLString)\(endpointPath)"
    }
}
