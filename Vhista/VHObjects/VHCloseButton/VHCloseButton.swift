//
//  VHCloseButton.swift
//  Vhista
//
//  Created by Juan David Cruz Serrano on 8/31/19.
//  Copyright © 2019 juandavidcruz. All rights reserved.
//

import UIKit

class VHCloseButton: UIButton {

    static let closeButtonSize: CGFloat = 35.0
    static let xmarkImageSize: CGFloat = 25.0
    static let systemImageName: String = "xmark"

    var circleBackgroundView = UIView()
    var xmarkImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpBackground()
        setUpButtonImage()
        setUpAccessibility()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpBackground()
        setUpButtonImage()
        setUpAccessibility()
    }
}

extension VHCloseButton {
    func setUpBackground() {
        circleBackgroundView = UIView(frame: .zero)
        circleBackgroundView.backgroundColor = getLabelDarkColorIfSupported(color: .darkGray)
        circleBackgroundView.layer.cornerRadius = VHCloseButton.closeButtonSize/2
        circleBackgroundView.layer.masksToBounds = true
        self.addSubview(circleBackgroundView)
        circleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circleBackgroundView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            circleBackgroundView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            circleBackgroundView.widthAnchor.constraint(equalToConstant: VHCloseButton.closeButtonSize),
            circleBackgroundView.heightAnchor.constraint(equalToConstant: VHCloseButton.closeButtonSize)
        ])
    }

    func setUpButtonImage() {
        xmarkImageView = UIImageView(frame: .zero)
        xmarkImageView.contentMode = .scaleAspectFit
        xmarkImageView.tintColor = getLabelDarkColorIfSupported(color: .white)
        if #available(iOS 13.0, *) {
            xmarkImageView.image = UIImage(systemName: VHCloseButton.systemImageName)
        } else {
            xmarkImageView.image = UIImage()
        }
        self.addSubview(xmarkImageView)
        self.bringSubviewToFront(xmarkImageView)
        xmarkImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            xmarkImageView.centerXAnchor.constraint(equalTo: circleBackgroundView.centerXAnchor),
            xmarkImageView.centerYAnchor.constraint(equalTo: circleBackgroundView.centerYAnchor),
            xmarkImageView.widthAnchor.constraint(equalToConstant: VHCloseButton.xmarkImageSize),
            xmarkImageView.heightAnchor.constraint(equalToConstant: VHCloseButton.xmarkImageSize)
        ])
    }
}

extension VHCloseButton {
    func setUpAccessibility() {
        self.accessibilityLabel = NSLocalizedString("dismiss", comment: "")
    }
}
