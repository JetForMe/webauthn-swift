import Foundation

/// From §5.4. (https://www.w3.org/TR/webauthn/#dictionary-makecredentialoptions)
/// Contains a PublicKeyCredentialCreationOptions object specifying the desired attributes of the
/// to-be-created public key credential.
public struct PublicKeyCredentialCreationOptions: Codable {
    /// Base64-encoded challenge string
    public let challenge: String
    public let user: PublicKeyCredentialUserEntity
    public let relyingParty: PublicKeyCredentialRpEntity
    public let publicKeyCredentialParameters: [PublicKeyCredentialParameters]
    public let timeout: TimeInterval
}

// MARK: - Credential parameters

public struct PublicKeyCredentialParameters: Codable {
    let type: String
    let algorithm: COSEAlgorithmIdentifier

    public static var supported: [Self] {
        COSEAlgorithmIdentifier.allCases.map {
            PublicKeyCredentialParameters.init(type: "public-key", algorithm: $0)
        }
    }
}

// MARK: - Credential entities

/// From §5.4.2 (https://www.w3.org/TR/webauthn/#sctn-rp-credential-params).
/// The PublicKeyCredentialRpEntity dictionary is used to supply additional Relying Party attributes when
/// creating a new credential.
public struct PublicKeyCredentialRpEntity: Codable {
    public let name: String
    public let id: String
}

/// From §5.4.3 (https://www.w3.org/TR/webauthn/#dictionary-user-credential-params)
/// The PublicKeyCredentialUserEntity dictionary is used to supply additional user account attributes when
/// creating a new credential.
public struct PublicKeyCredentialUserEntity: Codable {
    public let name: String
    public let id: String
    public let displayName: String
}
