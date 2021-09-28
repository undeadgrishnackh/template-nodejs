const { Dummy, sandbox } = require('../src/dummy.js');

describe('Something I wanna test...', () => {
  test('should be a Dummy class...', () => {
    const dummy = new Dummy();
    expect(dummy).toBeDefined();
  });
  test('should be a sandbox method...', () => {
    expect(sandbox()).toEqual('Nope');
  });
});
