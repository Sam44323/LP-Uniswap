// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '@uniswap/v3-periphery/contracts/interfaces/ISwapRouter.sol';
import '@uniswap/v3-periphery/contracts/libraries/TransferHelper.sol';

contract Swappings{
  ISwapRouter public immutable swapRouter;

    // assumed token-hardcoded pools for swapping
    address public constant DAI = 0x5592EC0cfb4dbc12D3aB100b257153436a1f0FEa;
    address public constant LP = 0x75975fCd5D4bf763F9106b37E64eAC7f54323f7f;
    address public constant LINK = 0x01BE23585060835E02B77ef475b0Cc51aA1e0709;

    uint24 public constant poolFee = 3000; // pool transaction-fee

    constructor(ISwapRouter _swapRouter) {
        swapRouter = _swapRouter;
    }

}
