//
//  MortageViewModel.swift
//  MorCal
//
//  Created by Dave Agyakwa on 16/03/2022.
//

import Foundation

final class MortageViewModel: ObservableObject {
    private let mortgageService: MortgageService
    init() {
        mortgageService = MortgageService()
    }
    
    @Published var purchasePrice = 0.0
    @Published var downPayment = 0.0
    @Published var repaymentDuration = 10.0
    @Published var interestRate = 0.0
    @Published private(set) var principalLoan = 0
    @Published private(set) var estPerMonth = 0
    @Published private(set) var mortgage = 0.0
    @Published  var isDownPaymentEditted = false
    
    func CalcMortgage() {
        mortgage = mortgageService.CalcMonthlyMortgage(with: Double(principalLoan), at: interestRate, for: Int(repaymentDuration))
    }
    
    func calculateLoan() {
        principalLoan = Int(mortgageService.CalcPrincipalLoan(for: purchasePrice, with: downPayment))
    }
    
    func CalcEstPerMonth() -> Void {
        estPerMonth = principalLoan / 12
    }
}
