import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import StarlyCard from "../contracts/StarlyCard.cdc"

transaction(recipient: Address, starlyID: String) {
    let minter: &StarlyCard.NFTMinter

    prepare(signer: AuthAccount) {
        self.minter = signer.borrow<&StarlyCard.NFTMinter>(from: StarlyCard.MinterStoragePath)
            ?? panic("Could not borrow a reference to the NFT minter")
    }

    execute {
        let recipient = getAccount(recipient)
        let receiver = recipient
            .getCapability(StarlyCard.CollectionPublicPath)!
            .borrow<&{NonFungibleToken.CollectionPublic}>()
            ?? panic("Could not get receiver reference to the NFT Collection")
        self.minter.mintNFT(recipient: receiver, starlyID: starlyID)
    }
}
