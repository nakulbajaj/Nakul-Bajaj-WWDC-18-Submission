//: Playground - noun: a place where people can play

import UIKit
import SceneKit
import AVFoundation
import PlaygroundSupport

var clickEffectPlayer: AVAudioPlayer?
let path = Bundle.main.path(forResource: "clickEffect.mp3", ofType: nil)!
let url = URL(fileURLWithPath: path)
var substance = "Water (H₂O)"

class StartView: UIView {
    
    //Initialization of StartView - second method sets background color
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    //Main drawing method
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        //App header
        let appHeaderLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 750, height: 45))
        appHeaderLabel.center = CGPoint(x: 375, y: -255)
        appHeaderLabel.textAlignment = .center
        appHeaderLabel.text = "Visualizing Chemical Substances"
        appHeaderLabel.font = UIFont(name: ".SFUIText-Medium", size: 36)
        appHeaderLabel.textColor = UIColor.white
        self.addSubview(appHeaderLabel)
        
        let authorLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 800, height: 30))
        authorLabel.center = CGPoint(x: 375, y: 770)
        authorLabel.textAlignment = .center
        authorLabel.text = "Nakul Bajaj"
        authorLabel.font = UIFont(name: ".SFUIText-Light", size: 18.0)
        authorLabel.textColor = UIColor.white
        self.addSubview(authorLabel)
        
        let startButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
        startButton.backgroundColor = UIColor.black
        startButton.layer.borderWidth = 2.0
        startButton.layer.borderColor = UIColor.white.cgColor
        startButton.setTitle("EXPLORE ▶", for: .normal)
        startButton.titleLabel?.font = UIFont(name: ".SFUIText-Light", size: 30.0)
        startButton.layer.cornerRadius = 0.05 * startButton.bounds.size.width
        startButton.clipsToBounds = true
        startButton.setTitleColor(UIColor.white, for: .normal)
        startButton.center = CGPoint(x: 375, y: -50)
        startButton.addTarget(self, action: #selector(self.startPressed(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(startButton)
        
        UIView.animate(withDuration: 0.7) {
            appHeaderLabel.center = CGPoint(x: 375, y: 45)
            startButton.center = CGPoint(x: 375, y: 250)
            authorLabel.center = CGPoint(x: 375, y: 470)
        }
    }
    
    @objc func startPressed(_ sender: UIButton){
        PlaygroundPage.current.liveView = AboutView(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        
        do {
            clickEffectPlayer = try AVAudioPlayer(contentsOf: url)
            clickEffectPlayer?.play()
        } catch {
            print("Sound effect failed")
        }
    }
}

class AboutView: UIView {
    
    //Initialization of StartView - second method sets background color
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black
    }
    
    //Main drawing method
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let aboutMeHeaderLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        aboutMeHeaderLabel.center = CGPoint(x: 375, y: -155)
        aboutMeHeaderLabel.textAlignment = .center
        aboutMeHeaderLabel.text = "Hey there 👋 - my name is Nakul"
        aboutMeHeaderLabel.font = UIFont(name: ".SFUIText-Medium", size: 36.0)
        aboutMeHeaderLabel.textColor = UIColor.white
        self.addSubview(aboutMeHeaderLabel)
        
        let portraitImage = UIImageView(image: UIImage(named: "Portrait.JPG"))
        portraitImage.frame = CGRect(x: 0, y: 0, width: 290, height: 218)
        portraitImage.center = CGPoint(x: 1000, y: 185)
        portraitImage.layer.borderWidth = 4.0
        portraitImage.layer.borderColor = UIColor.white.cgColor
        portraitImage.clipsToBounds = true
        self.addSubview(portraitImage)
        
        let captionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 290, height: 20))
        captionLabel.center = CGPoint(x: 1000, y: 310)
        captionLabel.textAlignment = .center
        captionLabel.text = "Nakul with his teacher, Mr. Irvine"
        captionLabel.font = UIFont(name: ".SFUIText-LightItalic", size: 17.0)
        captionLabel.textColor = UIColor.white
        self.addSubview(captionLabel)
        
        let buildReasonLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 290, height: 390))
        buildReasonLabel.center = CGPoint(x: -280, y: 195)
        buildReasonLabel.textAlignment = .left
        buildReasonLabel.text = "▶ My chemistry teacher, Mr. Andrew Irvine, and I were chatting about my passion for developing iOS apps, and he challenged me to create a chemical simulation to explain electronegativities.\n\n▶ I took him up on this challenge, and decided to make this playground which shows three-dimensional, accurate, space-fill models for common substances."
        buildReasonLabel.font = UIFont(name: ".SFUIText", size: 17.0)
        buildReasonLabel.lineBreakMode = .byWordWrapping
        buildReasonLabel.numberOfLines = 20
        buildReasonLabel.textColor = UIColor.white
        self.addSubview(buildReasonLabel)
        
        let secondBuildReasonLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 600, height: 390))
        secondBuildReasonLabel.center = CGPoint(x: 1000, y: 360)
        secondBuildReasonLabel.textAlignment = .left
        secondBuildReasonLabel.text = "▶ In the future, I can develop this playground into an app which can use electronegativity differences, bond types, and van der Waals radii to compute and make such models on the fly for any given compound."
        secondBuildReasonLabel.font = UIFont(name: ".SFUIText", size: 17.0)
        secondBuildReasonLabel.lineBreakMode = .byWordWrapping
        secondBuildReasonLabel.numberOfLines = 4
        secondBuildReasonLabel.textColor = UIColor.white
        self.addSubview(secondBuildReasonLabel)
        
        let continueButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 35))
        continueButton.backgroundColor = UIColor.black
        continueButton.layer.borderWidth = 2.0
        continueButton.layer.borderColor = UIColor.white.cgColor
        continueButton.setTitle("NEXT ▶", for: .normal)
        continueButton.titleLabel?.font = UIFont(name: ".SFUIText-Light", size: 24.0)
        continueButton.layer.cornerRadius = 0.05 * continueButton.bounds.size.width
        continueButton.clipsToBounds = true
        continueButton.setTitleColor(UIColor.white, for: .normal)
        continueButton.center = CGPoint(x: 625, y: 635)
        continueButton.addTarget(self, action: #selector(self.continuePressed(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(continueButton)
        
        UIView.animate(withDuration: 0.75) {
            aboutMeHeaderLabel.center = CGPoint(x: 375, y: 45)
            portraitImage.center = CGPoint(x: 530, y: 185)
            captionLabel.center = CGPoint(x: 530, y: 310)
            buildReasonLabel.center = CGPoint(x: 220, y: 195)
            secondBuildReasonLabel.center = CGPoint(x: 375, y: 360)
            continueButton.center = CGPoint(x: 625, y: 435)
        }
    }
    
    @objc func continuePressed(_ sender: UIButton){
        PlaygroundPage.current.liveView = ChooserView(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        do {
            clickEffectPlayer = try AVAudioPlayer(contentsOf: url)
            clickEffectPlayer?.play()
        } catch {
            print("Sound effect failed")
        }
    }
}

