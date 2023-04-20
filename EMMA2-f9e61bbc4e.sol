// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts-upgradeable@4.8.3/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable@4.8.3/token/ERC20/extensions/ERC20SnapshotUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable@4.8.3/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable@4.8.3/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable@4.8.3/proxy/utils/UUPSUpgradeable.sol";

contract EMMA is Initializable, ERC20Upgradeable, ERC20SnapshotUpgradeable, OwnableUpgradeable, UUPSUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize() initializer public {
        __ERC20_init("EMMA", "EMM");
        __ERC20Snapshot_init();
        __Ownable_init();
        __UUPSUpgradeable_init();

        _mint(msg.sender, 16000000000000000000000000 * 10 ** decimals());
    }

    function snapshot() public onlyOwner {
        _snapshot();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function _authorizeUpgrade(address newImplementation)
        internal
        onlyOwner
        override
    {}

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        override(ERC20Upgradeable, ERC20SnapshotUpgradeable)
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}
