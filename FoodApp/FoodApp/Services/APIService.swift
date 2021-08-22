//
//  APIService.swift
//  Food Ordering App
//
//
import Foundation

class APIService {
    static let shared = APIService()

    func login(credentials: Credentials,
               completion: @escaping (Result<Bool,Authentication.AuthenticationError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if ((credentials.password == "123456789")&&(credentials.email == "yemeksepeti@yemek.com")) {
                completion(.success(true))
            } else {
                completion(.failure(.invalidCredentials))
            }
        }
    }
}
