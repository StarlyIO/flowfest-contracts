import FungibleToken from "../../contracts/FungibleToken.cdc"
import NonFungibleToken from "../../contracts/NonFungibleToken.cdc"
import NFTStorefront from "../../contracts/NFTStorefront.cdc"
import FlowToken from "../../contracts/FlowToken.cdc"
import TheFabricantMysteryBox_FF1 from "../../contracts/TheFabricantMysteryBox_FF1.cdc"

transaction(listingResourceID: UInt64, storefrontAddress: Address, buyPrice: UFix64) {
    let paymentVault: @FungibleToken.Vault
    let nftCollection: &TheFabricantMysteryBox_FF1.Collection{NonFungibleToken.Receiver}
    let storefront: &NFTStorefront.Storefront{NFTStorefront.StorefrontPublic}
    let listing: &NFTStorefront.Listing{NFTStorefront.ListingPublic}

    prepare(signer: AuthAccount) {
        if signer.borrow<&TheFabricantMysteryBox_FF1.Collection>(from: TheFabricantMysteryBox_FF1.CollectionStoragePath) == nil {
            signer.save(<-TheFabricantMysteryBox_FF1.createEmptyCollection(), to: TheFabricantMysteryBox_FF1.CollectionStoragePath)
            signer.link<&{TheFabricantMysteryBox_FF1.FabricantCollectionPublic}>(TheFabricantMysteryBox_FF1.CollectionPublicPath, target: TheFabricantMysteryBox_FF1.CollectionStoragePath)
        }

        self.storefront = getAccount(storefrontAddress)
            .getCapability<&NFTStorefront.Storefront{NFTStorefront.StorefrontPublic}>(NFTStorefront.StorefrontPublicPath)
            .borrow()
            ?? panic("Could not borrow Storefront from provided address")

        self.listing = self.storefront.borrowListing(listingResourceID: listingResourceID)
            ?? panic("No Offer with that ID in Storefront")
        let price = self.listing.getDetails().salePrice

        assert(buyPrice == price, message: "buyPrice is NOT same with salePrice")

        let flowTokenVault = signer.borrow<&FlowToken.Vault>(from: /storage/flowTokenVault)
            ?? panic("Cannot borrow FlowToken vault from signer storage")
        self.paymentVault <- flowTokenVault.withdraw(amount: price)

        self.nftCollection = signer.borrow<&TheFabricantMysteryBox_FF1.Collection{NonFungibleToken.Receiver}>(from: TheFabricantMysteryBox_FF1.CollectionStoragePath)
            ?? panic("Cannot borrow NFT collection receiver from account")
    }

    execute {
        let item <- self.listing.purchase(payment: <-self.paymentVault)
        self.nftCollection.deposit(token: <-item)
        self.storefront.cleanup(listingResourceID: listingResourceID)
    }
}
