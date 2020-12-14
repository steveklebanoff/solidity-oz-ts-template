mkdir -p build/flattened

# Supporting flattening contracts with multiple SPDX liceses is an open issue with truffle-flattener
# See https://github.com/nomiclabs/truffle-flattener/issues/55 for more info
OUTPUT=build/flattened/REPLACE_ME.flattened.sol
# Create a file with an custom UNLICENSED AND MIT SPDX-License-Identifier at the top of the file to support both OpenZeppelins MIT license and our proprietary license
echo $'// SPDX-License-Identifier: UNLICENSED AND MIT\n' > "$OUTPUT"

# Flatten contracts strip all duplicate SPDX-License-Identifier and all but one ABIEncoderV2
yarn --silent truffle-flattener contracts/REPLACE_ME.sol | awk '!/SPDX-License-Identifier/' | awk '/pragma experimental ABIEncoderV2;/&&c++>0 {next} 1' >> "$OUTPUT"
