//
//  HandVC.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.11.2020.
//

import UIKit
import AVFoundation
import Vision

class MyCustomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    func setup() {

        // Create a CAShapeLayer
        let shapeLayer = CAShapeLayer()

        // The Bezier path that we made needs to be converted to
        // a CGPath before it can be used on a layer.
        shapeLayer.path = createBezierPath().cgPath

        // apply other properties related to the path
        shapeLayer.strokeColor = UIColor.background.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 3.0
        shapeLayer.position = CGPoint(x: 10, y: 10)

        // add the new layer to our custom view
        self.layer.addSublayer(shapeLayer)
    }

    func createBezierPath() -> UIBezierPath {
        //// Color Declarations
        let strokeColor = UIColor(red: 0.596, green: 0.576, blue: 0.914, alpha: 1.000)

        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 260.12, y: 190.9))
        bezierPath.addCurve(to: CGPoint(x: 248.06, y: 201.11), controlPoint1: CGPoint(x: 256.43, y: 194.06), controlPoint2: CGPoint(x: 252.17, y: 197.71))
        bezierPath.addCurve(to: CGPoint(x: 242.94, y: 196.77), controlPoint1: CGPoint(x: 244.29, y: 204.22), controlPoint2: CGPoint(x: 240.43, y: 200.96))
        bezierPath.addCurve(to: CGPoint(x: 288.46, y: 129.12), controlPoint1: CGPoint(x: 254.5, y: 177.47), controlPoint2: CGPoint(x: 275.2, y: 147.85))
        bezierPath.addCurve(to: CGPoint(x: 294.25, y: 120.95), controlPoint1: CGPoint(x: 290.61, y: 126.08), controlPoint2: CGPoint(x: 292.56, y: 123.33))
        bezierPath.move(to: CGPoint(x: 260.12, y: 190.9))
        bezierPath.addLine(to: CGPoint(x: 260.45, y: 190.62))
        bezierPath.move(to: CGPoint(x: 260.12, y: 190.9))
        bezierPath.addCurve(to: CGPoint(x: 260.45, y: 190.62), controlPoint1: CGPoint(x: 260.23, y: 190.81), controlPoint2: CGPoint(x: 260.34, y: 190.71))
        bezierPath.move(to: CGPoint(x: 295.07, y: 119.8))
        bezierPath.addLine(to: CGPoint(x: 295.31, y: 119.46))
        bezierPath.addCurve(to: CGPoint(x: 307.78, y: 101.37), controlPoint1: CGPoint(x: 305.49, y: 105.15), controlPoint2: CGPoint(x: 307.23, y: 102.62))
        bezierPath.addCurve(to: CGPoint(x: 310.09, y: 79.52), controlPoint1: CGPoint(x: 311.75, y: 93.9), controlPoint2: CGPoint(x: 312.4, y: 84.5))
        bezierPath.addCurve(to: CGPoint(x: 291.29, y: 70.66), controlPoint1: CGPoint(x: 307.78, y: 74.54), controlPoint2: CGPoint(x: 298.48, y: 69.3))
        bezierPath.addCurve(to: CGPoint(x: 251.45, y: 109.55), controlPoint1: CGPoint(x: 286.62, y: 71.55), controlPoint2: CGPoint(x: 276.27, y: 77.18))
        bezierPath.addLine(to: CGPoint(x: 251.34, y: 109.69))
        bezierPath.addCurve(to: CGPoint(x: 203.35, y: 167.56), controlPoint1: CGPoint(x: 240.01, y: 124.45), controlPoint2: CGPoint(x: 216.43, y: 155.18))
        bezierPath.addCurve(to: CGPoint(x: 198.65, y: 164.55), controlPoint1: CGPoint(x: 200.62, y: 170.15), controlPoint2: CGPoint(x: 197.56, y: 168.14))
        bezierPath.addCurve(to: CGPoint(x: 239, y: 69.83), controlPoint1: CGPoint(x: 205.27, y: 142.74), controlPoint2: CGPoint(x: 228.21, y: 93.16))
        bezierPath.move(to: CGPoint(x: 295.07, y: 119.8))
        bezierPath.addLine(to: CGPoint(x: 294.96, y: 119.96))
        bezierPath.move(to: CGPoint(x: 295.07, y: 119.8))
        bezierPath.addCurve(to: CGPoint(x: 294.96, y: 119.96), controlPoint1: CGPoint(x: 295.03, y: 119.85), controlPoint2: CGPoint(x: 295, y: 119.9))
        bezierPath.move(to: CGPoint(x: 239.04, y: 69.74))
        bezierPath.addCurve(to: CGPoint(x: 253.81, y: 36.43), controlPoint1: CGPoint(x: 247.79, y: 50.86), controlPoint2: CGPoint(x: 252.78, y: 40.01))
        bezierPath.addCurve(to: CGPoint(x: 243.74, y: 13.23), controlPoint1: CGPoint(x: 255.93, y: 28.9), controlPoint2: CGPoint(x: 251.41, y: 18.49))
        bezierPath.addCurve(to: CGPoint(x: 223.25, y: 11.47), controlPoint1: CGPoint(x: 237.4, y: 8.77), controlPoint2: CGPoint(x: 229.89, y: 8.7))
        bezierPath.addCurve(to: CGPoint(x: 184.67, y: 79.48), controlPoint1: CGPoint(x: 214.95, y: 14.93), controlPoint2: CGPoint(x: 205.97, y: 34.06))
        bezierPath.move(to: CGPoint(x: 239.04, y: 69.74))
        bezierPath.addLine(to: CGPoint(x: 239, y: 69.83))
        bezierPath.move(to: CGPoint(x: 239.04, y: 69.74))
        bezierPath.addCurve(to: CGPoint(x: 239, y: 69.83), controlPoint1: CGPoint(x: 239.03, y: 69.77), controlPoint2: CGPoint(x: 239.02, y: 69.8))
        bezierPath.move(to: CGPoint(x: 184.67, y: 79.48))
        bezierPath.addLine(to: CGPoint(x: 184.65, y: 79.52))
        bezierPath.move(to: CGPoint(x: 184.67, y: 79.48))
        bezierPath.addCurve(to: CGPoint(x: 184.65, y: 79.52), controlPoint1: CGPoint(x: 184.66, y: 79.49), controlPoint2: CGPoint(x: 184.65, y: 79.51))
        bezierPath.move(to: CGPoint(x: 106.5, y: 88.88))
        bezierPath.addLine(to: CGPoint(x: 106.39, y: 89.31))
        bezierPath.move(to: CGPoint(x: 106.5, y: 88.88))
        bezierPath.addLine(to: CGPoint(x: 106.53, y: 88.74))
        bezierPath.move(to: CGPoint(x: 106.5, y: 88.88))
        bezierPath.addCurve(to: CGPoint(x: 106.53, y: 88.74), controlPoint1: CGPoint(x: 106.51, y: 88.83), controlPoint2: CGPoint(x: 106.52, y: 88.79))
        bezierPath.move(to: CGPoint(x: 106.39, y: 89.31))
        bezierPath.addCurve(to: CGPoint(x: 106.33, y: 89.55), controlPoint1: CGPoint(x: 106.37, y: 89.39), controlPoint2: CGPoint(x: 106.35, y: 89.47))
        bezierPath.move(to: CGPoint(x: 106.39, y: 89.31))
        bezierPath.addLine(to: CGPoint(x: 106.33, y: 89.55))
        bezierPath.move(to: CGPoint(x: 268.92, y: 241.12))
        bezierPath.addLine(to: CGPoint(x: 269.23, y: 240.82))
        bezierPath.move(to: CGPoint(x: 268.92, y: 241.12))
        bezierPath.addLine(to: CGPoint(x: 267.46, y: 242.59))
        bezierPath.move(to: CGPoint(x: 268.92, y: 241.12))
        bezierPath.addCurve(to: CGPoint(x: 267.46, y: 242.59), controlPoint1: CGPoint(x: 268.44, y: 241.6), controlPoint2: CGPoint(x: 267.95, y: 242.09))
        bezierPath.move(to: CGPoint(x: 269.23, y: 240.82))
        bezierPath.addLine(to: CGPoint(x: 270.46, y: 239.57))
        bezierPath.move(to: CGPoint(x: 269.23, y: 240.82))
        bezierPath.addCurve(to: CGPoint(x: 270.46, y: 239.57), controlPoint1: CGPoint(x: 269.63, y: 240.41), controlPoint2: CGPoint(x: 270.04, y: 239.99))
        bezierPath.move(to: CGPoint(x: 106.33, y: 89.55))
        bezierPath.addLine(to: CGPoint(x: 106.33, y: 89.56))
        bezierPath.addCurve(to: CGPoint(x: 96.34, y: 127.63), controlPoint1: CGPoint(x: 103.2, y: 102.4), controlPoint2: CGPoint(x: 100.23, y: 114.55))
        bezierPath.addCurve(to: CGPoint(x: 73.69, y: 173.45), controlPoint1: CGPoint(x: 87.08, y: 158.73), controlPoint2: CGPoint(x: 73.84, y: 173.29))
        bezierPath.addCurve(to: CGPoint(x: 70.2, y: 175.54), controlPoint1: CGPoint(x: 72.38, y: 174.98), controlPoint2: CGPoint(x: 71.21, y: 175.69))
        bezierPath.addCurve(to: CGPoint(x: 69, y: 175.13), controlPoint1: CGPoint(x: 69.83, y: 175.5), controlPoint2: CGPoint(x: 69.42, y: 175.35))
        bezierPath.addCurve(to: CGPoint(x: 62.82, y: 167.83), controlPoint1: CGPoint(x: 66.54, y: 173.8), controlPoint2: CGPoint(x: 64, y: 170))
        bezierPath.addCurve(to: CGPoint(x: 32.54, y: 98.27), controlPoint1: CGPoint(x: 58.97, y: 160.72), controlPoint2: CGPoint(x: 39.73, y: 106.95))
        bezierPath.addCurve(to: CGPoint(x: 13.39, y: 92.24), controlPoint1: CGPoint(x: 27.85, y: 92.62), controlPoint2: CGPoint(x: 19.33, y: 89.69))
        bezierPath.addCurve(to: CGPoint(x: -0.5, y: 109.55), controlPoint1: CGPoint(x: 2.51, y: 94.83), controlPoint2: CGPoint(x: -0.4, y: 104.86))
        bezierPath.addCurve(to: CGPoint(x: 4.5, y: 159.5), controlPoint1: CGPoint(x: -0.52, y: 109.92), controlPoint2: CGPoint(x: 3.92, y: 148.44))
        bezierPath.addLine(to: CGPoint(x: 7.5, y: 184.5))
        bezierPath.addLine(to: CGPoint(x: 12, y: 205.5))
        bezierPath.addCurve(to: CGPoint(x: 17, y: 225), controlPoint1: CGPoint(x: 12.74, y: 210.36), controlPoint2: CGPoint(x: 16.73, y: 221.32))
        bezierPath.addCurve(to: CGPoint(x: 26.33, y: 304.33), controlPoint1: CGPoint(x: 25.18, y: 265.7), controlPoint2: CGPoint(x: 26.33, y: 298.44))
        bezierPath.addCurve(to: CGPoint(x: 26.33, y: 353.18), controlPoint1: CGPoint(x: 26.33, y: 309.01), controlPoint2: CGPoint(x: 26.33, y: 332.23))
        bezierPath.addCurve(to: CGPoint(x: 30.5, y: 358.24), controlPoint1: CGPoint(x: 26.33, y: 355.63), controlPoint2: CGPoint(x: 28.1, y: 357.71))
        bezierPath.addCurve(to: CGPoint(x: 116.09, y: 404.13), controlPoint1: CGPoint(x: 47.84, y: 362.07), controlPoint2: CGPoint(x: 82.8, y: 375.15))
        bezierPath.addCurve(to: CGPoint(x: 126.75, y: 402.42), controlPoint1: CGPoint(x: 119.01, y: 406.67), controlPoint2: CGPoint(x: 124.19, y: 405.31))
        bezierPath.addCurve(to: CGPoint(x: 142.86, y: 389.33), controlPoint1: CGPoint(x: 131.58, y: 396.96), controlPoint2: CGPoint(x: 139.07, y: 393))
        bezierPath.addLine(to: CGPoint(x: 165.22, y: 366.81))
        bezierPath.addCurve(to: CGPoint(x: 242.06, y: 269.83), controlPoint1: CGPoint(x: 213.98, y: 319.19), controlPoint2: CGPoint(x: 234.24, y: 280.32))
        bezierPath.addCurve(to: CGPoint(x: 267.46, y: 242.59), controlPoint1: CGPoint(x: 248.07, y: 262.61), controlPoint2: CGPoint(x: 256.06, y: 254.13))
        bezierPath.addLine(to: CGPoint(x: 267.46, y: 242.59))
        bezierPath.move(to: CGPoint(x: 260.45, y: 190.62))
        bezierPath.addCurve(to: CGPoint(x: 315.2, y: 151.04), controlPoint1: CGPoint(x: 277.7, y: 175.89), controlPoint2: CGPoint(x: 299.05, y: 157.67))
        bezierPath.addCurve(to: CGPoint(x: 324.38, y: 151.96), controlPoint1: CGPoint(x: 317.94, y: 149.92), controlPoint2: CGPoint(x: 321.2, y: 150.24))
        bezierPath.addCurve(to: CGPoint(x: 330.31, y: 157.19), controlPoint1: CGPoint(x: 326.59, y: 153.15), controlPoint2: CGPoint(x: 328.65, y: 154.96))
        bezierPath.addCurve(to: CGPoint(x: 331.11, y: 175.84), controlPoint1: CGPoint(x: 334.92, y: 163.35), controlPoint2: CGPoint(x: 335.23, y: 170.66))
        bezierPath.addCurve(to: CGPoint(x: 270.46, y: 239.57), controlPoint1: CGPoint(x: 321.67, y: 187.67), controlPoint2: CGPoint(x: 293.53, y: 216.19))
        bezierPath.addLine(to: CGPoint(x: 270.46, y: 239.57))
        bezierPath.addLine(to: CGPoint(x: 270.46, y: 239.57))
        bezierPath.addLine(to: CGPoint(x: 270.46, y: 239.57))
        bezierPath.addLine(to: CGPoint(x: 270.46, y: 239.57))
        bezierPath.move(to: CGPoint(x: 294.96, y: 119.96))
        bezierPath.addLine(to: CGPoint(x: 294.96, y: 119.96))
        bezierPath.move(to: CGPoint(x: 294.96, y: 119.96))
        bezierPath.addCurve(to: CGPoint(x: 294.25, y: 120.95), controlPoint1: CGPoint(x: 294.73, y: 120.28), controlPoint2: CGPoint(x: 294.49, y: 120.61))
        bezierPath.move(to: CGPoint(x: 184.65, y: 79.52))
        bezierPath.addCurve(to: CGPoint(x: 149.59, y: 146.42), controlPoint1: CGPoint(x: 175.49, y: 99.04), controlPoint2: CGPoint(x: 157.56, y: 137.24))
        bezierPath.addCurve(to: CGPoint(x: 145.82, y: 145.86), controlPoint1: CGPoint(x: 148.39, y: 147.79), controlPoint2: CGPoint(x: 146.42, y: 147.58))
        bezierPath.addCurve(to: CGPoint(x: 162.75, y: 50.22), controlPoint1: CGPoint(x: 142.5, y: 136.24), controlPoint2: CGPoint(x: 148.17, y: 104.15))
        bezierPath.addCurve(to: CGPoint(x: 168.47, y: 25.53), controlPoint1: CGPoint(x: 167.3, y: 33.35), controlPoint2: CGPoint(x: 168.64, y: 28.24))
        bezierPath.addCurve(to: CGPoint(x: 155.65, y: 2.17), controlPoint1: CGPoint(x: 169.91, y: 17.39), controlPoint2: CGPoint(x: 164.07, y: 6.71))
        bezierPath.addCurve(to: CGPoint(x: 153.47, y: 1.15), controlPoint1: CGPoint(x: 154.93, y: 1.79), controlPoint2: CGPoint(x: 154.2, y: 1.45))
        bezierPath.addCurve(to: CGPoint(x: 127.28, y: 16.46), controlPoint1: CGPoint(x: 148.71, y: -0.68), controlPoint2: CGPoint(x: 136.62, y: -2.86))
        bezierPath.addCurve(to: CGPoint(x: 106.53, y: 88.74), controlPoint1: CGPoint(x: 117.19, y: 44.97), controlPoint2: CGPoint(x: 111.78, y: 67.18))
        bezierPath.move(to: CGPoint(x: 294.96, y: 119.96))
        bezierPath.addCurve(to: CGPoint(x: 294.25, y: 120.95), controlPoint1: CGPoint(x: 294.73, y: 120.28), controlPoint2: CGPoint(x: 294.49, y: 120.61))
        bezierPath.move(to: CGPoint(x: 294.96, y: 119.96))
        bezierPath.addLine(to: CGPoint(x: 294.25, y: 120.95))
        strokeColor.setStroke()
        bezierPath.lineWidth = 5
        bezierPath.miterLimit = 4
        bezierPath.stroke()

        return bezierPath
    }
}

