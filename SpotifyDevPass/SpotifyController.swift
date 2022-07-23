import UIKit

class SpotifyController: UIViewController {
    
    private let screenDevice = UIScreen.main.bounds.width

    private lazy var albumImage: UIImageView = {
        let albumImage = UIImageView()
        albumImage.clipsToBounds = true
        albumImage.contentMode = .scaleAspectFill
        albumImage.image = UIImage(named: "tropicalia")
        return albumImage
    }()
    
    private lazy var singerLabel: UILabel = {
        let singerLabel = UILabel()
        singerLabel.text = "Caetano Veloso"
        singerLabel.font = .systemFont(ofSize: 15, weight: .bold)
        singerLabel.textColor = .black
        return singerLabel
    }()
    
    private lazy var songLabel: UILabel = {
        let songLabel = UILabel()
        songLabel.text = "Soy Loco por ti America"
        songLabel.font = .systemFont(ofSize: 13, weight: .regular)
        songLabel.textColor = .lightGray
        return songLabel
    }()
    
    private lazy var playImage: UIImageView = {
        let playImage = UIImageView()
        playImage.clipsToBounds = true
        playImage.contentMode = .scaleAspectFill
        playImage.image = UIImage(named: "play")
        return playImage
    }()
    
    private lazy var minimumValueLabel: UILabel = {
        let minimumValueLabel = UILabel()
        minimumValueLabel.text = "0:00"
        minimumValueLabel.font = .systemFont(ofSize: 10, weight: .regular)
        minimumValueLabel.textColor = .black
        return minimumValueLabel
    }()
    
    private lazy var maximumValueLabel: UILabel = {
        let maximumValueLabel = UILabel()
        maximumValueLabel.text = "3:43"
        maximumValueLabel.font = .systemFont(ofSize: 10, weight: .regular)
        maximumValueLabel.textColor = .black
        return maximumValueLabel
    }()
    
    private lazy var timeSlider: UISlider = {
        let timeSlider = UISlider()
        timeSlider.setThumbImage(UIImage(), for: .normal)
        timeSlider.minimumValue = 0
        timeSlider.maximumValue = 100
        timeSlider.value = 50
        return timeSlider
    }()
    
    private lazy var buttonPlayOnSpotify: UIButton = {
        let buttonPlayOnSpotify = UIButton(configuration: .filled())
        buttonPlayOnSpotify.configuration?.title = "PLAY ON SPOTIFY"
        buttonPlayOnSpotify.configuration?.background.backgroundColor = .systemGreen
        buttonPlayOnSpotify.configuration?.cornerStyle = .capsule
        buttonPlayOnSpotify.configuration?.contentInsets = NSDirectionalEdgeInsets(top: CGFloat(10),
                                                                          leading: CGFloat(50),
                                                                          bottom: CGFloat(10),
                                                                          trailing: CGFloat(50))
        buttonPlayOnSpotify.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return buttonPlayOnSpotify
    }()
    
    private lazy var sliderStackView: UIStackView = {
        let sliderStackView = UIStackView(arrangedSubviews: [playImage, minimumValueLabel, timeSlider, maximumValueLabel])
        sliderStackView.spacing = 10
        return sliderStackView
    }()
    
    private lazy var playerStackView: UIStackView = {
        let playerStackView = UIStackView(arrangedSubviews: [albumImage, singerLabel, songLabel, sliderStackView, buttonPlayOnSpotify])
        playerStackView.translatesAutoresizingMaskIntoConstraints = false
        playerStackView.axis = .vertical
        playerStackView.alignment = .center
        playerStackView.spacing = 5
        return playerStackView
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupSubViews()
        setupConstraints()
    }
    
    private func setupSubViews(){
        view.addSubview(playerStackView)
    }
    
    private func setupConstraints(){
        let sizeAlbumImage = CGSize(width: screenDevice, height: screenDevice)
        let sizeAPlayImage = CGSize(width: 36, height: 36)
        NSLayoutConstraint.activate([
            playerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playerStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            playerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            playerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            sliderStackView.leadingAnchor.constraint(equalTo: playerStackView.leadingAnchor, constant: 20),
            sliderStackView.trailingAnchor.constraint(equalTo: playerStackView.trailingAnchor, constant: -20),
            
            albumImage.widthAnchor.constraint(equalToConstant: sizeAlbumImage.width),
            albumImage.heightAnchor.constraint(equalToConstant: sizeAlbumImage.height),
            
            playImage.widthAnchor.constraint(equalToConstant: sizeAPlayImage.width),
            playImage.heightAnchor.constraint(equalToConstant: sizeAPlayImage.height)
            
        ])
    }


}

