OmniAuth.config.test_mode = true
OmniAuth.config.add_mock(:developer, {
  uid: '12345',
  nickname: 'fooman',
  user_info: {
    first_name: 'Foo',
    last_name: 'Man'
  }
})