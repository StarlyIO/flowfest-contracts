import Art from "../contracts/Art.cdc"
import ChainmonstersMarketplace from "../contracts/ChainmonstersMarketplace.cdc"
import ChainmonstersRewards from "../contracts/ChainmonstersRewards.cdc"
import FungibleToken from "../contracts/FungibleToken.cdc"
import FUSD from "../contracts/FUSD.cdc"
import KOTD from "../contracts/KOTD.cdc"
import Mynft from "../contracts/Mynft.cdc"
import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import Shard from "../contracts/Shard.cdc"
import StarlyCard from "../contracts/StarlyCard.cdc"
import StarlyCardMarket from "../contracts/StarlyCardMarket.cdc"
import Vouchers from "../contracts/Vouchers.cdc"

pub fun hasArt(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&{Art.CollectionPublic}>(Art.CollectionPublicPath)
        .check()
}

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

pub fun hasShard(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&Shard.Collection>(/public/ShardCollection)
        .check()
}

pub fun hasXtingles(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&{Vouchers.CollectionPublic}>(Vouchers.CollectionPublicPath)
        .check()
}

transaction {
    prepare(acct: AuthAccount) {
        if !hasArt(acct.address) {
             if acct.borrow<&{Art.CollectionPublic}>(from: Art.CollectionStoragePath) == nil {
                 acct.save(<-Art.createEmptyCollection(), to: Art.CollectionStoragePath)
             }
             acct.link<&{Art.CollectionPublic}>(Art.CollectionPublicPath, target: Art.CollectionStoragePath)
        }
        if !hasChainmonstersMarketplace(acct.address) {
             if acct.borrow<&ChainmonstersMarketplace.Collection>(from: ChainmonstersMarketplace.CollectionStoragePath) == nil {
                 acct.save(<-ChainmonstersMarketplace.createEmptyCollection(), to: ChainmonstersMarketplace.CollectionStoragePath)
             }
             acct.link<&ChainmonstersMarketplace.Collection{ChainmonstersMarketplace.CollectionPublic}>(ChainmonstersMarketplace.CollectionPublicPath, target: ChainmonstersMarketplace.CollectionStoragePath)
        }
        if !hasChainmonstersRewards(acct.address) {
             if acct.borrow<&ChainmonstersRewards.Collection>(from: /storage/ChainmonstersRewardCollection) == nil {
                 acct.save(<-ChainmonstersRewards.createEmptyCollection(), to: /storage/ChainmonstersRewardCollection)
             }
             acct.link<&{ChainmonstersRewards.ChainmonstersRewardCollectionPublic}>(/public/ChainmonstersRewardCollection, target: /storage/ChainmonstersRewardCollection)
        }
        if !hasFUSD(acct.address) {
            if acct.borrow<&FUSD.Vault>(from: /storage/fusdVault) == nil {
                acct.save(<-FUSD.createEmptyVault(), to: /storage/fusdVault)
            }
            acct.link<&FUSD.Vault{FungibleToken.Receiver}>(/public/fusdReceiver, target: /storage/fusdVault)
            acct.link<&FUSD.Vault{FungibleToken.Balance}>(/public/fusdBalance, target: /storage/fusdVault)
        }
        if !hasKOTD(acct.address) {
             if acct.borrow<&KOTD.Collection>(from: KOTD.CollectionStoragePath) == nil {
                 acct.save(<-KOTD.createEmptyCollection(), to: KOTD.CollectionStoragePath)
             }
             acct.link<&{KOTD.NiftoryCollectibleCollectionPublic}>(KOTD.CollectionPublicPath, target: KOTD.CollectionStoragePath)
        }
        if !hasMynft(acct.address) {
             if acct.borrow<&Mynft.Collection>(from: Mynft.CollectionStoragePath) == nil {
                 acct.save(<-Mynft.createEmptyCollection(), to: Mynft.CollectionStoragePath)
             }
             acct.link<&Mynft.Collection{NonFungibleToken.CollectionPublic, Mynft.MynftCollectionPublic}>(Mynft.CollectionPublicPath, target: Mynft.CollectionStoragePath)
        }
        if !hasShard(acct.address) {
             if acct.borrow<&Shard.Collection>(from: /storage/ShardCollectionh) == nil {
                 acct.save(<-Shard.createEmptyCollection(), to: /storage/ShardCollection)
             }
             acct.link<&{NonFungibleToken.CollectionPublic}>(/public/ShardCollection, target: /storage/ShardCollection)
        }
        if !hasStarlyCard(acct.address) {
            if acct.borrow<&StarlyCard.Collection>(from: StarlyCard.CollectionStoragePath) == nil {
                acct.save(<-StarlyCard.createEmptyCollection(), to: StarlyCard.CollectionStoragePath)
            }
            acct.link<&StarlyCard.Collection{NonFungibleToken.CollectionPublic, StarlyCard.StarlyCardCollectionPublic}>(StarlyCard.CollectionPublicPath, target: StarlyCard.CollectionStoragePath)
        }
        if !hasStarlyCardMarket(acct.address) {
             if acct.borrow<&StarlyCardMarket.Collection>(from: StarlyCardMarket.CollectionStoragePath) == nil {
                 acct.save(<-StarlyCardMarket.createEmptyCollection(), to: StarlyCardMarket.CollectionStoragePath)
             }
             acct.link<&StarlyCardMarket.Collection{StarlyCardMarket.CollectionPublic}>(StarlyCardMarket.CollectionPublicPath, target:StarlyCardMarket.CollectionStoragePath)
        }
        if !hasXtingles(acct.address) {
             if acct.borrow<&Vouchers.Collection>(from: Vouchers.CollectionStoragePath) == nil {
                 acct.save(<-Vouchers.createEmptyCollection(), to: Vouchers.CollectionStoragePath)
             }
             acct.link<&{Vouchers.CollectionPublic}>(Vouchers.CollectionPublicPath, target: Vouchers.CollectionStoragePath)
        }
    }
}
