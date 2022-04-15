//
//  FileExtensions.swift
//  iOSUtils
//
//  Created by Masaharu Tsukamoto on 2022/04/15.
//

import Foundation

extension FileManager {
    func generateTempFilePath() -> String { return [NSTemporaryDirectory(), NSUUID().uuidString].joined() }
}
