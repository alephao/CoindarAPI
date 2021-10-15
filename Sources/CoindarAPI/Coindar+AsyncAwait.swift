//
//  Coindar+AsyncAwait.swift
//  
//
//  Created by Afonso Graça on 13/10/2021.
//

import Foundation

@available(iOS 15.0.0, *)
public extension Coindar {

  func getEvents(params: EventsParams) async throws -> [Event] {
    try await withCheckedThrowingContinuation { continuation in
      _ = getEvents(params: params, onSuccess: continuation.resume, onError: continuation.resume)
    }
  }

  func getCoins(progress: @escaping (Double) -> Void) async throws -> [Coin] {
    try await withCheckedThrowingContinuation { continuation in
      _ = getCoins(progress: progress, onSuccess: continuation.resume, onError: continuation.resume)
    }
  }

  func getTags(progress: @escaping (Double) -> Void) async throws -> [Tag] {
    try await withCheckedThrowingContinuation { continuation in
      _ = getTags(progress: progress, onSuccess: continuation.resume, onError: continuation.resume)
    }
  }

  func getSocial(coins: [Coin]) async throws -> [Social] {
    try await withCheckedThrowingContinuation { continuation in
      _ = getSocial(coins: coins, onSuccess: continuation.resume, onError: continuation.resume)
    }
  }

}
