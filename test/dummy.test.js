const Dummy = require('../src/dummy.js');

describe('Something I wanna test...', () => {
  test('should be something to expect...', () => {
    const dummy = new Dummy();
    expect(dummy).toBeDefined();
  });
});
