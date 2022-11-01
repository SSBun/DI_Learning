//
//  ResolverDI.swift
//  DI_Learning
//
//  Created by caishilin on 2022/11/1.
//

import UIKit
import Resolver

class MyResolver: Resolver {
    deinit {
        print("resolver release")
    }
}

class ResolverDI: DIViewController {
    
    private let resolver = MyResolver()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        registerDependencies()
        resolveDependencies()
    }
    
    private func registerDependencies() {
        resolver.register {
            Room()
        }
        resolver.register {
            Person(room: $0.resolve())
        }
    }
    
    private func resolveDependencies() {
        let person: Person = resolver.resolve()
        print(person)
    }
}


private struct Room {
    
}

private struct Person {
    let room: Room
}

private class Dog {
    
}
