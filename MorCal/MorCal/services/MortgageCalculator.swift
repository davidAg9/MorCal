//
//  MortgageCalculator.swift
//  MorCal
//
//  Created by Dave Agyakwa on 16/03/2022.
//

import Foundation
//Formula for mortgage payments: M = P[r(1+r)^n/((1+r)^n)-1)]
//M = the total monthly mortgage payment
//P = the principal loan amount(Purchase Price - Down Payment)
//r = your monthly interest rate
//n = number of payments over the loan’s lifetime.


struct MortgageService{
    func CalcMonthlyMortgage(with principal:Double ,at rate:Double ,for numberOfPayment:Int ) -> Double {
        let result = rate * pow((1 + rate), Double(numberOfPayment)) / pow((1 + rate), Double(numberOfPayment)) - 1
        return principal * result
    }
    
    func CalcPrincipalLoan(for purchasePrice:Double , with downPayment:Double) -> Double {
        return purchasePrice - downPayment
    }
    
    
}
