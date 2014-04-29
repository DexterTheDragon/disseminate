OmniAuth.config.test_mode = true
OmniAuth.config.add_mock(:developer, {
  uid: '12345',
  nickname: 'fooman',
  'info' => {
    'name' => 'Bugs Bunny',
    'email' => 'bugsbunny@example.com',
    'nickname' => 'bugsbunny'
  },
})
