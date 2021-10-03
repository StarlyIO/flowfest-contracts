import ChainmonstersMarketplace from "../contracts/ChainmonstersMarketplace.cdc"
import ChainmonstersRewards from "../contracts/ChainmonstersRewards.cdc"
import FungibleToken from "../contracts/FungibleToken.cdc"
import FUSD from "../contracts/FUSD.cdc"
import KOTD from "../contracts/KOTD.cdc"
import Mynft from "../contracts/Mynft.cdc"
import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import StarlyCard from "../contracts/StarlyCard.cdc"
import StarlyCardMarket from "../contracts/StarlyCardMarket.cdc"
import Vouchers from "../contracts/Vouchers.cdc"

pub fun hasChainmonstersMarketplace(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&ChainmonstersMarketplace.Collection{ChainmonstersMarketplace.CollectionPublic}>(ChainmonstersMarketplace.CollectionPublicPath)
        .check()
}

pub fun hasChainmonstersRewards(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&{ChainmonstersRewards.ChainmonstersRewardCollectionPublic}>(/public/ChainmonstersRewardCollection)
        .check()
}

pub fun hasFUSD(_ address: Address): Bool {
    let receiver: Bool = getAccount(address)
        .getCapability<&FUSD.Vault{FungibleToken.Receiver}>(/public/fusdReceiver)
        .check()
    let balance: Bool = getAccount(address)
        .getCapability<&FUSD.Vault{FungibleToken.Balance}>(/public/fusdBalance)
        .check()
    return receiver && balance
}

pub fun hasKOTD(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&{KOTD.NiftoryCollectibleCollectionPublic}>(KOTD.CollectionPublicPath)
        .check()
}

pub fun hasMynft(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&Mynft.Collection{Mynft.MynftCollectionPublic}>(Mynft.CollectionPublicPath)
        .check()
}

pub fun hasStarlyCard(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&StarlyCard.Collection{NonFungibleToken.CollectionPublic, StarlyCard.StarlyCardCollectionPublic}>(StarlyCard.CollectionPublicPath)
        .check()
}

pub fun hasStarlyCardMarket(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&StarlyCardMarket.Collection{StarlyCardMarket.CollectionPublic}>(StarlyCardMarket.CollectionPublicPath)
        .check()
}

pub fun hasXtingles(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&{Vouchers.CollectionPublic}>(Vouchers.CollectionPublicPath)
        .check()
}

pub fun main(address: Address): {String: Bool} {
    let ret: {String: Bool} = {}
    ret["ChainmonstersMarketplace"] = hasChainmonstersMarketplace(address)
    ret["ChainmonstersRewards"] = hasChainmonstersRewards(address)
    ret["FUSD"] = hasFUSD(address)
    ret["KOTD"] = hasKOTD(address)
    ret["Mynft"] = hasMynft(address)
    ret["StarlyCard"] = hasStarlyCard(address)
    ret["StarlyCardMarket"] = hasStarlyCardMarket(address)
    ret["Xtingles"] = hasXtingles(address)
    return ret
}