class HandVC: BaseVC, AVCaptureVideoDataOutputSampleBufferDelegate {

    let label = UILabel()

    var gameTimer  : Timer?
    
    let cameraView = UIView()
    
    var captureSession = AVCaptureSession()
    
    var frontCamera : AVCaptureDevice?
    
    var backCamera : AVCaptureDevice?
    
    var currentCamera : AVCaptureDevice?
    
    var photoOutput : AVCapturePhotoOutput?
    
    var cameraPreviewLayer : AVCaptureVideoPreviewLayer?
    
    func setupCaptureSession() {
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
    }
    
    func setupDevice() {
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.back)
        let devices = deviceDiscoverySession.devices
        for device in devices {
            if device.position == AVCaptureDevice.Position.back {
                backCamera = device
            } else if device.position == AVCaptureDevice.Position.front {
                frontCamera = device
            }
            currentCamera = backCamera
        }
    }

    func setupInputOutput() {
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera!)
            captureSession.addInput(captureDeviceInput)
            photoOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])], completionHandler: nil)
        } catch {
            print(error)
        }
    }
    
    func setupPreviewLayer() {
        cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        cameraPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        let window = UIApplication.shared.keyWindow!
        cameraPreviewLayer?.frame = window.frame
        self.view.layer.insertSublayer(cameraPreviewLayer!, at: 0)
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "label"))
        captureSession.addOutput(dataOutput)
    }
    
    func startRunningCaptureSession() {
        captureSession.startRunning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.setTitleLabel(on: view)
        label.text = "Point phone's camera at your palm".localized()

        setupCaptureSession()
        setupDevice()
        setupInputOutput()
        setupPreviewLayer()
        startRunningCaptureSession()
        
        let myView = MyCustomView()
        myView.frame = self.view.frame
        myView.backgroundColor = UIColor.clear
        view.addSubview(myView)
        myView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myView.topAnchor.constraint(equalTo: label.bottomAnchor),
        ])
    }
    
    override func viewDidDisappear(_ animated: Bool)    {
        super.viewWillDisappear(animated)
        guard let navigationController = navigationController else { return }
        navigationController.viewControllers.removeAll(where: { self === $0 })
    }
    
    @objc
    private func goToDateOfBirthVC() {
        let vc = PayWallVC()
        guard let navigationController = navigationController else { return }
        navigationController.pushViewController(vc, animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        if AVCaptureDevice.authorizationStatus(for: .video) ==  .authorized {
            guard let pixelBuffer : CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
            guard let model = try? VNCoreMLModel(for: MobileNet().model) else { return }
            let request = VNCoreMLRequest(model: model) { (finished, err) in
                guard let results = finished.results as? [VNClassificationObservation] else { return }
                guard let first = results.first else { return }
                print(first.identifier)
                if first.identifier.contains("Band Aid") {
                    DispatchQueue.main.async {
                        self.captureSession.stopRunning()
                        self.showUniversalLoadingView(true, loadingText: "Ладоха супер")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            let vc = PayWallVC()
                            guard let navigationController = self.navigationController else { return }
                            navigationController.pushViewController(vc, animated: true)
                            self.dismiss(animated: true, completion: nil)
                            self.showUniversalLoadingView(false)
                        }
                    }
                }
            }
            try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
        } else {
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
                if granted {
                    guard let pixelBuffer : CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
                    guard let model = try? VNCoreMLModel(for: MobileNet().model) else { return }
                    let request = VNCoreMLRequest(model: model) { (finished, err) in
                        guard let results = finished.results as? [VNClassificationObservation] else { return }
                        guard let first = results.first else { return }
                        print(first.identifier)
                        if first.identifier.contains("Band Aid") {
                            DispatchQueue.main.async {
                                let vc = PayWallVC()
                                guard let navigationController = self.navigationController else { return }
                                navigationController.pushViewController(vc, animated: true)
                                self.dismiss(animated: true, completion: nil)
                            }
                        }
                    }
                    try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
                } else {
                    DispatchQueue.main.async {
                        let vc = PayWallVC()
                        guard let navigationController = self.navigationController else { return }
                        navigationController.pushViewController(vc, animated: true)
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            })
        }
    }
    
    @objc
    func runTimedCode() {
        let vc = PayWallVC()
        guard let navigationController = self.navigationController else { return }
        navigationController.pushViewController(vc, animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    func showUniversalLoadingView(_ show: Bool, loadingText : String = "") {
        let existingView = UIApplication.shared.windows[0].viewWithTag(1200)
        if show {
            if existingView != nil {
                return
            }
            let loadingView = self.makeLoadingView(withFrame: UIScreen.main.bounds, loadingText: loadingText)
            loadingView?.tag = 1200
            UIApplication.shared.windows[0].addSubview(loadingView!)
        } else {
            existingView?.removeFromSuperview()
        }
    }
    
    func makeLoadingView(withFrame frame: CGRect, loadingText text: String?) -> UIView? {
        let loadingView = UIView(frame: frame)
        loadingView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        //activityIndicator.backgroundColor = UIColor(red:0.16, green:0.17, blue:0.21, alpha:1)
        activityIndicator.layer.cornerRadius = 6
        activityIndicator.center = loadingView.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .white
        activityIndicator.startAnimating()
        activityIndicator.tag = 100 // 100 for example

        loadingView.addSubview(activityIndicator)
        if !text!.isEmpty {
            let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
            let cpoint = CGPoint(x: activityIndicator.frame.origin.x + activityIndicator.frame.size.width / 2, y: activityIndicator.frame.origin.y + 80)
            lbl.center = cpoint
            lbl.textColor = UIColor.white
            lbl.textAlignment = .center
            lbl.text = text
            lbl.tag = 1234
            loadingView.addSubview(lbl)
        }
        return loadingView
    }
}
