//
//  BaseVieewModel.swift
//  MVVMRX
//
//  Created by Ahmed Nasser on 1/31/20.
//  Copyright © 2020 AvaVaas. All rights reserved.
//

import Foundation
import RxSwift
class BaseViewModel<T:NetworkOperation> {
    var bag = DisposeBag()
    var operation :T?
    func bindOperaion(operation:T){
        self.operation = operation
    }
}