class ChooserView: UIView {
    //Initialization of StartView - second method sets background color
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black
    }
    
    override func draw(_ rect: CGRect) {
        let chooseCompoundLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        chooseCompoundLabel.center = CGPoint(x: 375, y: -155)
        chooseCompoundLabel.textAlignment = .center
        chooseCompoundLabel.text = "Choose a substance to examine:"
        chooseCompoundLabel.font = UIFont(name: ".SFUIText-Medium", size: 36.0)
        chooseCompoundLabel.textColor = UIColor.white
        self.addSubview(chooseCompoundLabel)
        
        let waterChooseButton = UIButton(frame: CGRect(x: 0, y: 0, width: 600, height: 60))
        waterChooseButton.backgroundColor = UIColor.black
        waterChooseButton.layer.borderWidth = 2.0
        waterChooseButton.layer.borderColor = UIColor.white.cgColor
        waterChooseButton.titleLabel?.font = UIFont(name: ".SFUIText-Light", size: 30.0)
        waterChooseButton.setTitle("Water (H₂O)", for: .normal)
        waterChooseButton.layer.cornerRadius = 0.02 * waterChooseButton.bounds.size.width
        waterChooseButton.clipsToBounds = true
        waterChooseButton.setTitleColor(UIColor.white, for: .normal)
        waterChooseButton.center = CGPoint(x: 375, y: 130)
        waterChooseButton.contentHorizontalAlignment = .left
        waterChooseButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
        waterChooseButton.addTarget(self, action: #selector(self.modeChosen(_:)), for: UIControlEvents.touchUpInside)
        waterChooseButton.alpha = 0
        self.addSubview(waterChooseButton)
        
        let waterIcon = UIImageView(image: UIImage(named: "waterIcon.png"))
        waterIcon.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        waterIcon.center = CGPoint(x: 640, y: 130)
        waterIcon.alpha = 0
        self.addSubview(waterIcon)
        
        let bakingSodaChooseButton = UIButton(frame: CGRect(x: 0, y: 0, width: 600, height: 60))
        bakingSodaChooseButton.backgroundColor = UIColor.black
        bakingSodaChooseButton.layer.borderWidth = 2.0
        bakingSodaChooseButton.layer.borderColor = UIColor.white.cgColor
        bakingSodaChooseButton.setTitle("Baking Soda (NaHCO₃)", for: .normal)
        bakingSodaChooseButton.titleLabel?.font = UIFont(name: ".SFUIText-Light", size: 30.0)
        bakingSodaChooseButton.layer.cornerRadius = 0.02 * bakingSodaChooseButton.bounds.size.width
        bakingSodaChooseButton.clipsToBounds = true
        bakingSodaChooseButton.setTitleColor(UIColor.white, for: .normal)
        bakingSodaChooseButton.center = CGPoint(x: 375, y: 205)
        bakingSodaChooseButton.contentHorizontalAlignment = .left
        bakingSodaChooseButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
        bakingSodaChooseButton.addTarget(self, action: #selector(self.modeChosen(_:)), for: UIControlEvents.touchUpInside)
        bakingSodaChooseButton.alpha = 0
        self.addSubview(bakingSodaChooseButton)
        
        let bakingSodaIcon = UIImageView(image: UIImage(named: "bakingSodaIcon.png"))
        bakingSodaIcon.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        bakingSodaIcon.center = CGPoint(x: 640, y: 205)
        bakingSodaIcon.alpha = 0
        self.addSubview(bakingSodaIcon)
        
        let saltChooseButton = UIButton(frame: CGRect(x: 0, y: 0, width: 600, height: 60))
        saltChooseButton.backgroundColor = UIColor.black
        saltChooseButton.layer.borderWidth = 2.0
        saltChooseButton.layer.borderColor = UIColor.white.cgColor
        saltChooseButton.setTitle("Salt (NaCl)", for: .normal)
        saltChooseButton.titleLabel?.font = UIFont(name: ".SFUIText-Light", size: 30.0)
        saltChooseButton.layer.cornerRadius = 0.02 * saltChooseButton.bounds.size.width
        saltChooseButton.clipsToBounds = true
        saltChooseButton.setTitleColor(UIColor.white, for: .normal)
        saltChooseButton.center = CGPoint(x: 375, y: 280)
        saltChooseButton.contentHorizontalAlignment = .left
        saltChooseButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
        saltChooseButton.addTarget(self, action: #selector(self.modeChosen(_:)), for: UIControlEvents.touchUpInside)
        saltChooseButton.alpha = 0
        self.addSubview(saltChooseButton)
        
        let saltIcon = UIImageView(image: UIImage(named: "saltIcon.png"))
        saltIcon.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        saltIcon.center = CGPoint(x: 640, y: 280)
        saltIcon.alpha = 0
        self.addSubview(saltIcon)
        
        let chalkChooseButton = UIButton(frame: CGRect(x: 0, y: 0, width: 600, height: 60))
        chalkChooseButton.backgroundColor = UIColor.black
        chalkChooseButton.layer.borderWidth = 2.0
        chalkChooseButton.layer.borderColor = UIColor.white.cgColor
        chalkChooseButton.setTitle("Chalk (CaCO₃)", for: .normal)
        chalkChooseButton.titleLabel?.font = UIFont(name: ".SFUIText-Light", size: 30.0)
        chalkChooseButton.layer.cornerRadius = 0.02 * chalkChooseButton.bounds.size.width
        chalkChooseButton.clipsToBounds = true
        chalkChooseButton.setTitleColor(UIColor.white, for: .normal)
        chalkChooseButton.center = CGPoint(x: 375, y: 355)
        chalkChooseButton.contentHorizontalAlignment = .left
        chalkChooseButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
        chalkChooseButton.addTarget(self, action: #selector(self.modeChosen(_:)), for: UIControlEvents.touchUpInside)
        chalkChooseButton.alpha = 0
        self.addSubview(chalkChooseButton)
        
        let chalkIcon = UIImageView(image: UIImage(named: "chalkIcon.png"))
        chalkIcon.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        chalkIcon.center = CGPoint(x: 640, y: 355)
        chalkIcon.alpha = 0
        self.addSubview(chalkIcon)
        
        let sulfuricAcidChooseButton = UIButton(frame: CGRect(x: 0, y: 0, width: 600, height: 60))
        sulfuricAcidChooseButton.backgroundColor = UIColor.black
        sulfuricAcidChooseButton.layer.borderWidth = 2.0
        sulfuricAcidChooseButton.layer.borderColor = UIColor.white.cgColor
        sulfuricAcidChooseButton.setTitle("Sulfuric Acid (H₂SO₄)", for: .normal)
        sulfuricAcidChooseButton.titleLabel?.font = UIFont(name: ".SFUIText-Light", size: 30.0)
        sulfuricAcidChooseButton.layer.cornerRadius = 0.02 * sulfuricAcidChooseButton.bounds.size.width
        sulfuricAcidChooseButton.clipsToBounds = true
        sulfuricAcidChooseButton.setTitleColor(UIColor.white, for: .normal)
        sulfuricAcidChooseButton.center = CGPoint(x: 375, y: 430)
        sulfuricAcidChooseButton.contentHorizontalAlignment = .left
        sulfuricAcidChooseButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
        sulfuricAcidChooseButton.addTarget(self, action: #selector(self.modeChosen(_:)), for: UIControlEvents.touchUpInside)
        sulfuricAcidChooseButton.alpha = 0
        self.addSubview(sulfuricAcidChooseButton)
        
        let sulfuricAcidIcon = UIImageView(image: UIImage(named: "sulfuricAcidIcon.png"))
        sulfuricAcidIcon.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        sulfuricAcidIcon.center = CGPoint(x: 640, y: 430)
        sulfuricAcidIcon.alpha = 0
        self.addSubview(sulfuricAcidIcon)
        
        UIView.animate(withDuration: 1) {
            chooseCompoundLabel.center = CGPoint(x: 375, y: 45)
            waterChooseButton.alpha = 1
            waterIcon.alpha = 1
            bakingSodaChooseButton.alpha = 1
            bakingSodaIcon.alpha = 1
            saltChooseButton.alpha = 1
            saltIcon.alpha = 1
            chalkChooseButton.alpha = 1
            chalkIcon.alpha = 1
            sulfuricAcidChooseButton.alpha = 1
            sulfuricAcidIcon.alpha = 1
        }
    }
    
    func playSound(){
        do {
            clickEffectPlayer = try AVAudioPlayer(contentsOf: url)
            clickEffectPlayer?.play()
        } catch {
            print("Sound effect failed")
        }
    }
    
    @objc func modeChosen(_ sender: UIButton){
        playSound()
        substance = sender.titleLabel!.text!
        PlaygroundPage.current.liveView = PeriodicTableEquation(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
    }
}

class PeriodicTableEquation: UIView {
    
    //Initialization of StartView - second method sets background color
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black
    }
    
    override func draw(_ rect: CGRect) {
        
        let periodicTableLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        periodicTableLabel.center = CGPoint(x: 375, y: -975)
        periodicTableLabel.textAlignment = .center
        periodicTableLabel.text = "Factors Influencing Bond Distance"
        periodicTableLabel.font = UIFont(name: ".SFUIText-Medium", size: 36.0)
        periodicTableLabel.textColor = UIColor.white
        self.addSubview(periodicTableLabel)
        
        let tableImage = UIImageView(image: UIImage(named: "H2OTable.png"))
        tableImage.frame = CGRect(x: 0, y: 0, width: 600, height: 232)
        tableImage.center = CGPoint(x: 375, y: -810)
        tableImage.layer.borderWidth = 1.0
        tableImage.layer.cornerRadius = 0.01 * tableImage.bounds.size.width
        tableImage.clipsToBounds = true
        tableImage.layer.borderColor = UIColor.white.cgColor
        
        self.addSubview(tableImage)
        
        let continueButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 35))
        continueButton.backgroundColor = UIColor.black
        continueButton.layer.borderWidth = 2.0
        continueButton.layer.borderColor = UIColor.white.cgColor
        continueButton.setTitle("NEXT ▶", for: .normal)
        continueButton.titleLabel?.font = UIFont(name: ".SFUIText-Light", size: 24.0)
        continueButton.layer.cornerRadius = 0.05 * continueButton.bounds.size.width
        continueButton.clipsToBounds = true
        continueButton.setTitleColor(UIColor.white, for: .normal)
        continueButton.center = CGPoint(x: 625, y: 635)
        continueButton.addTarget(self, action: #selector(self.simContinuePressed(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(continueButton)
        
        let equationLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 750, height: 50))
        equationLabel.center = CGPoint(x: 375, y: 595)
        equationLabel.textAlignment = .center
        equationLabel.font = UIFont(name: ".SFUIText-Light", size: 20.0)
        equationLabel.textColor = UIColor.white
        self.addSubview(equationLabel)
        
        let formationDiscriptionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 600, height: 200))
        formationDiscriptionLabel.center = CGPoint(x: 375, y: 707)
        formationDiscriptionLabel.textAlignment = .center
        formationDiscriptionLabel.lineBreakMode = .byWordWrapping
        formationDiscriptionLabel.numberOfLines = 4
        formationDiscriptionLabel.font = UIFont(name: ".SFUIText-Light", size: 16.0)
        formationDiscriptionLabel.textColor = UIColor.white
        self.addSubview(formationDiscriptionLabel)
        
        if(substance.hasPrefix("Water")){
            tableImage.image = UIImage(named: "H2OTable.png")
            equationLabel.text = "H₂²⁺ + O²⁻ → H₂O"
            formationDiscriptionLabel.text = "Ionic bonding: two hydrogen atoms donate their two extra electrons to an oxygen atom, which needs two more electrons to complete its outer shell. The electronegativity difference is 3.5 - 2.1 = 1.4."
        } else if(substance.hasPrefix("Baking")){
            tableImage.image = UIImage(named: "NaHCO3Table.png")
            equationLabel.text = "Na¹⁺ + HCO₃¹⁻ → NaHCO₃"
            formationDiscriptionLabel.text = "Ionic and covalent bonding: one sodium atom donates its extra electron to the HCO₃ polyatomic ion. HCO₃ shares electrons among its own atoms and needs one more electron to complete its oxygen's outer shell. The electronegativity difference is 3.5 - 0.9 = 2.6."
        } else if(substance.hasPrefix("Salt")){
            tableImage.image = UIImage(named: "NaClTable.png")
            equationLabel.text = "Na¹⁺ + Cl¹⁻ → NaCl"
            formationDiscriptionLabel.text = "Ionic bonding: one sodium atom donates its extra electron to an chlorine atom, which needs one more electron to complete its outer shell. The electronegativity difference is 3.0 - 0.9 = 2.1."
        } else if(substance.hasPrefix("Chalk")){
            tableImage.image = UIImage(named: "CaCO3Table.png")
            equationLabel.text = "Ca²⁺ + CO₃²⁻ → CaCO₃"
            formationDiscriptionLabel.text = "Ionic and covalent bonding: one calcium atom donates its two extra electrons to the CO₃ polyatomic ion. CO₃ shares electrons among its own atoms and needs two more electrons to complete two of its oxygens' outer shells. The electronegativity difference is 3.5 - 1.0 = 2.5."
        } else if(substance.hasPrefix("Sulfuric")){
            tableImage.image = UIImage(named: "H2SO4Table.png")
            equationLabel.text = "H₂²⁺ + SO₄²⁻ → H₂SO₄"
            formationDiscriptionLabel.text = "Ionic and covalent bonding: two hydrogen atoms donate their two extra electrons to the SO₄ polyatomic ion. SO₄ shares electrons among its own atoms and needs two more electrons to complete two of its oxygens' outer shells. The electronegativity difference is 3.5 - 2.1 = 1.4."
        }
        
        UIView.animate(withDuration: 0.75, delay: 0, options: .curveLinear, animations: {
            periodicTableLabel.center = CGPoint(x: 375, y: 45)
            tableImage.center = CGPoint(x: 375, y: 190)
        }) { (finished: Bool) in
            UIView.animate(withDuration: 0.75, animations: {
                continueButton.center = CGPoint(x: 625, y: 435)
                equationLabel.center = CGPoint(x: 375, y: 328)
                formationDiscriptionLabel.center = CGPoint(x: 375, y: 380)
            })
        }
        
    }
    
    @objc func simContinuePressed(_ sender: UIButton){
        if(substance.hasPrefix("Water")){
            PlaygroundPage.current.liveView = WaterModelView(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        } else if (substance.hasPrefix("Baking")){
            PlaygroundPage.current.liveView = BakingSodaModelView(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        } else if (substance.hasPrefix("Salt")){
            PlaygroundPage.current.liveView = SaltModelView(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        } else if (substance.hasPrefix("Chalk")){
            PlaygroundPage.current.liveView = ChalkModelView(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        } else if (substance.hasPrefix("Sulfuric Acid")){
            PlaygroundPage.current.liveView = SulfuricAcidModelView(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        }
        do {
            clickEffectPlayer = try AVAudioPlayer(contentsOf: url)
            clickEffectPlayer?.play()
        } catch {
            print("Sound effect failed")
        }
    }
}

class WaterModelView: UIView {
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black
    }
    
    override func draw(_ rect: CGRect) {
        
        let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        sceneView.backgroundColor = UIColor.black
        self.addSubview(sceneView)
        
        let scene = SCNScene()
        scene.background.contents = UIImage(named: "stars.png")
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 0, 25)
        scene.rootNode.addChildNode(cameraNode)
        
        let oxygenGeometry = SCNSphere(radius: 4)
        let oxygenMaterials = oxygenGeometry.materials
        oxygenMaterials[0].diffuse.contents = UIColor.red
        let oxygenNode = SCNNode(geometry: oxygenGeometry)
        oxygenNode.position = SCNVector3Make(0, 0, 0)
        scene.rootNode.addChildNode(oxygenNode)
        
        let hydrogenGeometry = SCNSphere(radius: 3.1579)
        let hydrogenNodeLeft = SCNNode(geometry: hydrogenGeometry)
        let hydrogenNodeRight = SCNNode(geometry: hydrogenGeometry)
        let materials = hydrogenGeometry.materials
        materials[0].diffuse.contents = UIColor.white
        hydrogenNodeLeft.position = SCNVector3Make(-1.9935, -1.5449, 0)
        hydrogenNodeRight.position = SCNVector3Make(1.9935, -1.5449, 0)
        scene.rootNode.addChildNode(hydrogenNodeLeft)
        scene.rootNode.addChildNode(hydrogenNodeRight)
        
        sceneView.scene = scene
        
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
        
        let waterSubstanceTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        waterSubstanceTitle.center = CGPoint(x: 375, y: 45)
        waterSubstanceTitle.textAlignment = .center
        waterSubstanceTitle.text = substance
        waterSubstanceTitle.font = UIFont(name: ".SFUIText-Medium", size: 36.0)
        waterSubstanceTitle.textColor = UIColor.white
        self.addSubview(waterSubstanceTitle)
        
        let goHomeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 270, height: 35))
        goHomeButton.backgroundColor = UIColor.clear
        goHomeButton.layer.borderWidth = 2.0
        goHomeButton.layer.borderColor = UIColor.white.cgColor
        goHomeButton.setTitle("ABOUT ME ▶", for: .normal)
        goHomeButton.titleLabel?.font = UIFont(name: ".SFUIText-Light", size: 24.0)
        goHomeButton.layer.cornerRadius = 0.02 * goHomeButton.bounds.size.width
        goHomeButton.clipsToBounds = true
        goHomeButton.setTitleColor(UIColor.white, for: .normal)
        goHomeButton.center = CGPoint(x: 540, y: 435)
        goHomeButton.addTarget(self, action: #selector(self.goHomePressed(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(goHomeButton)
        
        let chooseAnotherButton = UIButton(frame: CGRect(x: 0, y: 0, width: 270, height: 35))
        chooseAnotherButton.backgroundColor = UIColor.clear
        chooseAnotherButton.layer.borderWidth = 2.0
        chooseAnotherButton.layer.borderColor = UIColor.white.cgColor
        chooseAnotherButton.setTitle("PICK ANOTHER ▶", for: .normal)
        chooseAnotherButton.titleLabel?.font = UIFont(name: ".SFUIText-Light", size: 24.0)
        chooseAnotherButton.layer.cornerRadius = 0.02 * goHomeButton.bounds.size.width
        chooseAnotherButton.clipsToBounds = true
        chooseAnotherButton.setTitleColor(UIColor.white, for: .normal)
        chooseAnotherButton.center = CGPoint(x: 210, y: 435)
        chooseAnotherButton.addTarget(self, action: #selector(self.goHomePressed(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(chooseAnotherButton)
    }
    
    @objc func goHomePressed(_ sender: UIButton){
        if(sender.titleLabel!.text!.hasPrefix("PICK")){
            PlaygroundPage.current.liveView = ChooserView(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        } else {
            PlaygroundPage.current.liveView = AboutMeView(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        }
    }
}

class BakingSodaModelView: UIView {
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black
    }
    
    override func draw(_ rect: CGRect) {
        let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        sceneView.backgroundColor = UIColor.black
        self.addSubview(sceneView)
        
        let scene = SCNScene()
        
        scene.background.contents = UIImage(named: "stars.png")
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, -5, 33)
        scene.rootNode.addChildNode(cameraNode)
        
        //Add code here
        let sodiumGeometry = SCNSphere(radius: 5.97368)
        let sodiumMaterials = sodiumGeometry.materials
        sodiumMaterials[0].diffuse.contents = UIColor.purple
        let sodiumNode = SCNNode(geometry: sodiumGeometry)
        sodiumNode.position = SCNVector3Make(-8.22304229839, -10.5058849483, 0)
        scene.rootNode.addChildNode(sodiumNode)
        
        let oxygenGeometry = SCNSphere(radius: 4)
        let oxygenNodeOne = SCNNode(geometry: oxygenGeometry)
        let oxygenNodeTwo = SCNNode(geometry: oxygenGeometry)
        let oxygenNodeThree = SCNNode(geometry: oxygenGeometry)
        let oxygenMaterials = oxygenGeometry.materials
        oxygenMaterials[0].diffuse.contents = UIColor.red
        oxygenNodeOne.position = SCNVector3Make(0, 3.1842105263, 0)
        oxygenNodeTwo.position = SCNVector3Make(-3.23620019309, -1.86842105263, 0)
        oxygenNodeThree.position = SCNVector3Make(3.23620019309, -1.86842105263, 0)
        scene.rootNode.addChildNode(oxygenNodeOne)
        scene.rootNode.addChildNode(oxygenNodeTwo)
        scene.rootNode.addChildNode(oxygenNodeThree)
        
        let carbonGeometry = SCNSphere(radius: 4.47368)
        let carbonMaterials = carbonGeometry.materials
        carbonMaterials[0].diffuse.contents = UIColor.darkGray
        let carbonNode = SCNNode(geometry: carbonGeometry)
        carbonNode.position = SCNVector3Make(0, 0, 0)
        scene.rootNode.addChildNode(carbonNode)
        
        let hydrogenGeometry = SCNSphere(radius: 3.1579)
        let hydrogenNode = SCNNode(geometry: hydrogenGeometry)
        let materials = hydrogenGeometry.materials
        materials[0].diffuse.contents = UIColor.white
        hydrogenNode.position = SCNVector3Make(5.2992946482, -0.4103700462, 0)
        scene.rootNode.addChildNode(hydrogenNode)
        
        sceneView.scene = scene
        
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
        
        let goHomeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 270, height: 35))
        goHomeButton.backgroundColor = UIColor.clear
        goHomeButton.layer.borderWidth = 2.0
        goHomeButton.layer.borderColor = UIColor.white.cgColor
        goHomeButton.setTitle("ABOUT ME ▶", for: .normal)
        goHomeButton.titleLabel?.font = UIFont(name: ".SFUIText-Light", size: 24.0)
        goHomeButton.layer.cornerRadius = 0.02 * goHomeButton.bounds.size.width
        goHomeButton.clipsToBounds = true
        goHomeButton.setTitleColor(UIColor.white, for: .normal)
        goHomeButton.center = CGPoint(x: 540, y: 435)
        goHomeButton.addTarget(self, action: #selector(self.goHomePressed(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(goHomeButton)
        
        let chooseAnotherButton = UIButton(frame: CGRect(x: 0, y: 0, width: 270, height: 35))
        chooseAnotherButton.backgroundColor = UIColor.clear
        chooseAnotherButton.layer.borderWidth = 2.0
        chooseAnotherButton.layer.borderColor = UIColor.white.cgColor
        chooseAnotherButton.setTitle("PICK ANOTHER ▶", for: .normal)
        chooseAnotherButton.titleLabel?.font = UIFont(name: ".SFUIText-Light", size: 24.0)
        chooseAnotherButton.layer.cornerRadius = 0.02 * goHomeButton.bounds.size.width
        chooseAnotherButton.clipsToBounds = true
        chooseAnotherButton.setTitleColor(UIColor.white, for: .normal)
        chooseAnotherButton.center = CGPoint(x: 210, y: 435)
        chooseAnotherButton.addTarget(self, action: #selector(self.goHomePressed(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(chooseAnotherButton)
        
        let bakingSodaSubstanceTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        bakingSodaSubstanceTitle.center = CGPoint(x: 375, y: 45)
        bakingSodaSubstanceTitle.textAlignment = .center
        bakingSodaSubstanceTitle.text = substance
        bakingSodaSubstanceTitle.font = UIFont(name: ".SFUIText-Medium", size: 36.0)
        bakingSodaSubstanceTitle.textColor = UIColor.white
        self.addSubview(bakingSodaSubstanceTitle)
        
    }
    
    @objc func goHomePressed(_ sender: UIButton){
        if(sender.titleLabel!.text!.hasPrefix("PICK")){
            PlaygroundPage.current.liveView = ChooserView(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        } else {
            PlaygroundPage.current.liveView = AboutMeView(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        }
    }
}

class SaltModelView: UIView {
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black
    }
    
    override func draw(_ rect: CGRect) {
        let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        sceneView.backgroundColor = UIColor.black
        self.addSubview(sceneView)
        
        let scene = SCNScene()
        scene.background.contents = UIImage(named: "stars.png")
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 0, 25)
        scene.rootNode.addChildNode(cameraNode)
        
        let sodiumGeometry = SCNSphere(radius: 5.97368)
        let sodiumMaterials = sodiumGeometry.materials
        sodiumMaterials[0].diffuse.contents = UIColor.purple
        let sodiumNode = SCNNode(geometry: sodiumGeometry)
        sodiumNode.position = SCNVector3Make(0, 0, 0)
        scene.rootNode.addChildNode(sodiumNode)
        
        let chlorineGeometry = SCNSphere(radius: 4.6052631579)
        let chlorineMaterials = chlorineGeometry.materials
        chlorineMaterials[0].diffuse.contents = UIColor.green
        let chlorineNode = SCNNode(geometry: chlorineGeometry)
        chlorineNode.position = SCNVector3Make(-10.5789431579, 0, 0)
        scene.rootNode.addChildNode(chlorineNode)
        
        sceneView.scene = scene
        
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
        
        let goHomeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 270, height: 35))
        goHomeButton.backgroundColor = UIColor.clear
        goHomeButton.layer.borderWidth = 2.0
        goHomeButton.layer.borderColor = UIColor.white.cgColor
        goHomeButton.setTitle("ABOUT ME ▶", for: .normal)
        goHomeButton.titleLabel?.font = UIFont(name: ".SFUIText-Light", size: 24.0)
        goHomeButton.layer.cornerRadius = 0.02 * goHomeButton.bounds.size.width
        goHomeButton.clipsToBounds = true
        goHomeButton.setTitleColor(UIColor.white, for: .normal)
        goHomeButton.center = CGPoint(x: 540, y: 435)
        goHomeButton.addTarget(self, action: #selector(self.goHomePressed(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(goHomeButton)
        
        let chooseAnotherButton = UIButton(frame: CGRect(x: 0, y: 0, width: 270, height: 35))
        chooseAnotherButton.backgroundColor = UIColor.clear
        chooseAnotherButton.layer.borderWidth = 2.0
        chooseAnotherButton.layer.borderColor = UIColor.white.cgColor
        chooseAnotherButton.setTitle("PICK ANOTHER ▶", for: .normal)
        chooseAnotherButton.titleLabel?.font = UIFont(name: ".SFUIText-Light", size: 24.0)
        chooseAnotherButton.layer.cornerRadius = 0.02 * goHomeButton.bounds.size.width
        chooseAnotherButton.clipsToBounds = true
        chooseAnotherButton.setTitleColor(UIColor.white, for: .normal)
        chooseAnotherButton.center = CGPoint(x: 210, y: 435)
        chooseAnotherButton.addTarget(self, action: #selector(self.goHomePressed(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(chooseAnotherButton)
        
        let saltSubstanceTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        saltSubstanceTitle.center = CGPoint(x: 375, y: 45)
        saltSubstanceTitle.textAlignment = .center
        saltSubstanceTitle.text = substance
        saltSubstanceTitle.font = UIFont(name: ".SFUIText-Medium", size: 36.0)
        saltSubstanceTitle.textColor = UIColor.white
        self.addSubview(saltSubstanceTitle)
    }
    
    @objc func goHomePressed(_ sender: UIButton){
        if(sender.titleLabel!.text!.hasPrefix("PICK")){
            PlaygroundPage.current.liveView = ChooserView(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        } else {
            PlaygroundPage.current.liveView = AboutMeView(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        }
    }
}

class ChalkModelView: UIView {
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black
    }
    
    override func draw(_ rect: CGRect) {
        let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        sceneView.backgroundColor = UIColor.black
        self.addSubview(sceneView)
        
        let scene = SCNScene()
        scene.background.contents = UIImage(named: "stars.png")
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 0, 35)
        scene.rootNode.addChildNode(cameraNode)
        
        //add code
        let oxygenGeometry = SCNSphere(radius: 4)
        let oxygenNodeOne = SCNNode(geometry: oxygenGeometry)
        let oxygenNodeTwo = SCNNode(geometry: oxygenGeometry)
        let oxygenNodeThree = SCNNode(geometry: oxygenGeometry)
        let oxygenMaterials = oxygenGeometry.materials
        oxygenMaterials[0].diffuse.contents = UIColor.red
        oxygenNodeOne.position = SCNVector3Make(0, 3.1842105263, 0)
        oxygenNodeTwo.position = SCNVector3Make(-3.23620019309, -1.86842105263, 0)
        oxygenNodeThree.position = SCNVector3Make(3.23620019309, -1.86842105263, 0)
        scene.rootNode.addChildNode(oxygenNodeOne)
        scene.rootNode.addChildNode(oxygenNodeTwo)
        scene.rootNode.addChildNode(oxygenNodeThree)
        
        let carbonGeometry = SCNSphere(radius: 4.47368)
        let carbonMaterials = carbonGeometry.materials
        carbonMaterials[0].diffuse.contents = UIColor.darkGray
        let carbonNode = SCNNode(geometry: carbonGeometry)
        carbonNode.position = SCNVector3Make(0, 0, 0)
        scene.rootNode.addChildNode(carbonNode)
        
        let calciumGeometry = SCNSphere(radius: 6.0789473684)
        let calciumMaterials = calciumGeometry.materials
        calciumMaterials[0].diffuse.contents = UIColor.green
        let calciumNode = SCNNode(geometry: calciumGeometry)
        calciumNode.position = SCNVector3Make(10.643814886869855, 10.643814886869855, 0)
        scene.rootNode.addChildNode(calciumNode)
        
        sceneView.scene = scene
        
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
        
        let goHomeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 270, height: 35))
        goHomeButton.backgroundColor = UIColor.clear
        goHomeButton.layer.borderWidth = 2.0
        goHomeButton.layer.borderColor = UIColor.white.cgColor
        goHomeButton.setTitle("ABOUT ME ▶", for: .normal)
        goHomeButton.titleLabel?.font = UIFont(name: ".SFUIText-Light", size: 24.0)
        goHomeButton.layer.cornerRadius = 0.02 * goHomeButton.bounds.size.width
        goHomeButton.clipsToBounds = true
        goHomeButton.setTitleColor(UIColor.white, for: .normal)
        goHomeButton.center = CGPoint(x: 540, y: 435)
        goHomeButton.addTarget(self, action: #selector(self.goHomePressed(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(goHomeButton)
        
        let chooseAnotherButton = UIButton(frame: CGRect(x: 0, y: 0, width: 270, height: 35))
        chooseAnotherButton.backgroundColor = UIColor.clear
        chooseAnotherButton.layer.borderWidth = 2.0
        chooseAnotherButton.layer.borderColor = UIColor.white.cgColor
        chooseAnotherButton.setTitle("PICK ANOTHER ▶", for: .normal)
        chooseAnotherButton.titleLabel?.font = UIFont(name: ".SFUIText-Light", size: 24.0)
        chooseAnotherButton.layer.cornerRadius = 0.02 * goHomeButton.bounds.size.width
        chooseAnotherButton.clipsToBounds = true
        chooseAnotherButton.setTitleColor(UIColor.white, for: .normal)
        chooseAnotherButton.center = CGPoint(x: 210, y: 435)
        chooseAnotherButton.addTarget(self, action: #selector(self.goHomePressed(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(chooseAnotherButton)
        
        let chalkSubstanceTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        chalkSubstanceTitle.center = CGPoint(x: 375, y: 45)
        chalkSubstanceTitle.textAlignment = .center
        chalkSubstanceTitle.text = substance
        chalkSubstanceTitle.font = UIFont(name: ".SFUIText-Medium", size: 36.0)
        chalkSubstanceTitle.textColor = UIColor.white
        self.addSubview(chalkSubstanceTitle)
    }
    
    @objc func goHomePressed(_ sender: UIButton){
        if(sender.titleLabel!.text!.hasPrefix("PICK")){
            PlaygroundPage.current.liveView = ChooserView(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        } else {
            PlaygroundPage.current.liveView = AboutMeView(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        }
    }
}

class SulfuricAcidModelView: UIView {
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black
    }
    
    override func draw(_ rect: CGRect) {
        let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        sceneView.backgroundColor = UIColor.black
        self.addSubview(sceneView)
        
        let scene = SCNScene()
        scene.background.contents = UIImage(named: "stars.png")
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 0, 25)
        scene.rootNode.addChildNode(cameraNode)
        
        //add code
        let sulfurGeometry = SCNSphere(radius: 4.7368421053)
        let sulfurMaterials = sulfurGeometry.materials
        sulfurMaterials[0].diffuse.contents = UIColor.yellow
        let sulfurNode = SCNNode(geometry: sulfurGeometry)
        sulfurNode.position = SCNVector3Make(0, 0, 0)
        scene.rootNode.addChildNode(sulfurNode)
        
        sceneView.scene = scene
        
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
        
        let goHomeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 270, height: 35))
        goHomeButton.backgroundColor = UIColor.clear
        goHomeButton.layer.borderWidth = 2.0
        goHomeButton.layer.borderColor = UIColor.white.cgColor
        goHomeButton.setTitle("ABOUT ME ▶", for: .normal)
        goHomeButton.titleLabel?.font = UIFont(name: ".SFUIText-Light", size: 24.0)
        goHomeButton.layer.cornerRadius = 0.02 * goHomeButton.bounds.size.width
        goHomeButton.clipsToBounds = true
        goHomeButton.setTitleColor(UIColor.white, for: .normal)
        goHomeButton.center = CGPoint(x: 540, y: 435)
        goHomeButton.addTarget(self, action: #selector(self.goHomePressed(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(goHomeButton)
        
        let chooseAnotherButton = UIButton(frame: CGRect(x: 0, y: 0, width: 270, height: 35))
        chooseAnotherButton.backgroundColor = UIColor.clear
        chooseAnotherButton.layer.borderWidth = 2.0
        chooseAnotherButton.layer.borderColor = UIColor.white.cgColor
        chooseAnotherButton.setTitle("PICK ANOTHER ▶", for: .normal)
        chooseAnotherButton.titleLabel?.font = UIFont(name: ".SFUIText-Light", size: 24.0)
        chooseAnotherButton.layer.cornerRadius = 0.02 * goHomeButton.bounds.size.width
        chooseAnotherButton.clipsToBounds = true
        chooseAnotherButton.setTitleColor(UIColor.white, for: .normal)
        chooseAnotherButton.center = CGPoint(x: 210, y: 435)
        chooseAnotherButton.addTarget(self, action: #selector(self.goHomePressed(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(chooseAnotherButton)
        
        let sulfuricAcidSubstanceTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        sulfuricAcidSubstanceTitle.center = CGPoint(x: 375, y: 45)
        sulfuricAcidSubstanceTitle.textAlignment = .center
        sulfuricAcidSubstanceTitle.text = substance
        sulfuricAcidSubstanceTitle.font = UIFont(name: ".SFUIText-Medium", size: 36.0)
        sulfuricAcidSubstanceTitle.textColor = UIColor.white
        self.addSubview(sulfuricAcidSubstanceTitle)
        
        let oxygenGeometry = SCNSphere(radius: 4)
        let oxygenNodeOne = SCNNode(geometry: oxygenGeometry)
        let oxygenNodeTwo = SCNNode(geometry: oxygenGeometry)
        let oxygenNodeThree = SCNNode(geometry: oxygenGeometry)
        let oxygenNodeFour = SCNNode(geometry: oxygenGeometry)
        
        let oxygenMaterials = oxygenGeometry.materials
        oxygenMaterials[0].diffuse.contents = UIColor.red
        oxygenNodeOne.position = SCNVector3Make(-2, -2.0388810684, 3)
        oxygenNodeTwo.position = SCNVector3Make(2, -2.0388810684, -3)
        oxygenNodeThree.position = SCNVector3Make(-3, 2.8, -1.9)
        oxygenNodeFour.position = SCNVector3Make(3, 2.8, 1.9)
        
        let hydrogenGeometry = SCNSphere(radius: 3.1579)
        let hydrogenNodeLeft = SCNNode(geometry: hydrogenGeometry)
        let hydrogenNodeRight = SCNNode(geometry: hydrogenGeometry)
        let materials = hydrogenGeometry.materials
        materials[0].diffuse.contents = UIColor.white
        hydrogenNodeLeft.position = SCNVector3Make(-4, -2.8, 3)
        hydrogenNodeRight.position = SCNVector3Make(4, -2.8, -3)
        scene.rootNode.addChildNode(hydrogenNodeLeft)
        scene.rootNode.addChildNode(hydrogenNodeRight)
        
        scene.rootNode.addChildNode(oxygenNodeOne)
        scene.rootNode.addChildNode(oxygenNodeTwo)
        scene.rootNode.addChildNode(oxygenNodeThree)
        scene.rootNode.addChildNode(oxygenNodeFour)
        
    }
    
    @objc func goHomePressed(_ sender: UIButton){
        if(sender.titleLabel!.text!.hasPrefix("PICK")){
            PlaygroundPage.current.liveView = ChooserView(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        } else {
            PlaygroundPage.current.liveView = AboutMeView(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        }
    }
}

class AboutMeView: UIView {
    
    var sceneView: SCNView!
    var navigationBar: UINavigationBar!
    var detailView: UIView!
    var effectBlur: UIVisualEffect!
    var effectVibrancy: UIVisualEffect!
    var blurredEffectView: UIVisualEffectView!
    var vibrancyEffectView: UIVisualEffectView!
    var firstDetailView: UIView!
    var secondDetailView: UIView!
    var thirdDetailView: UIView!
    var flippedDetailView: UIView!
    var sideSelectedCurrently: String!
    var detailSelectedCurrently: Int!
    var tapOutsideDetailTransparentButton: UIButton!
    var tapInDetailGesture: UITapGestureRecognizer!
    var tapGesture: UITapGestureRecognizer!
    var exitButton: UIButton!
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black
    }
    
    override func draw(_ rect: CGRect) {
        //Set up blurring and vibrancy
        let blurEffect = UIBlurEffect(style: .light)
        blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = self.bounds
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        vibrancyEffectView = UIVisualEffectView(effect: vibrancyEffect)
        vibrancyEffectView.frame = self.bounds
        
        //Creating a new detail view
        detailView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.width*3/4, height: self.bounds.height/2))
        detailView.layer.cornerRadius = 10.0
        
        //The rest is setting up the 3D cube..
        
        //Setting up SCNView
        sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height))
        sceneView.backgroundColor = UIColor.black
        self.addSubview(sceneView)
        
        let scene = SCNScene()
        scene.background.contents = UIColor.black
        
        //Camera and SCNBox
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 0, 25)
        scene.rootNode.addChildNode(cameraNode)
        let boxGeometry = SCNBox(width: 9, height: 9, length: 9, chamferRadius: 0.5)
        let boxNode = SCNNode(geometry: boxGeometry)
        scene.rootNode.addChildNode(boxNode)
        sceneView.scene = scene
        
        //Enable lighting and control
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
        
        
        //Create cube face materials and build
        let top = SCNMaterial()
        let bottom = SCNMaterial()
        let left = SCNMaterial()
        let right = SCNMaterial()
        let front = SCNMaterial()
        let back = SCNMaterial()
        
        top.diffuse.contents = UIImage(named: "Projects Icon")
        top.locksAmbientWithDiffuse = true;
        
        bottom.diffuse.contents = UIImage(named: "Future Icon")
        bottom.locksAmbientWithDiffuse = true;
        
        left.diffuse.contents = UIImage(named: "Programming Icon")
        left.locksAmbientWithDiffuse = true;
        
        right.diffuse.contents = UIImage(named: "Debate Icon")
        right.locksAmbientWithDiffuse = true;
        
        front.diffuse.contents = UIImage(named: "About Me Icon")
        front.locksAmbientWithDiffuse = true;
        
        back.diffuse.contents = UIImage(named: "Water Polo Icon")
        back.locksAmbientWithDiffuse = true;
        
        boxGeometry.materials = [ front, right, back, left, top, bottom ]
        
        //Effect additions and management
        sceneView.addSubview(blurredEffectView)
        sceneView.addSubview(vibrancyEffectView)
        effectBlur = blurredEffectView.effect
        effectVibrancy = vibrancyEffectView.effect
        blurredEffectView.effect = nil
        vibrancyEffectView.effect = nil
        
        let aboutMeTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
        aboutMeTitle.center = CGPoint(x: 375, y: 45)
        aboutMeTitle.textAlignment = .center
        aboutMeTitle.text = "Nakul Bajaj"
        aboutMeTitle.font = UIFont(name: ".SFUIText-Medium", size: 36.0)
        aboutMeTitle.textColor = UIColor.white
        sceneView.addSubview(aboutMeTitle)
        
        exitButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 35))
        exitButton.backgroundColor = UIColor.black
        exitButton.layer.borderWidth = 2.0
        exitButton.layer.borderColor = UIColor.white.cgColor
        exitButton.setTitle("EXIT ▶", for: .normal)
        exitButton.titleLabel?.font = UIFont(name: ".SFUIText-Light", size: 24.0)
        exitButton.layer.cornerRadius = 0.05 * exitButton.bounds.size.width
        exitButton.clipsToBounds = true
        exitButton.setTitleColor(UIColor.white, for: .normal)
        exitButton.center = CGPoint(x: 625, y: 435)
        exitButton.addTarget(self, action: #selector(self.goHomePressed(_:)), for: UIControlEvents.touchUpInside)
        sceneView.addSubview(exitButton)
        
        //Add tapgesture recognizer
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tappedFace(_:)))
        self.sceneView!.addGestureRecognizer(tapGesture)
    }
    
    @objc func goHomePressed(_ sender: UIButton){
        PlaygroundPage.current.liveView = StartView(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
    }
    
    @objc func tappedFace(_ sender: UITapGestureRecognizer) {
        //Tap in SCNView has happened - debugging
        //Get point where tapped
        let p = sender.location(in: sceneView)
        //hitTest
        guard let hitResults = sceneView.hitTest(p, options: nil) as? [SCNHitTestResult] else { return }
        //Check hitTest and sense side
        if let result = hitResults.first {
            //let node = result.node
            //let material = node.geometry!.materials[result.geometryIndex]
            
            enum CubeFace: Int {
                case Front, Right, Back, Left, Top, Bottom
            }
            let tappedSideString = (String(describing: CubeFace(rawValue: result.geometryIndex)))
            
            //Check the side selected, translate it to the hobby/activity and make it globally available
            //Create the detailView which will pop up
            if (tappedSideString.range(of: "Front") != nil) {
                let sideStringInternal = "About Me"
                sideSelectedCurrently = sideStringInternal
                customizeDetailView(side: sideStringInternal)
            }
            else if (tappedSideString.range(of: "Right") != nil) {
                let sideStringInternal = "Debate"
                sideSelectedCurrently = sideStringInternal
                customizeDetailView(side: sideStringInternal)
            }
            else if (tappedSideString.range(of: "Back") != nil) {
                let sideStringInternal = "Water Polo"
                sideSelectedCurrently = sideStringInternal
                customizeDetailView(side: sideStringInternal)
            }
            else if (tappedSideString.range(of: "Left") != nil) {
                let sideStringInternal = "Programming"
                sideSelectedCurrently = sideStringInternal
                customizeDetailView(side: sideStringInternal)
            }
            else if (tappedSideString.range(of: "Top") != nil) {
                let sideStringInternal = "Projects"
                sideSelectedCurrently = sideStringInternal
                customizeDetailView(side: sideStringInternal)
            }
            else if (tappedSideString.range(of: "Bottom") != nil) {
                let sideStringInternal = "Future"
                sideSelectedCurrently = sideStringInternal
                customizeDetailView(side: sideStringInternal)
            }
        }
        
    }
    
    //Customize the detail View with the color, etc.
    func customizeDetailView(side: String){
        
        //Make a header for the interest
        var headerSide: UILabel!
        headerSide?.removeFromSuperview()
        headerSide = UILabel(frame: CGRect(x: 0, y: 0, width: self.detailView.bounds.width, height: 60))
        headerSide.center = CGPoint(x: self.detailView.bounds.width/2, y: 30)
        headerSide.text = side
        headerSide.font = UIFont(name: ".SFUIText-Medium", size: 40)
        headerSide.textAlignment = .center
        detailView.addSubview(headerSide)
        
        //I want exactly three sections per interest/side on cube
        firstDetailView = UIView()
        secondDetailView = UIView()
        thirdDetailView = UIView()
        //I "precustomize" those views
        preCustomizeDetailViews(specialDetailView: firstDetailView, orderNumber: 1)
        preCustomizeDetailViews(specialDetailView: secondDetailView, orderNumber: 2)
        preCustomizeDetailViews(specialDetailView: thirdDetailView, orderNumber: 3)
        //Then I make any label/image additions to the main detail view depending on the interest
        if side == "About Me" {
            detailView.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
            addElementsToDetailSection(sectionDetailView: firstDetailView, imageName: "Quick Facts", sectionName: "Quick Facts")
            addElementsToDetailSection(sectionDetailView: secondDetailView, imageName: "Experiences", sectionName: "Experiences")
            addElementsToDetailSection(sectionDetailView: thirdDetailView, imageName: "My Schedule", sectionName: "My Schedule")
        }
        else if side == "Debate" {
            detailView.backgroundColor = UIColor(red:0.83, green:0.31, blue:0.29, alpha:1.0)
            addElementsToDetailSection(sectionDetailView: firstDetailView, imageName: "Setup", sectionName: "Background")
            addElementsToDetailSection(sectionDetailView: secondDetailView, imageName: "Importance", sectionName: "Importance")
            addElementsToDetailSection(sectionDetailView: thirdDetailView, imageName: "Awards", sectionName: "Awards")
        }
        else if side == "Water Polo" {
            detailView.backgroundColor = UIColor(red:0.37, green:0.70, blue:0.89, alpha:1.0)
            addElementsToDetailSection(sectionDetailView: firstDetailView, imageName: "Rules", sectionName: "Rules")
            addElementsToDetailSection(sectionDetailView: secondDetailView, imageName: "Determination", sectionName: "Determination")
            addElementsToDetailSection(sectionDetailView: thirdDetailView, imageName: "Loving Water", sectionName: "Loving Water")
        }
        else if side == "Programming" {
            detailView.backgroundColor = UIColor(red:0.92, green:0.44, blue:0.44, alpha:1.0)
            addElementsToDetailSection(sectionDetailView: firstDetailView, imageName: "Choosing iOS", sectionName: "Choosing iOS")
            addElementsToDetailSection(sectionDetailView: secondDetailView, imageName: "Importance", sectionName: "Importance")
            addElementsToDetailSection(sectionDetailView: thirdDetailView, imageName: "Improving", sectionName: "Improving")
        }
        else if side == "Projects" {
            detailView.backgroundColor = UIColor(red:0.95, green:0.80, blue:0.36, alpha:1.0)
            addElementsToDetailSection(sectionDetailView: firstDetailView, imageName: "Win2Give", sectionName: "Win2Give")
            addElementsToDetailSection(sectionDetailView: secondDetailView, imageName: "Mitosis Stages", sectionName: "Mitosis Stages")
            addElementsToDetailSection(sectionDetailView: thirdDetailView, imageName: "Tower Defriendz", sectionName: "Tower Defriendz")
        }
        else if side == "Future" {
            detailView.backgroundColor = UIColor(red:0.63, green:0.80, blue:0.24, alpha:1.0)
            addElementsToDetailSection(sectionDetailView: firstDetailView, imageName: "High School", sectionName: "High School")
            addElementsToDetailSection(sectionDetailView: secondDetailView, imageName: "Using Technology", sectionName: "Using Technology")
            addElementsToDetailSection(sectionDetailView: thirdDetailView, imageName: "Community", sectionName: "Community")
        }
        //add as subviews
        detailView.addSubview(firstDetailView)
        detailView.addSubview(secondDetailView)
        detailView.addSubview(thirdDetailView)
        
        animateIn()
    }
    func addElementsToDetailSection(sectionDetailView: UIView, imageName: String?, sectionName: String){
        let sectionLabel = UILabel(frame: CGRect(x: 10, y: 0, width: sectionDetailView.bounds.width*3/4, height: 40))
        sectionLabel.center = CGPoint(x: sectionLabel.center.x, y: sectionDetailView.bounds.height/2)
        sectionLabel.textAlignment = .left
        sectionLabel.font = UIFont(name: ".SFUIText-Medium", size: 22)
        sectionLabel.text = sectionName
        sectionDetailView.addSubview(sectionLabel)
        if imageName != nil {
            let sectionImage = UIImage(named: imageName!)
            let dimensionRatio = (sectionImage?.size.width)!/(sectionImage?.size.height)!
            let sectionImageView = UIImageView(image: sectionImage)
            let presetHeight = sectionDetailView.bounds.height - 10
            let presetWidth = presetHeight*dimensionRatio
            sectionImageView.frame = CGRect(x: sectionDetailView.bounds.width - presetWidth - 5, y: 5, width: presetWidth, height: presetHeight)
            sectionDetailView.addSubview(sectionImageView)
        }
        
    }
    func preCustomizeDetailViews(specialDetailView: UIView, orderNumber: Int){
        
        let remainingHeightSpaceDetailView = detailView.bounds.height - 65
        let remainingWidthSpaceDetailView = detailView.bounds.width - 20
        let detailHeight = remainingHeightSpaceDetailView/3 - 5
        
        specialDetailView.frame = CGRect(x: 0, y: 0, width: remainingWidthSpaceDetailView, height: detailHeight)
        specialDetailView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        specialDetailView.layer.borderColor = UIColor.black.cgColor
        specialDetailView.layer.cornerRadius = 10.0
        specialDetailView.layer.borderWidth = 2.0
        
        if orderNumber == 1 {
            let tapInFirstDetailGesture = UITapGestureRecognizer(target: self, action: #selector(self.firstFlipDetailView))
            specialDetailView.addGestureRecognizer(tapInFirstDetailGesture)
            specialDetailView.center = CGPoint(x: self.detailView.bounds.width/2, y: remainingHeightSpaceDetailView/6 + 60)
        }
        else if orderNumber == 2 {
            let tapInSecondDetailGesture = UITapGestureRecognizer(target: self, action: #selector(self.secondFlipDetailView))
            specialDetailView.addGestureRecognizer(tapInSecondDetailGesture)
            specialDetailView.center = CGPoint(x: self.detailView.bounds.width/2, y: remainingHeightSpaceDetailView/2 + 60)
        }
        else if orderNumber == 3{
            let tapInThirdDetailGesture = UITapGestureRecognizer(target: self, action: #selector(self.thirdFlipDetailView))
            specialDetailView.addGestureRecognizer(tapInThirdDetailGesture)
            specialDetailView.center = CGPoint(x: self.detailView.bounds.width/2, y: remainingHeightSpaceDetailView*5/6 + 60)
        }
        
    }
    
    @objc func firstFlipDetailView(){
        detailSelectedCurrently = 1
        flipDetailView()
    }
    @objc func secondFlipDetailView(){
        detailSelectedCurrently = 2
        flipDetailView()
    }
    @objc func thirdFlipDetailView(){
        detailSelectedCurrently = 3
        flipDetailView()
    }
    func flipDetailView(){
        matchFlippedDetailWithDetail()
        if sideSelectedCurrently == "About Me" {
            if detailSelectedCurrently == 1 {
                addMainContentLabel(contentString: "My name is Nakul, and I am a 15 year old student at The Harker Upper School. I was born in Ann Arbor, Michigan on June 3rd, 2002, and love making iOS apps. I live in Cupertino with my parents and younger sister, who is 5 years old. I also ❤️ WWDC18!", imagesExist: true)
                addMainContentImage(imageString: "personal profile")
            }
            if detailSelectedCurrently == 2 {
                addMainContentLabel(contentString: "Experiences define who we are. As Albert Einstein had mentioned, “The only source of knowledge is experience.” One of the experiences I had was relocating throughout the US. I moved seven times from places such as Michigan, Missouri, and India while I saw different perspectives from others in those regions. It truly is an experience I am grateful for.", imagesExist: false)
            }
            if detailSelectedCurrently == 3{
                addMainContentLabel(contentString: "During the weekdays, I go to classes at school for 7 hours. Later, I finish my homework, code, work on debate, or attend water polo practice. During the weekends, I finish my homework and spend time with my family.", imagesExist: true)
                addMainContentImage(imageString: "homework.JPG")
            }
        }
        else if sideSelectedCurrently == "Debate" {
            if detailSelectedCurrently == 1 {
                addMainContentLabel(contentString: "Debate is now an international activity that many students participate in. Currently, I focus on Congressional debate, which asks students to act as a US Senator. We usually debate current political proposals.", imagesExist: true)
                addMainContentImage(imageString: "speaking.JPG")
            }
            if detailSelectedCurrently == 2 {
                addMainContentLabel(contentString: "More than just encouraging political participation, debate is useful for learning how to analyze real world problems, speak persuasively with others, and talk fluently in presentations. Speech and debate has been a practical endeavor for many successful people, including Nelson Mandela and Malcom X.", imagesExist: false)
            }
            if detailSelectedCurrently == 3 {
                addMainContentLabel(contentString: "As part of debate, I have reached the final rounds of national tournaments and have recieved second place within our national qualifier district, one of the hardest in the country.", imagesExist: true)
                addMainContentImage(imageString: "first trophy.JPG")
            }
        }
        else if sideSelectedCurrently == "Water Polo" {
            if detailSelectedCurrently == 1 {
                addMainContentLabel(contentString: "Water polo is a sport that is played in a pool with two teams. Each team must score with the ball as many times as possible before the game ends. There are six players from each team in addition to one goalkeeper. In water polo, players cannot touch the floor of the pool, handle the ball with two hands, or unnecessarily hurt other players. Goggles are not permitted.", imagesExist: false)
            }
            if detailSelectedCurrently == 2 {
                addMainContentLabel(contentString: "Water polo’s harsh rules and uncalled fouls shape the sport so the players that are most determined win a game. Playing the sport has shown me why determination is required for personal success and how a competitive spirit can become a source for motivation.", imagesExist: true)
                addMainContentImage(imageString: "wapo referee.jpg")
            }
            if detailSelectedCurrently == 3 {
                addMainContentLabel(contentString: "Water polo serves as a refresher to calm myself after a long or busy day. Often, I enjoy swimming underwater the most as I almost explore a different type of world that remains serene.", imagesExist: true)
                addMainContentImage(imageString: "wapo underwater.jpg")
            }
        }
        else if sideSelectedCurrently == "Programming" {
            if detailSelectedCurrently == 1 {
                addMainContentLabel(contentString: "Since the start, I have chosen iOS as a platform to develop on because of its ease of use. In fact, I still remember how simple iOS was for me to explore when I was just six years old. The design language and popularity make it an attractive platform. My inspiration today comes from Steve Jobs’ work in making an intuitive operating system.", imagesExist: false)
            }
            if detailSelectedCurrently == 2 {
                addMainContentLabel(contentString: "Programming is important to me because I love seeing my own creations become accessible to almost everyone. I also recognize the benefit it brings for the people that use apps to their full extent.", imagesExist: true)
                addMainContentImage(imageString: "working on coding.JPG")
            }
            if detailSelectedCurrently == 3{
                addMainContentLabel(contentString: "I only started learning true iOS development concepts around the age of eleven. Since then, I have been able to improve massively by learning about more frameworks and APIs. I hope to continue on this path.", imagesExist: true)
                addMainContentImage(imageString: "frameworks")
            }
        }
        else if sideSelectedCurrently == "Projects" {
            if detailSelectedCurrently == 1 {
                addMainContentLabel(contentString: "Win2Give is an app I built which has users quickly solve math problems, while donating a cent to charity for every question they get correct. By using advertising networks, I am able to donate real money to charities.", imagesExist: true)
                addMainContentImage(imageString: "receiveHand")
            }
            if detailSelectedCurrently == 2 {
                addMainContentLabel(contentString: "Mitosis Stages was an app I submitted as a science project for describing the phases that a cell goes through when dividing itself. Videos, images, and animations let my app serve as an interactive textbook.", imagesExist: true)
                addMainContentImage(imageString: "Mitosis Stages")
            }
            if detailSelectedCurrently == 3 {
                addMainContentLabel(contentString: "Tower Defriendz is an iMessage app that was a form of a tower defense game. A player’s goal is to setup their base with as many cannons as they can and defeat any intruding soldiers that might arrive.", imagesExist: true)
                addMainContentImage(imageString: "soldier")
            }
        }
        else if sideSelectedCurrently == "Future" {
            if detailSelectedCurrently == 1 {
                addMainContentLabel(contentString: "For my upcoming years in high school, I plan to take more of the courses that are available to me in computer science, entrepreneurship, and design. To make a software company, it’s important to take advantage of these fields as much as possible. Taking such classes will be helpful for me to assist users, increase revenues, and market products.", imagesExist: false)
            }
            if detailSelectedCurrently == 2 {
                addMainContentLabel(contentString: "In the future, I see myself learning more about deep learning to make predictions and automate services to a greater extent. Also, I will develop more useful apps for wearable technologies.", imagesExist: true)
                addMainContentImage(imageString: "deep learning.jpg")
            }
            if detailSelectedCurrently == 3 {
                addMainContentLabel(contentString: "I personally believe one to one representation and voter participation are characteristics our current governmental system lacks. Researching voting for direct representation and the security and operational challenges is a topic of my ongoing research.", imagesExist: true)
                addMainContentImage(imageString: "vote here")
            }
        }
        let doneImage = UIImage(named: "doneButton")
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: flippedDetailView.bounds.width/15, height: flippedDetailView.bounds.width/15))
        backButton.setImage(doneImage, for: .normal)
        backButton.center = CGPoint(x: flippedDetailView.bounds.width/2, y: flippedDetailView.bounds.height*9/10 - 10)
        backButton.addTarget(self, action: #selector(self.backTapped), for: .touchUpInside)
        flippedDetailView.addSubview(backButton)
        sceneView.addSubview(flippedDetailView)
        flipDetailAnimation()
    }
    func addMainContentImage(imageString: String){
        let profileImage = UIImage(named: imageString)
        let widthHeightRatio = (profileImage?.size.width)!/(profileImage?.size.height)!
        let profileImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: widthHeightRatio * (flippedDetailView.bounds.height/3-10), height: flippedDetailView.bounds.height/3-10))
        profileImageView.center = CGPoint(x: flippedDetailView.bounds.width/2, y: flippedDetailView.bounds.height/6 + 5)
        profileImageView.image = profileImage
        flippedDetailView.addSubview(profileImageView)
    }
    func addMainContentLabel(contentString: String, imagesExist: Bool){
        let imageSpaceHeight = flippedDetailView.bounds.height*1/3
        let mainContentLabel = UILabel()
        if imagesExist {
            mainContentLabel.frame = CGRect(x: 20, y: imageSpaceHeight, width: flippedDetailView.bounds.width - 40, height: 170 - imageSpaceHeight)
        }
        else {
            mainContentLabel.frame = CGRect(x: 20, y: 20, width: flippedDetailView.bounds.width - 40, height: 170)
        }
        mainContentLabel.text = contentString
        mainContentLabel.numberOfLines = 0
        mainContentLabel.font = UIFont(name: ".SFUIText-Medium", size: 40)
        mainContentLabel.adjustsFontSizeToFitWidth = true
        mainContentLabel.adjustsFontForContentSizeCategory = true
        mainContentLabel.allowsDefaultTighteningForTruncation = true
        mainContentLabel.minimumScaleFactor = 0.1
        flippedDetailView.addSubview(mainContentLabel)
    }
    
    //Quick animation block, used in prev. function
    func flipDetailAnimation(){
        //exitButton.alpha = 0
        UIView.transition(from: detailView, to: flippedDetailView, duration: 1.0, options: .transitionFlipFromTop, completion: nil)
        
    }
    //Just matches the selected section's flipped view with the detail view background color
    func matchFlippedDetailWithDetail(){
        flippedDetailView = UIView(frame: detailView.frame)
        flippedDetailView.backgroundColor = detailView.backgroundColor
        flippedDetailView.layer.cornerRadius = detailView.layer.cornerRadius
    }
    //animating the detailView in
    func animateIn(){
        sceneView.addSubview(detailView)
        detailView.center = self.center
        detailView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        detailView.alpha = 0
        self.exitButton.isEnabled = false
        self.exitButton.isHidden = true
        tapOutsideDetailTransparentButton = UIButton(frame: sceneView.bounds)
        tapOutsideDetailTransparentButton.backgroundColor = UIColor.clear
        sceneView.insertSubview(tapOutsideDetailTransparentButton, belowSubview: detailView)
        tapOutsideDetailTransparentButton.addTarget(self, action: #selector(animateOut), for: .touchUpInside)
        
        UIView.animate(withDuration: 0.4, animations: {
            self.blurredEffectView.effect = self.effectBlur
            self.vibrancyEffectView.effect = self.effectVibrancy
            self.detailView.alpha = 1
            self.detailView.transform = CGAffineTransform.identity
        })
    }
    @objc func backTapped(){
        self.flippedDetailView?.subviews.forEach {subview in
            subview.removeFromSuperview()
        }
        exitButton.alpha = 1
        UIView.transition(from: flippedDetailView, to: detailView, duration: 1.0, options: .transitionFlipFromBottom, completion: nil)
    }
    @objc func animateOut(){
        self.exitButton.isEnabled = true
        self.exitButton.isHidden = false
        
        UIView.animate(withDuration: 0.3, animations: {
            self.detailView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.detailView.alpha = 0
            self.flippedDetailView?.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.blurredEffectView.effect = nil
            self.vibrancyEffectView.effect = nil
        }) { (success:Bool) in
            self.detailView.subviews.forEach {subview in
                subview.removeFromSuperview()
            }
            self.flippedDetailView?.subviews.forEach {subview in
                subview.removeFromSuperview()
            }
            self.firstDetailView.subviews.forEach {subview in
                subview.removeFromSuperview()
            }
            self.secondDetailView.subviews.forEach {subview in
                subview.removeFromSuperview()
            }
            self.thirdDetailView.subviews.forEach {subview in
                subview.removeFromSuperview()
            }
            self.detailView.removeFromSuperview()
            self.flippedDetailView?.removeFromSuperview()
            //self.addSubview(self.sceneView)
            self.tapOutsideDetailTransparentButton.removeTarget(self, action: #selector(self.animateOut), for: .touchUpInside)
            //            self.tapOutsideDetailTransparentButton.alpha = 1
            self.tapOutsideDetailTransparentButton.isEnabled = false
            self.tapOutsideDetailTransparentButton = nil
        }
    }
}

PlaygroundPage.current.liveView = StartView(frame: CGRect(x: 0, y: 0, width: 750, height: 500))
PlaygroundPage.current.needsIndefiniteExecution = true
