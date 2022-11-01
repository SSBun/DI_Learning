//
//  DIViewController.swift
//  DI_Learning
//
//  Created by caishilin on 2022/11/1.
//

import UIKit

class DIViewController: UIViewController {
    private let titleLabel = UILabel()
    private let lock = RecursiveLock()
    private var arr = [0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        (0...9999).forEach { _ in
            DispatchQueue.global().async {
                self.anotherTest()
            }
        }
    }
    
    private func setupUI() {
        titleLabel.font = .systemFont(ofSize: 15)
        titleLabel.textColor = .black
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.centerX.top.equalToSuperview()
            $0.height.equalTo(40)
        }
        titleLabel.text = NSStringFromClass(Self.self)
    }

    private func anotherTest() {
//        lock.lock()
//        defer { lock.unlock() }
        testLock()
    }
    
    private func testLock() {
        lock.lock()
        defer { lock.unlock() }
        if Bool.random() {
           arr.append(1)
        } else {
            arr.append(2)
        }
//        print(self.count)
    }
}

final class RecursiveLock {
    init() {
        pthread_mutexattr_init(&recursiveMutexAttr)
        pthread_mutexattr_settype(&recursiveMutexAttr, PTHREAD_MUTEX_RECURSIVE)
        pthread_mutex_init(&recursiveMutex, &recursiveMutexAttr)
    }
    @inline(__always)
    final func lock() {
        pthread_mutex_lock(&recursiveMutex)
    }
    @inline(__always)
    final func unlock() {
        pthread_mutex_unlock(&recursiveMutex)
    }
    private var recursiveMutex = pthread_mutex_t()
    private var recursiveMutexAttr = pthread_mutexattr_t()
}
