import Collectible from "../contracts/Collectible.cdc"
import Crave from "../contracts/Crave.cdc"
import Everbloom from "../contracts/Everbloom.cdc"
import FantastecNFT from "../contracts/FantastecNFT.cdc"
import FungibleToken from "../contracts/FungibleToken.cdc"
import FUSD from "../contracts/FUSD.cdc"
import Gaia from "../contracts/Gaia.cdc"
import KlktnNFT from "../contracts/KlktnNFT.cdc"
import MatrixWorldFlowFestNFT from "../contracts/MatrixWorldFlowFestNFT.cdc"
import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import Shard from "../contracts/Shard.cdc"
import StarlyCard from "../contracts/StarlyCard.cdc"
import TheFabricantMysteryBox_FF1 from "../contracts/TheFabricantMysteryBox_FF1.cdc"
import Vouchers from "../contracts/Vouchers.cdc"

// This script returns an array of all the NFT IDs in an account's collection.

pub fun main(address: Address): {String: UInt64} {
    let account = getAccount(address)
    let ret: {String: UInt64} = {}

    let shardCollectionRef = account.getCapability(/public/EternalShardCollection)!.borrow<&{Shard.ShardCollectionPublic}>()
        ?? panic("Could not borrow Shard receiver reference")
    ret["Shard"] = shardCollectionRef.getIDs()[0];

    let everbloomCollectionRef = account.getCapability(Everbloom.CollectionPublicPath)!.borrow<&{Everbloom.PrintCollectionPublic}>()
        ?? panic("Could not borrow Everbloom receiver reference")
    ret["Everbloom"] = everbloomCollectionRef.getIDs()[0];

    let fantastecCollectionRef = account.getCapability(FantastecNFT.CollectionPublicPath)!.borrow<&FantastecNFT.Collection{NonFungibleToken.CollectionPublic, FantastecNFT.FantastecNFTCollectionPublic}>()
        ?? panic("Could not borrow FantastecNFT receiver reference")
    ret["FantastecNFT"] = fantastecCollectionRef.getIDs()[0];

    let vouchersCollectionRef = account.getCapability(Vouchers.CollectionPublicPath)!.borrow<&{Vouchers.CollectionPublic}>()
        ?? panic("Could not borrow Vouchers receiver reference")
    ret["Vouchers"] = vouchersCollectionRef.getIDs()[0];

    let klktnCollectionRef = account.getCapability(KlktnNFT.CollectionPublicPath)!.borrow<&KlktnNFT.Collection{NonFungibleToken.CollectionPublic, KlktnNFT.KlktnNFTCollectionPublic}>()
        ?? panic("Could not borrow KlktnNFT receiver reference")
    ret["KlktnNFT"] = klktnCollectionRef.getIDs()[0];

    let gaiaCollectionRef = account.getCapability(Gaia.CollectionPublicPath)!.borrow<&{Gaia.CollectionPublic}>()
        ?? panic("Could not borrow Gaia receiver reference")
    ret["Gaia"] = gaiaCollectionRef.getIDs()[0];

    let starlyCardCollectionRef = account.getCapability(StarlyCard.CollectionPublicPath)!.borrow<&{NonFungibleToken.CollectionPublic}>()
        ?? panic("Could not borrow StarlyCard receiver reference")
    ret["StarlyCard"] = starlyCardCollectionRef.getIDs()[0];

    let theFabricanCollectionRef = account.getCapability(TheFabricantMysteryBox_FF1.CollectionPublicPath)!.borrow<&{TheFabricantMysteryBox_FF1.FabricantCollectionPublic}>()
        ?? panic("Could not borrow TheFabricantMysteryBox_FF1 receiver reference")
    ret["TheFabricant"] = theFabricanCollectionRef.getIDs()[0];

    let matrixWorldCollectionRef = account.getCapability(MatrixWorldFlowFestNFT.CollectionPublicPath)!.borrow<&MatrixWorldFlowFestNFT.Collection{NonFungibleToken.CollectionPublic, MatrixWorldFlowFestNFT.MatrixWorldFlowFestNFTCollectionPublic}>()
        ?? panic("Could not borrow MatrixWorldFlowFestNFT receiver reference")
    ret["MatrixWorld"] = matrixWorldCollectionRef.getIDs()[0];

    return ret;
}
