//
//  Extentions.swift
//  SidTest
//
//  Created by Siddharth Daga on 20/07/20.
//  Copyright © 2020 Siddharth Daga. All rights reserved.
//

import UIKit

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension UITableView {
    func registerNibs(identifiers: [CellIdentifiers]) {
        for identifier in identifiers {
            self.register(UINib(nibName: identifier.rawValue, bundle: nil), forCellReuseIdentifier: identifier.rawValue)
        }
    }
}

extension UIImageView {
    func loadImage(urlString: String?, placeholderImage: UIImage? = nil) {
        let imageUrl = urlString?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        self.sd_setImage(with: URL(string: imageUrl ?? ""), placeholderImage: nil, options: [.scaleDownLargeImages], completed: nil)
        self.sd_imageTransition = .fade
    }
}

extension UIView {
    func addCornerRadius(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    func addBorder(color: UIColor? = UIColor.lightGray.withAlphaComponent(0.5)) {
        layer.borderWidth = 1.0
        layer.borderColor = color?.cgColor
    }
}

extension Int64 {

    func formatUsingAbbrevation() -> String? {
        let numFormatter = NumberFormatter()

        typealias Abbrevation = (threshold:Double, divisor:Double, suffix:String)
        let abbreviations:[Abbrevation] = [(0, 1, ""),
                                           (1000.0, 1000.0, "K"),
                                           (100_000.0, 1_000_000.0, "M"),
                                           (100_000_000.0, 1_000_000_000.0, "B")]
        let startValue = Double (abs(self))
        let abbreviation:Abbrevation = {
            var prevAbbreviation = abbreviations[0]
            for tmpAbbreviation in abbreviations {
                if (startValue < tmpAbbreviation.threshold) {
                    break
                }
                prevAbbreviation = tmpAbbreviation
            }
            return prevAbbreviation
        } ()

        let value = Double(self) / abbreviation.divisor
        numFormatter.positiveSuffix = abbreviation.suffix
        numFormatter.negativeSuffix = abbreviation.suffix
        numFormatter.allowsFloats = true
        numFormatter.minimumIntegerDigits = 1
        numFormatter.minimumFractionDigits = 0
        numFormatter.maximumFractionDigits = 1

        return numFormatter.string(from: NSNumber(value: value))
    }
}

extension String {
    func toDate(dateFormat: DateFormats) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.rawValue
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.date(from: self)
    }
}

extension Date {
    func toString(dateFormat: DateFormats) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.rawValue
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.string(from: self)
    }
    
    func timeAgoSince() -> String {
        
        let calendar = Calendar.current
        let now = Date()
        let unitFlags: NSCalendar.Unit = [.second, .minute, .hour, .day, .weekOfYear, .month, .year]
        let components = (calendar as NSCalendar).components(unitFlags, from: self, to: now, options: [])
        
        if let year = components.year, year >= 2 {
            return "\(year) years ago"
        }
        
        if let year = components.year, year >= 1 {
            return "Last year"
        }
        
        if let month = components.month, month >= 2 {
            return "\(month) months ago"
        }
        
        if let month = components.month, month >= 1 {
            return "Last month"
        }
        
        if let week = components.weekOfYear, week >= 2 {
            return "\(week) weeks ago"
        }
        
        if let week = components.weekOfYear, week >= 1 {
            return "Last week"
        }
        
        if let day = components.day, day >= 2 {
            return "\(day) days"
        }
        
        if let day = components.day, day >= 1 {
            return "Yesterday"
        }
        
        if let hour = components.hour, hour >= 1 {
            return "\(hour) hr"
        }
        
        if let minute = components.minute, minute >= 1 {
            return "\(minute) min"
        }
        
        return "a moments ago"
        
    }
}

extension NSMutableAttributedString {
    
    convenience init(string: String, type: FontTypeEnum, size: CGFloat, textColor: UIColor?) {
        let attrs: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.setFont(type: type, size: size) ?? UIFont(),
            NSAttributedString.Key.foregroundColor: textColor ?? UIColor.black
        ]
        self.init(string: string, attributes: attrs)
    }
}

extension UIFont {
    static func setFont(type: FontTypeEnum, size: CGFloat) -> UIFont? {
        switch type {
        case .regular: return UIFont(name: "HelveticaNeue", size: size)
        case .bold: return UIFont(name: "HelveticaNeue-Bold", size: size)
        }
    }
}

extension CodingUserInfoKey {
   static let context = CodingUserInfoKey(rawValue: "context")
}
