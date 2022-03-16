//
//  ContentView.swift
//  MorCal
//
//  Created by Dave Agyakwa on 16/03/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = MortageViewModel()
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    HStack {
                        Text("Purchase price: ")
                        Text(vm.purchasePrice, format: .currency(code: "usd"))
                            .font(.title2)
                    }
                    Slider(value: $vm.purchasePrice, in: 200000...500000)
                        .padding()
                }
                
                VStack {
                    HStack {
                        Text("Down payment: ")
                        Text(vm.downPayment, format: .currency(code: "usd"))
                    }
                    Slider(value: $vm.downPayment, in: 200000...500000, label: {
                        EmptyView()
                    }, onEditingChanged: { isdownpaymentEdit in
                        vm.isDownPaymentEditted = isdownpaymentEdit
                        vm.calculateLoan()
                        vm.CalcEstPerMonth()
                    })
                    .padding()
                }
                
                VStack {
                    HStack {
                        Text("Repayment time: ")
                        Text(vm.repaymentDuration, format: .number)
                    }
                    Slider(value: $vm.repaymentDuration, in: 10...25, label: {
                        EmptyView()
                    })
                    .padding()
                }
                
                VStack {
                    HStack {
                        Text("Interest rate: ")
                        Text(vm.interestRate, format: .percent)
                    }
                    Slider(value: $vm.interestRate, in: 0.01...0.1, label: {
                        EmptyView()
                    })
                    .padding()
                }
               
                Text("Loan Amount")
                Text(vm.principalLoan, format: .currency(code: "usd"))
                
                Text("Est per month")
                Text(vm.estPerMonth, format: .currency(code: "usd"))
                
                Button {
                    vm.CalcMortgage()
                    print(vm.mortgage)
                } label: {
                    Text("Get a mortgage quote")
                        .fontWeight(.bold)
                        .padding()
                }
                .background(.mint)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
            }.navigationBarTitle(Text("MorCal"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
