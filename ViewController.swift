//
//  ViewController.swift
//
//  Created by Apple on 17.05.21.
//

import UIKit

class ViewController: UIViewController {
    var logoImage: [UIImage] = [
        UIImage(named: "first.jpeg")!,
        UIImage(named: "second.jpeg")!,
        UIImage(named: "third.jpeg")!,
        UIImage(named: "fourth.png")!
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        stackedGrid(rows: 2, columns: 2, rootView: view)
    }

    @objc func onButton(sender: UIButton){
        let imageView = sender.currentImage as! UIImage
        let newImageView = UIImageView(image: imageView)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }

    func stackedGrid(rows: Int, columns: Int, rootView: UIView){

        // Init StackView
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10

//        amountDisplayLabel.backgroundColor = .green
//        stackView.addArrangedSubview(amountDisplayLabel)

        for row in 0 ..< rows {
            let horizontalSv = UIStackView()
            horizontalSv.axis = .horizontal
            horizontalSv.alignment = .fill
            horizontalSv.distribution = .fillEqually
            horizontalSv.spacing = 10

            for col in 0 ..< columns {
                let button = UIButton()
                button.backgroundColor = .orange
                button.layer.cornerRadius = 6
                button.setImage(logoImage[(row + col) + 1], for: .normal)
                button.addTarget(self, action: #selector(onButton), for: .touchUpInside)
                horizontalSv.addArrangedSubview(button)
            }
            stackView.addArrangedSubview(horizontalSv)
        }

        rootView.addSubview(stackView)

        // add constraints
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: rootView.topAnchor, constant: 170).isActive = true
        stackView.leftAnchor.constraint(equalTo: rootView.leftAnchor, constant: 10).isActive = true
        stackView.rightAnchor.constraint(equalTo: rootView.rightAnchor, constant: -10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: rootView.bottomAnchor, constant: -170).isActive = true
    }
}


