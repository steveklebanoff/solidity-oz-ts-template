import { accounts, contract } from "@openzeppelin/test-environment";
const testHelpers = require("@openzeppelin/test-helpers");
import { expect } from "chai";
import "mocha";

const TestableERC20 = contract.fromArtifact("TestableERC20");

describe("Example", async () => {
  it("dummytoken should work", async () => {
    const [joe] = accounts;
    const dummyToken = await TestableERC20.new();

    await dummyToken.mint(joe, testHelpers.ether("100").toString());

    const joesBalance = await dummyToken.balanceOf(joe);
    expect(joesBalance.toString()).to.eql(testHelpers.ether("100").toString());
  });
});
