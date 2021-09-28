const assert = require('assert');

const { Given, When, Then } = require(`@cucumber/cucumber`);
const { sandbox } = require('../../src/dummy');

Given('today is Sunday', function () {
  this.today = 'Sunday';
});

When("I ask whether it's Friday yet", function () {
  this.actualAnswer = sandbox(this.today);
});

Then('I should be told {string}', function (expectedAnswer) {
  assert.strictEqual(this.actualAnswer, expectedAnswer);
});
