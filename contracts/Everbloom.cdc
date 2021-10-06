import NonFungibleToken from "./NonFungibleToken.cdc"

// TODO: add comment after the structure is finalized

pub contract Everbloom: NonFungibleToken {
    // --- NFT Standard Events ---
    // Emitted when the Everbloom contract is created
    pub event ContractInitialized()
    // Emitted on Everbloom NFT Withdrawal
    pub event Withdraw(id: UInt64, from: Address?)
    // Emitted on Everbloom NFT deposit
    pub event Deposit(id: UInt64, to: Address?)

    // --- Everbloom Event ---
    pub event PrintNFTMinted(
        nftID: UInt64,
        editionID: UInt32,
        artworkID: UInt32,
        galleryID: UInt32,
        serialNumber: UInt32,
        metadata: {String: String}
    )
    pub event PrintNFTDestroyed(nftID: UInt64)
    pub event ArtworkCreated(
        artworkID: UInt32,
        galleryID: UInt32,
        externalPostID: String,
        name: String,
        metadata: {String:String}
    )
    pub event GalleryCreated(galleryID: UInt32, name: String)
    pub event EditionCreated(editionID: UInt32, name: String)
    pub event EditionAddedToArtwork(editionID: UInt32, artworkID: UInt32)
    pub event ArtworkEditionCompleted(editionID: UInt32, artworkID: UInt32, numOfArtworks: UInt32)
    pub event GalleryDisabled(galleryID: UInt32)
    pub event GalleryEnabled(galleryID: UInt32)
    pub event ArtworkLocked(artworkID: UInt32)
    pub event UserCreated(userID: UInt64)

    pub let CollectionStoragePath: StoragePath
    pub let CollectionPublicPath: PublicPath
    pub let AdminStoragePath: StoragePath
    pub let UserStoragePath: StoragePath

    pub var nextArtworkID: UInt32
    pub var nextEditionID: UInt32
    pub var nextGalleryID: UInt32
    pub var nextUserID: UInt64

    pub var totalSupply: UInt64

    pub struct PrintData {
        pub let editionID: UInt32
        pub let artworkID: UInt32
        pub let galleryID: UInt32
        pub let serialNumber: UInt32
        pub let metadata: {String: String}

        init(
            galleryID: UInt32,
            artworkID: UInt32,
            editionID: UInt32,
            serialNumber: UInt32,
            metadata: {String: String}
        ) {
            self.galleryID = galleryID
            self.artworkID = artworkID
            self.editionID = editionID
            self.serialNumber = serialNumber
            self.metadata = metadata
        }
    }

    pub resource NFT: NonFungibleToken.INFT {
        // Global unique Artwork ID
        pub let id: UInt64
        // Struct of ArtworkData metadata
        pub let data: PrintData

        init(
            galleryID: UInt32,
            artworkID: UInt32,
            editionID: UInt32,
            serialNumber: UInt32,
            metadata: {String: String}
        ) {
            Everbloom.totalSupply = Everbloom.totalSupply + UInt64(1)

            self.id = Everbloom.totalSupply
            self.data = PrintData(
                galleryID: galleryID,
                artworkID: artworkID,
                editionID: editionID,
                serialNumber: serialNumber,
                metadata: metadata
            )

            emit PrintNFTMinted(
                nftID: self.id,
                editionID: self.data.editionID,
                artworkID: self.data.artworkID,
                galleryID: self.data.galleryID,
                serialNumber: self.data.serialNumber,
                metadata: metadata
            )
        }

        destroy() {
            emit PrintNFTDestroyed(nftID: self.id)
        }
    }

    pub struct Edition {
        pub let editionID: UInt32
        pub let artworkID: UInt32
        pub let name: String

        init(artworkID: UInt32, name: String) {
            pre {
                name.length > 0: "New Edition name cannot be empty"
            }
            self.editionID = Everbloom.nextEditionID
            self.artworkID = artworkID
            self.name = name

            // Increment the nextEditionID so that it isn't used again
            Everbloom.nextEditionID = Everbloom.nextEditionID + UInt32(1)
        }
    }

    pub struct ArtworkData {
        pub let galleryID: UInt32
        pub let artworkID: UInt32
        pub let externalPostID: String
        pub let name: String
        pub let metadata: {String: String}

        init(galleryID: UInt32, externalPostID: String, name: String, metadata: {String: String}) {
            pre {
                name.length > 0: "New Artwork name cannot be empty"
                metadata.length != 0: "New Artwork metadata cannot be empty"
            }
            self.galleryID = galleryID
            self.name = name
            self.artworkID = Everbloom.nextArtworkID
            self.metadata = metadata
            self.externalPostID = externalPostID

            // Increment the ID so that it isn't used again
            Everbloom.nextArtworkID = Everbloom.nextArtworkID + UInt32(1)
        }
    }

    pub resource Artwork {
        pub let galleryID: UInt32
        pub let artworkID: UInt32
        pub var editions: {UInt32: Edition}
        pub var editionCompleted: {UInt32: Bool}
        pub var locked: Bool
        pub var numberMintedPerEdition: {UInt32: UInt32}
        pub var data: ArtworkData

        init(galleryID: UInt32, externalPostID: String, name: String, metadata: {String: String}) {
            self.artworkID = Everbloom.nextArtworkID
            self.galleryID = galleryID
            self.editions = {}
            self.editionCompleted = {}
            self.locked = false
            self.numberMintedPerEdition = {}
            self.data = ArtworkData(galleryID: galleryID, externalPostID: externalPostID, name: name, metadata: metadata)

            emit ArtworkCreated(
                artworkID: self.artworkID,
                galleryID: galleryID,
                externalPostID: externalPostID,
                name: name,
                metadata: metadata
            )
        }

        pub fun createEdition(name: String): UInt32 {
            let newEdition: Edition = Edition(artworkID: self.artworkID, name: name)

            emit EditionCreated(editionID: newEdition.editionID, name: name)

            self.addEdition(edition: newEdition)

            return newEdition.editionID
        }

        pub fun addEdition(edition: Edition) {
            pre {
                edition.editionID != nil: "Edition should have editionID"
                !self.locked: "Cannot add the edition to the Artwork after the artwork has been locked."
                self.numberMintedPerEdition[edition.editionID] == nil: "The edition has already beed added to the artwork."
            }

            self.editions[edition.editionID] = edition

            // Set Edition to not completed
            self.editionCompleted[edition.editionID] = false
            // Initialize the mint count to zero
            self.numberMintedPerEdition[edition.editionID] = 0

            emit EditionAddedToArtwork(editionID: edition.editionID, artworkID: self.artworkID)
        }

        pub fun setEditionComplete(editionID: UInt32) {
            pre {
                self.editionCompleted[editionID] != nil: "Cannot set Edition to Complete: Edition doesn't exist in this Artwork!"
            }

            if !self.editionCompleted[editionID]! {
                self.editionCompleted[editionID] = true

                emit ArtworkEditionCompleted(editionID: editionID, artworkID: self.artworkID, numOfArtworks: self.numberMintedPerEdition[editionID]!)
            }
        }

        pub fun setAllEditionsComplete() {
            for edition in self.editions.values {
                self.setEditionComplete(editionID: edition.editionID)
            }
        }

        pub fun lock() {
            if !self.locked {
                self.locked = true

                emit ArtworkLocked(artworkID: self.artworkID)
            }
        }

        pub fun mintPrint(editionID: UInt32, metadata: {String: String}): @NFT {
            pre {
                self.editionCompleted[editionID] != nil: "Cannot mint the Print: This edition doesn't exist."
                !self.editionCompleted[editionID]!: "Cannot mint the print from this edition: This edition has been completed."
            }

            let numOfArtworks = self.numberMintedPerEdition[editionID]!

            let newPrint: @NFT <- create NFT(
                galleryID: self.galleryID,
                artworkID: self.artworkID,
                editionID: editionID,
                serialNumber: numOfArtworks,
                metadata: metadata
            )

            self.numberMintedPerEdition[editionID] = numOfArtworks + UInt32(1)

            return <-newPrint
        }

        pub fun batchMintPrint(editionID: UInt32, metadatas: [{String: String}]): @Collection {
            let newCollection <- create Collection()

            for metadata in metadatas {
                newCollection.deposit(token: <-self.mintPrint(editionID: editionID, metadata: metadata))
            }

            return <-newCollection
        }
    }

    pub resource interface GalleryPublic {
        pub fun getAllArtworks(): [UInt32]
    }

    pub resource interface GalleryOwner {
        pub fun createArtwork(externalPostID: String, name: String, metadata: {String: String}): UInt32
        pub fun borrowArtwork(artworkID: UInt32): &Artwork?
        pub fun getAllArtworks(): [UInt32]
    }

    pub resource Gallery: GalleryOwner, GalleryPublic {
        pub let galleryID: UInt32
        access(contract) var artworks: @{UInt32: Artwork}
        pub var artworkDatas: {UInt32: ArtworkData}
        pub var isDisabled: Bool
        pub var name: String

        init(name: String) {
            self.galleryID = Everbloom.nextGalleryID
            self.artworks <- {}
            self.artworkDatas = {}
            self.isDisabled = false
            self.name = name

            Everbloom.nextGalleryID = Everbloom.nextGalleryID + UInt32(1)

            emit GalleryCreated(galleryID: self.galleryID, name: self.name)
        }

        pub fun createArtwork(externalPostID: String, name: String, metadata: {String: String}): UInt32 {
            pre {
                !self.isDisabled: "Cannot add create artwork from the Gallery after the gallery has been disabled."
            }
            // Create the new Artwork
            var newArtwork: @Artwork <- create Artwork(galleryID: self.galleryID, externalPostID: externalPostID, name: name, metadata: metadata)
            let newID = newArtwork.artworkID

            // Store it in the contract storage
            self.artworkDatas[newID] = newArtwork.data
            self.artworks[newID] <-! newArtwork

            return newID
        }

        pub fun disableGallery () {
            if !self.isDisabled {
                self.isDisabled = true
                emit GalleryDisabled(galleryID: self.galleryID)
            }
        }

        pub fun enableGallery () {
            if self.isDisabled {
                self.isDisabled = false
                emit GalleryEnabled(galleryID: self.galleryID)
            }
        }

        pub fun getAllArtworks(): [UInt32] {
            return self.artworks.keys
        }

        pub fun borrowArtwork(artworkID: UInt32): &Artwork? {
            if self.artworks[artworkID] != nil {
                let ref = &self.artworks[artworkID] as &Artwork
                return ref
            } else {
                return nil
            }
        }

        pub fun borrowArtworkByPostID(externalPostID: String): &Artwork? {
            // Iterate through all the artworkDatas and search for the externalPostID
            for artworkData in self.artworkDatas.values {
                if externalPostID == artworkData.externalPostID {
                    // If the externalPostID is found, return the artwork
                    return  &self.artworks[artworkData.artworkID] as &Artwork
                }
            }

            return nil
        }

        destroy() {
            destroy self.artworks
        }
    }

    pub resource User {
        pub let userID: UInt64
        pub let galleries: @{UInt32: Gallery};

        init() {
            self.userID = Everbloom.nextUserID
            self.galleries <- {}

            Everbloom.nextUserID = Everbloom.nextUserID + UInt64(1)

            emit UserCreated(userID: self.userID)
        }


        pub fun getAllGalleries(): [UInt32] {
            return self.galleries.keys
        }

        pub fun borrowGallery(galleryID: UInt32): &Gallery{Everbloom.GalleryOwner} {
            pre {
                self.galleries[galleryID] != nil: "Cannot borrow Gallery: The Gallery doesn't exist"
            }

            // Get a reference to the Gallery and return it
            // use `&` to indicate the reference to the object and type
            return &self.galleries[galleryID] as &Gallery
        }

        pub fun createGallery(name: String): UInt32 {
            // Create the new Gallery
            var newGallery <- create Everbloom.Gallery(name: name)
            let newGalleryID = newGallery.galleryID
            // Store it in the galleries mapping field
            self.galleries[newGalleryID] <-! newGallery

            return newGalleryID
        }

        pub fun disableGallery(galleryID: UInt32) {
            pre {
                self.galleries[galleryID] != nil: "Cannot borrow Gallery: The Gallery doesn't exist"
            }

            let gallery = &self.galleries[galleryID] as &Everbloom.Gallery
            gallery.disableGallery()
        }

        // unlockGallery unlocks the gallery assigned to the specific user
        // so that he would be able to mint again
        pub fun unlockGallery(galleryID: UInt32) {
            pre {
                self.galleries[galleryID] != nil: "Cannot borrow Gallery: The Gallery doesn't exist"
            }

            let gallery = &self.galleries[galleryID] as &Everbloom.Gallery
            gallery.enableGallery()
        }

        destroy() {
            destroy self.galleries
        }
    }

    pub resource Admin {
        pub fun createNewAdmin(): @Admin {
            return <-create Admin()
        }
    }

    // -----------------------------------------------------------------------
    // Everbloom Collection Logic
    // -----------------------------------------------------------------------
    //

    pub resource interface PrintCollectionPublic {
        pub fun deposit(token: @NonFungibleToken.NFT)
        pub fun batchDeposit(tokens: @NonFungibleToken.Collection)
        pub fun getIDs(): [UInt64]
        pub fun borrowNFT(id: UInt64): &NonFungibleToken.NFT
        pub fun borrowPrint(id: UInt64): &Everbloom.NFT? {
            // If the result isn't nil, the id of the returned reference
            // should be the same as the argument to the function
            post {
                (result == nil) || (result?.id == id):
                    "Cannot borrow Print reference: The ID of the returned reference is incorrect"
            }
        }
    }

    pub resource Collection: PrintCollectionPublic, NonFungibleToken.Provider, NonFungibleToken.Receiver, NonFungibleToken.CollectionPublic {
        // NFT is a resource type with a UInt64 ID field
        pub var ownedNFTs: @{UInt64: NonFungibleToken.NFT}

        init() {
            self.ownedNFTs <- {}
        }

        // withdraw removes an Print from the Collection and moves it to the caller
        //
        // Parameters: withdrawID: The ID of the NFT
        // that is to be removed from the Collection
        //
        // returns: @NonFungibleToken.NFT the token that was withdrawn
        pub fun withdraw(withdrawID: UInt64): @NonFungibleToken.NFT {

            // Remove the nft from the Collection
            let token <- self.ownedNFTs.remove(key: withdrawID)
                ?? panic("Cannot withdraw: Artwork Piece does not exist in the collection")

            emit Withdraw(id: token.id, from: self.owner?.address)

            // Return the withdrawn token
            return <-token
        }

        // batchWithdraw withdraws multiple tokens and returns them as a Collection
        //
        // Parameters: ids: An array of IDs to withdraw
        //
        // Returns: @NonFungibleToken.Collection: A collection that contains
        //                                        the withdrawn print
        //
        pub fun batchWithdraw(ids: [UInt64]): @NonFungibleToken.Collection {
            // Create a new empty Collection
            var batchCollection <- create Collection()

            // Iterate through the ids and withdraw them from the Collection
            for id in ids {
                batchCollection.deposit(token: <-self.withdraw(withdrawID: id))
            }

            // Return the withdrawn tokens
            return <-batchCollection
        }

        // deposit takes a Print and adds it to the Collections dictionary
        //
        // Paramters: token: the NFT to be deposited in the collection
        //
        pub fun deposit(token: @NonFungibleToken.NFT) {

            // Cast the deposited token as a Everbloom NFT to make sure
            // it is the correct type
            let token <- token as! @Everbloom.NFT

            // Get the token's ID
            let id = token.id

            // Add the new token to the dictionary
            let oldToken <- self.ownedNFTs[id] <- token

            // Only emit a deposit event if the Collection
            // is in an account's storage
            if self.owner?.address != nil {
                emit Deposit(id: id, to: self.owner?.address)
            }

            // Destroy the empty old token that was "removed"
            destroy oldToken
        }

        // batchDeposit takes a Collection object as an argument
        // and deposits each contained NFT into this Collection
        pub fun batchDeposit(tokens: @NonFungibleToken.Collection) {

            // Get an array of the IDs to be deposited
            let keys = tokens.getIDs()

            // Iterate through the keys in the collection and deposit each one
            for key in keys {
                self.deposit(token: <-tokens.withdraw(withdrawID: key))
            }

            // Destroy the empty Collection
            destroy tokens
        }

        // getIDs returns an array of the IDs that are in the Collection
        pub fun getIDs(): [UInt64] {
            return self.ownedNFTs.keys
        }

        // borrowNFT Returns a borrowed reference to a Print in the Collection
        // so that the caller can read its ID
        //
        // Parameters: id: The ID of the NFT to get the reference for
        //
        // Returns: A reference to the NFT
        //
        // Note: This only allows the caller to read the ID of the NFT,
        // not any topshot specific data. Please use borrowPrint to
        // read Print data.
        //
        pub fun borrowNFT(id: UInt64): &NonFungibleToken.NFT {
            return &self.ownedNFTs[id] as &NonFungibleToken.NFT
        }

        // borrowPrint returns a borrowed reference to a Print
        // so that the caller can read data and call methods from it.
        // They can use this to read its Printdata associated with it.
        //
        // Parameters: id: The ID of the NFT to get the reference for
        //
        // Returns: A reference to the NFT
        pub fun borrowPrint(id: UInt64): &Everbloom.NFT? {
            if self.ownedNFTs[id] != nil {
                let ref = &self.ownedNFTs[id] as auth &NonFungibleToken.NFT
                return ref as! &Everbloom.NFT
            } else {
                return nil
            }
        }

        // If a transaction destroys the Collection object,
        // All the NFTs contained within are also destroyed!
        //
        destroy() {
            destroy self.ownedNFTs
        }
    }

    // -----------------------------------------------------------------------
    // Everbloom contract-level function definitions
    // -----------------------------------------------------------------------

    pub fun createUser(): @User {
        return <- create User()
    }

    pub fun createEmptyCollection(): @NonFungibleToken.Collection {
        return <-create Everbloom.Collection()
    }

    // -----------------------------------------------------------------------
    // Everbloom initialization function
    // -----------------------------------------------------------------------
    //
    init() {
        self.totalSupply = 0
        self.nextArtworkID = 1
        self.nextEditionID = 1
        self.nextGalleryID = 1
        self.nextUserID = 1

        self.CollectionStoragePath = /storage/EverbloomCollection
        self.CollectionPublicPath = /public/EverbloomCollection
        self.AdminStoragePath = /storage/EverbloomAdmin
        self.UserStoragePath = /storage/EverbloomUser

        emit ContractInitialized()
    }
}
